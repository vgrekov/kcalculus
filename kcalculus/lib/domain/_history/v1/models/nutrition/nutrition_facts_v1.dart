import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_history/v1/models/nutrition/nutrient_data_v1.dart';

part 'nutrition_facts_v1.freezed.dart';
part 'nutrition_facts_v1.g.dart';

@freezed
sealed class NutritionFactsV1 with _$NutritionFactsV1 {
  const factory NutritionFactsV1({
    required Amount amount,
    required NutrientDataV1 nutrientData,
  }) = _NutritionFactsV1;

  factory NutritionFactsV1.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsV1FromJson(json);
}
