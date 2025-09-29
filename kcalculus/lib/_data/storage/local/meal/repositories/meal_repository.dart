import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/_common/repositories/meal_repository.dart';
import 'package:kcalculus/_data/storage/local/meal/dao/meal_dao.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';

class LocalMealRepository extends MealRepository {
  LocalMealDao get _mealDao => ref.read(localMealDaoProvider.notifier);

  @override
  Future<List<Meal>> getByDate(DateTime date) {
    return _mealDao.getByDate(date);
  }

  @override
  Future<Meal> save(Meal meal) async {
    final result = await _mealDao.save(meal);

    emitChangeSignal();

    return result;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _mealDao.delete(id);

    emitChangeSignal();

    return result;
  }

  @override
  Future<bool> restore(String id) async {
    final result = await _mealDao.restore(id);

    emitChangeSignal();

    return result;
  }
}

final localMealRepositoryProvider =
    NotifierProvider<LocalMealRepository, ChangeSignal?>(
  LocalMealRepository.new,
);
