// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrient_amount_db_model.freezed.dart';
part 'nutrient_amount_db_model.g.dart';

@freezed
class NutrientAmountDbModel with _$NutrientAmountDbModel {
  factory NutrientAmountDbModel({
    required String nutrition_facts_id,
    required String nutrient,
    required String amount_unit,
    required double amount_value,
  }) = _NutrientAmountDbModel;

  factory NutrientAmountDbModel.fromJson(Map<String, dynamic> json) =>
      _$NutrientAmountDbModelFromJson(json);
}
