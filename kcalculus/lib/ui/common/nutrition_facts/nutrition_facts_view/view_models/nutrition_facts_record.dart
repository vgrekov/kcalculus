import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/view_models/nutrient_node.dart';

part 'nutrition_facts_record.freezed.dart';

@freezed
sealed class NutritionFactsRecord with _$NutritionFactsRecord {
  const factory NutritionFactsRecord({
    required Amount perAmount,
    required List<NutrientNode> nodes,
  }) = _NutritionFactsRecord;

  factory NutritionFactsRecord.fromModel({
    required NutritionFacts model,
    required List<Nutrient> nutrientDefaults,
  }) =>
      NutritionFactsRecord(
        perAmount: model.amount,
        nodes: model.nutrientData
            .toRows(
              nutrientDefaults,
              (nutrient, amount, level) => NutrientNode(
                nutrient: nutrient,
                amount: amount,
                level: level,
              ),
            )
            .toList(),
      );
}
