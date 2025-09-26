import 'package:freezed_annotation/freezed_annotation.dart';

part 'usda_nutrient_dto_model.freezed.dart';
part 'usda_nutrient_dto_model.g.dart';

@freezed
sealed class UsdaNutrientDtoModel with _$UsdaNutrientDtoModel {
  const factory UsdaNutrientDtoModel({
    required String number,
    required double amount,
    required String unitName,
  }) = _UsdaNutrientDtoModel;

  factory UsdaNutrientDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaNutrientDtoModelFromJson(json);
}
