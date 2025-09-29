import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

part 'nutrient_goal.freezed.dart';
part 'nutrient_goal.g.dart';

@freezed
sealed class NutrientGoal with _$NutrientGoal {
  const factory NutrientGoal({
    String? id,
    required Nutrient nutrient,
    required Amount amount,
  }) = _NutrientGoal;

  factory NutrientGoal.fromJson(Map<String, dynamic> json) =>
      _$NutrientGoalFromJson(json);
}
