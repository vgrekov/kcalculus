import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_nutrient_db_model.freezed.dart';
part 'default_nutrient_db_model.g.dart';

@freezed
sealed class DefaultNutrientDbModel with _$DefaultNutrientDbModel {
  const factory DefaultNutrientDbModel({
    required String name,
    required int position,
  }) = _DefaultNutrientDbModel;

  factory DefaultNutrientDbModel.fromJson(Map<String, dynamic> json) =>
      _$DefaultNutrientDbModelFromJson(json);
}
