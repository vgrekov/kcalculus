// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_facts_db_model.freezed.dart';
part 'nutrition_facts_db_model.g.dart';

@freezed
sealed class NutritionFactsDbModel with _$NutritionFactsDbModel {
  factory NutritionFactsDbModel({
    required String id,
    required String edible_id,
    required String amount_unit,
    required double amount_value,
  }) = _NutritionFactsDbModel;

  factory NutritionFactsDbModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsDbModelFromJson(json);
}
