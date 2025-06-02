import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/view_models/nutrient_node.dart';

part 'nutrition_facts_record.freezed.dart';

@freezed
class NutritionFactsRecord with _$NutritionFactsRecord {
  const factory NutritionFactsRecord({
    required Amount perAmount,
    required List<NutrientNode> nodes,
  }) = _NutritionFactsRecord;

  factory NutritionFactsRecord.fromModel({
    required NutritionFacts model,
    required List<Nutrient> nutrientDefaults,
  }) {
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

    final nodes = <NutrientNode>[];

    final processedNutrients = <Nutrient>{};

    final defaultPositions = {
      for (final pair in nutrientDefaults.indexed) pair.$2: pair.$1,
    };

    final modelPositions = {
      for (final pair in model.nutrientData.nutrientAmounts.indexed)
        pair.$2.nutrient: pair.$1,
    };

    int compareNutrients(Nutrient a, Nutrient b) {
      int result = (defaultPositions[a] ?? nutrientDefaults.length) -
          (defaultPositions[b] ?? nutrientDefaults.length);

      if (result == 0) {
        result = (modelPositions[a] ??
                model.nutrientData.nutrientAmounts.length) -
            (modelPositions[b] ?? model.nutrientData.nutrientAmounts.length);
      }

      return result;
    }

    final topLevelNutrientAmounts = model.nutrientData.nutrientAmounts
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

      final amount = model.nutrientData.nutrientAmountsMap[nutrient];
      if (amount != null) {
        nodes.add(
          NutrientNode(
            nutrient: nutrient,
            amount: amount,
            level: level,
          ),
        );

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

    for (final na in model.nutrientData.nutrientAmounts) {
      if (!processedNutrients.contains(na.nutrient)) {
        nodes.add(
          NutrientNode(
            nutrient: na.nutrient,
            amount: na.amount,
          ),
        );
      }
    }

    return NutritionFactsRecord(
      perAmount: model.amount,
      nodes: nodes,
    );
  }
}
