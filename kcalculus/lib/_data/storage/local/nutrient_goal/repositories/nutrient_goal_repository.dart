import 'dart:async';

import 'package:kcalculus/_data/storage/_common/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/_data/storage/local/nutrient_goal/dao/nutrient_goal_dao.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';

class LocalNutrientGoalRepository implements NutrientGoalRepository {
  LocalNutrientGoalRepository({
    required LocalNutrientGoalDao nutrientGoalDao,
    required StreamController<void> changeController,
  })  : _nutrientGoalDao = nutrientGoalDao,
        _changeController = changeController;

  final LocalNutrientGoalDao _nutrientGoalDao;

  final StreamController<void> _changeController;

  @override
  Future<List<NutrientGoal>> getActiveGoals(DateTime date) {
    return _nutrientGoalDao.getActiveGoals(date);
  }

  @override
  Future<String> save(NutrientGoal goal) async {
    final result = await _nutrientGoalDao.save(goal);
    _changeController.add(null);
    return result;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _nutrientGoalDao.delete(id);
    _changeController.add(null);
    return result;
  }

  @override
  Future<bool> restore(String id) async {
    final result = await _nutrientGoalDao.restore(id);
    _changeController.add(null);
    return result;
  }
}
