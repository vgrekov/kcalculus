// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usda_food_db_model.freezed.dart';
part 'usda_food_db_model.g.dart';

@freezed
sealed class UsdaFoodDbModel with _$UsdaFoodDbModel {
  const factory UsdaFoodDbModel({
    required int fdc_id,
    required String name,
    @Default('') String description,
    required String data_type,
    required int priority,
    String? nf_preview_calories_unit,
    double? nf_preview_calories_value,
    String? nf_preview_fat_unit,
    double? nf_preview_fat_value,
    String? nf_preview_carbs_unit,
    double? nf_preview_carbs_value,
    String? nf_preview_protein_unit,
    double? nf_preview_protein_value,
    String? nf_preview_fiber_unit,
    double? nf_preview_fiber_value,
  }) = _UsdaFoodDbModel;

  factory UsdaFoodDbModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaFoodDbModelFromJson(json);
}
