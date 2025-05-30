import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/macro_split.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_ratio.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'nutrient_data.freezed.dart';
part 'nutrient_data.g.dart';

const _kFatCaloriesPerGram = 9;
const _kCarbsCaloriesPerGram = 4;
const _kProteinCaloriesPerGram = 4;

@freezed
class NutrientData with _$NutrientData {
  const NutrientData._();

  const factory NutrientData._default({
    required List<NutrientAmount> nutrientAmounts,
    required Map<Nutrient, Amount> nutrientAmountsMap,
  }) = _NutrientData;

  factory NutrientData({
    required List<NutrientAmount> nutrientAmounts,
  }) =>
      NutrientData._default(
        nutrientAmounts: nutrientAmounts,
        nutrientAmountsMap: {
          for (final na in nutrientAmounts) na.nutrient: na.amount
        },
      );

  factory NutrientData.legacy({
    required double calories,
    required double fatInGrams,
    required double carbsInGrams,
    required double fiberInGrams,
    required double proteinInGrams,
  }) =>
      NutrientData(
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
              amount: Amount(
                unit: n.defaultUnit,
                value: 0,
              ),
            ),
          )
          .toList(),
    );
  }

  factory NutrientData.fromJson(Map<String, dynamic> json) =>
      _$NutrientDataFromJson(json);

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

  MacroSplit? getMacroSplit() {
    final fatCalories = fatInGrams * _kFatCaloriesPerGram;
    // Fiber has no caloric value!
    final carbsCalories =
        (carbsInGrams - fiberInGrams) * _kCarbsCaloriesPerGram;
    final proteinCalories = proteinInGrams * _kProteinCaloriesPerGram;
    final estimatedCalories = fatCalories + carbsCalories + proteinCalories;
    if (estimatedCalories > 0) {
      return MacroSplit(
        fat: fatCalories / estimatedCalories,
        carbs: carbsCalories / estimatedCalories,
        protein: proteinCalories / estimatedCalories,
      );
    }

    return null;
  }

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
    final factor = (ratio.perAmount.value * ratio.perAmount.unit.factor) /
        (ratio.totalAmount.value * ratio.totalAmount.unit.factor);
    return NutritionFacts(
      amount: ratio.perAmount,
      nutrientData: (this * factor).withPrecision(2),
    );
  }
}
