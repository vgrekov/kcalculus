import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/dao/nutrient_goal_dao.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';

class LocalNutrientGoalRepository extends NutrientGoalRepository {
  LocalNutrientGoalDao get _nutrientGoalDao =>
      ref.read(localNutrientGoalDaoProvider.notifier);

  @override
  Future<bool> isEmpty() => _nutrientGoalDao.isEmpty();

  @override
  Future<List<NutrientGoal>> getActiveGoals(DateTime date) {
    return _nutrientGoalDao.getActiveGoals(date);
  }

  @override
  Future<String> save(NutrientGoal goal) async {
    final result = await _nutrientGoalDao.save(goal);

    emitChangeSignal();

    return result;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _nutrientGoalDao.delete(id);

    emitChangeSignal();

    return result;
  }

  @override
  Future<bool> restore(String id) async {
    final result = await _nutrientGoalDao.restore(id);

    emitChangeSignal();

    return result;
  }
}

final localNutrientGoalRepositoryProvider =
    NotifierProvider<NutrientGoalRepository, ChangeSignal?>(
  LocalNutrientGoalRepository.new,
);
