import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';

abstract interface class NutrientGoalRepository {
  Future<List<NutrientGoal>> getActiveGoals(DateTime date);

  Future<String> save(NutrientGoal goal);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}
