import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

part 'nutrient_goal.freezed.dart';
part 'nutrient_goal.g.dart';

@freezed
class NutrientGoal with _$NutrientGoal {
  const factory NutrientGoal({
    String? id,
    required Nutrient nutrient,
    required Amount amount,
  }) = _NutrientGoal;

  factory NutrientGoal.fromJson(Map<String, dynamic> json) =>
      _$NutrientGoalFromJson(json);
}
