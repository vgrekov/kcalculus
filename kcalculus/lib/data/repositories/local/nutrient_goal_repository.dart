import 'package:kcalculus/data/repositories/local/dao/nutrient_goal_dao.dart';
import 'package:kcalculus/data/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';

class LocalNutrientGoalRepository implements NutrientGoalRepository {
  LocalNutrientGoalRepository({
    required LocalNutrientGoalDao nutrientGoalDao,
  }) : _nutrientGoalDao = nutrientGoalDao;

  final LocalNutrientGoalDao _nutrientGoalDao;

  @override
  Future<List<NutrientGoal>> getActiveGoals(DateTime date) {
    return _nutrientGoalDao.getActiveGoals(date);
  }

  @override
  Future<String> save(NutrientGoal goal) {
    return _nutrientGoalDao.save(goal);
  }

  @override
  Future<bool> delete(String id) {
    return _nutrientGoalDao.delete(id);
  }

  @override
  Future<bool> restore(String id) {
    return _nutrientGoalDao.restore(id);
  }
}
