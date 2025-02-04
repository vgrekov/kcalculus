// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_facts_db_model.freezed.dart';
part 'nutrition_facts_db_model.g.dart';

@freezed
class NutritionFactsDbModel with _$NutritionFactsDbModel {
  factory NutritionFactsDbModel({
    required String edible_id,
    required String amount_unit,
    required double amount_value,
    required double calories,
    required double fat_in_grams,
    required double carbs_in_grams,
    required double fiber_in_grams,
    required double protein_in_grams,
  }) = _NutritionFactsDbModel;

  factory NutritionFactsDbModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsDbModelFromJson(json);
}
