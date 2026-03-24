import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/macro_split.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_ratio.dart';

part 'nutrient_data.freezed.dart';
part 'nutrient_data.g.dart';

@freezed
sealed class NutrientData with _$NutrientData {
  const NutrientData._();

  const factory NutrientData.$default({
    required List<NutrientAmount> nutrientAmounts,
    required Map<Nutrient, Amount> nutrientAmountsMap,
  }) = _NutrientData;

  factory NutrientData({
    required List<NutrientAmount> nutrientAmounts,
  }) => NutrientData.$default(
    nutrientAmounts: nutrientAmounts,
    nutrientAmountsMap: {
      for (final na in nutrientAmounts) na.nutrient: na.amount,
    },
  );

  factory NutrientData.legacy({
    required double calories,
    required double fatInGrams,
    required double carbsInGrams,
    required double fiberInGrams,
    required double proteinInGrams,
  }) => NutrientData(
    nutrientAmounts: [
      NutrientAmount(
        nutrient: Nutrient.energy,
        amount: Amount(
          unit: Unit.calorie,
          value: calories,
        ),
      ),
      NutrientAmount(
        nutrient: Nutrient.fat,
        amount: Amount(
          unit: Unit.gram,
          value: fatInGrams,
        ),
      ),
      NutrientAmount(
        nutrient: Nutrient.totalCarbs,
        amount: Amount(
          unit: Unit.gram,
          value: carbsInGrams,
        ),
      ),
      NutrientAmount(
        nutrient: Nutrient.fiber,
        amount: Amount(
          unit: Unit.gram,
          value: fiberInGrams,
        ),
      ),
      NutrientAmount(
        nutrient: Nutrient.protein,
        amount: Amount(
          unit: Unit.gram,
          value: proteinInGrams,
        ),
      ),
    ],
  );

  factory NutrientData.empty() {
    return NutrientData(nutrientAmounts: []);
  }

  factory NutrientData.zeros(List<Nutrient> nutrients) {
    return NutrientData(
      nutrientAmounts: nutrients
          .map(
            (n) => NutrientAmount(
              nutrient: n,
              amount: Amount.zero(
                unit: n.defaultUnit,
              ),
            ),
          )
          .toList(),
    );
  }

  factory NutrientData.fromJson(Map<String, dynamic> json) =>
      _$NutrientDataFromJson(json);

  Iterable<T> toRows<T>(
    List<Nutrient> defaults,
    T Function(Nutrient, Amount, int) rowBuilder,
  ) sync* {
    final partsOf = <Nutrient, List<Nutrient>>{};
    for (final nutrient in Nutrient.values) {
      if (nutrient.partOf != null) {
        partsOf
            .putIfAbsent(
              nutrient.partOf!,
              () => [],
            )
            .add(nutrient);
      }
    }

    final processedNutrients = <Nutrient>{};

    final defaultPositions = {
      for (final pair in defaults.indexed) pair.$2: pair.$1,
    };

    final modelPositions = {
      for (final pair in nutrientAmounts.indexed) pair.$2.nutrient: pair.$1,
    };

    int compareNutrients(Nutrient a, Nutrient b) {
      int result =
          (defaultPositions[a] ?? defaults.length) -
          (defaultPositions[b] ?? defaults.length);

      if (result == 0) {
        result =
            (modelPositions[a] ?? nutrientAmounts.length) -
            (modelPositions[b] ?? nutrientAmounts.length);
      }

      return result;
    }

    final topLevelNutrientAmounts =
        nutrientAmounts
            .where((na) => na.nutrient.partOf == null)
            .map((na) => na.nutrient)
            .toList()
          ..sort(compareNutrients);

    final stack = <(Nutrient, int)>[
      ...topLevelNutrientAmounts.reversed.map(
        (n) => (n, 0),
      ),
    ];

    while (stack.isNotEmpty) {
      var (nutrient, level) = stack.removeLast();

      final amount = nutrientAmountsMap[nutrient];
      if (amount != null) {
        yield rowBuilder(nutrient, amount, level);

        processedNutrients.add(nutrient);

        level++;
      }

      final parts = partsOf[nutrient];
      if (parts != null) {
        stack.addAll(
          (parts..sort(compareNutrients)).reversed.map(
            (n) => (n, level),
          ),
        );
      }
    }

    for (final na in nutrientAmounts) {
      if (!processedNutrients.contains(na.nutrient)) {
        yield rowBuilder(na.nutrient, na.amount, 0);
      }
    }
  }

  double get calories => _nutrientValue(Nutrient.energy, Unit.calorie);

  double get fatInGrams => _nutrientValue(Nutrient.fat, Unit.gram);

  double get carbsInGrams => _nutrientValue(Nutrient.totalCarbs, Unit.gram);

  double get fiberInGrams => _nutrientValue(Nutrient.fiber, Unit.gram);

  double get proteinInGrams => _nutrientValue(Nutrient.protein, Unit.gram);

  double _nutrientValue(Nutrient nutrient, Unit unit) {
    return nutrientAmountsMap[nutrient]?.tryConvert(unit)?.value ?? 0;
  }

  NutrientData operator +(NutrientData other) {
    if (other.nutrientAmounts.isEmpty) {
      return this;
    }

    if (nutrientAmounts.isEmpty) {
      return other;
    }

    final otherNutrientAmountsMap = {
      for (final na in other.nutrientAmounts) na.nutrient: na,
    };

    return NutrientData(
      nutrientAmounts: [
        ...nutrientAmounts.map(
          (na) {
            final otherNa = otherNutrientAmountsMap.remove(na.nutrient);

            return otherNa != null ? na + otherNa : na;
          },
        ),
        ...other.nutrientAmounts.where(
          (na) => otherNutrientAmountsMap.containsKey(na.nutrient),
        ),
      ],
    );
  }

  NutrientData operator *(double factor) {
    if (factor == 1) return this;

    return NutrientData(
      nutrientAmounts: nutrientAmounts
          .map(
            (na) => na * factor,
          )
          .toList(),
    );
  }

  MacroSplit? getMacroSplit() => MacroSplit.fromAmounts(
    fat: nutrientAmountsMap[Nutrient.fat],
    carbs: nutrientAmountsMap[Nutrient.totalCarbs],
    protein: nutrientAmountsMap[Nutrient.protein],
    fiber: nutrientAmountsMap[Nutrient.fiber],
  );

  NutrientData withPrecision(int fractionDigits, [bool round = true]) {
    return NutrientData(
      nutrientAmounts: nutrientAmounts
          .map(
            (na) => NutrientAmount(
              nutrient: na.nutrient,
              amount: na.amount.withPrecision(fractionDigits, round),
            ),
          )
          .toList(),
    );
  }

  NutritionFacts toFacts(NutritionRatio ratio) {
    final factor =
        (ratio.perAmount.value * ratio.perAmount.unit.factor) /
        (ratio.totalAmount.value * ratio.totalAmount.unit.factor);
    return NutritionFacts(
      amount: ratio.perAmount,
      nutrientData: (this * factor).withPrecision(2),
    );
  }
}
