// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_db_model.freezed.dart';
part 'meal_db_model.g.dart';

@freezed
class MealDbModel with _$MealDbModel {
  factory MealDbModel({
    required String id,
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
    required String eaten_at,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? deleted_at,
  }) = _MealDbModel;

  factory MealDbModel.fromJson(Map<String, dynamic> json) =>
      _$MealDbModelFromJson(json);
}
