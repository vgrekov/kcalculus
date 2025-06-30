import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_dto_model.dart';
import 'package:kcalculus/data/services/usda/portion/usda_portion_dto_model.dart';

part 'usda_food_dto_model.freezed.dart';
part 'usda_food_dto_model.g.dart';

@freezed
sealed class UsdaFoodDtoModel with _$UsdaFoodDtoModel {
  const factory UsdaFoodDtoModel({
    required int fdcId,
    required String description,
    required String dataType,
    required int priority,
    List<UsdaPortionDtoModel>? portions,
    required List<UsdaNutrientDtoModel> nutrients,
  }) = _UsdaFoodDtoModel;

  factory UsdaFoodDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaFoodDtoModelFromJson(json);
}
