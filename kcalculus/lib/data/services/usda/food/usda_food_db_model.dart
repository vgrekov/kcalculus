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
  }) = _UsdaFoodDbModel;

  factory UsdaFoodDbModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaFoodDbModelFromJson(json);
}
