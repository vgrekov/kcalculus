// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_db_model.freezed.dart';
part 'ingredient_db_model.g.dart';

@freezed
class IngredientDbModel with _$IngredientDbModel {
  factory IngredientDbModel({
    required String dish_id,
    required String edible_id,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? edible_food_id,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? edible_dish_id,
    required String amount_unit,
    required double amount_value,
  }) = _IngredientDbModel;

  factory IngredientDbModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientDbModelFromJson(json);
}
