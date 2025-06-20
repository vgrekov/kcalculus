// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usda_nutrient_db_model.freezed.dart';
part 'usda_nutrient_db_model.g.dart';

@freezed
sealed class UsdaNutrientDbModel with _$UsdaNutrientDbModel {
  const factory UsdaNutrientDbModel({
    required int fdc_id,
    required String number,
    required double amount,
    required String unit_name,
  }) = _UsdaNutrientDbModel;

  factory UsdaNutrientDbModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaNutrientDbModelFromJson(json);
}
