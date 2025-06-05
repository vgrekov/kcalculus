// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrient_goal_db_model.freezed.dart';
part 'nutrient_goal_db_model.g.dart';

@freezed
class NutrientGoalDbModel with _$NutrientGoalDbModel {
  const factory NutrientGoalDbModel({
    required String id,
    required String nutrient,
    required String amount_unit,
    required double amount_value,
  }) = _NutrientGoalDbModel;

  factory NutrientGoalDbModel.fromJson(Map<String, dynamic> json) =>
      _$NutrientGoalDbModelFromJson(json);
}
