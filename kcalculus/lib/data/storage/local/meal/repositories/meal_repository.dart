import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/local/meal/dao/meal_dao.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';

class LocalMealRepository extends MealRepository {
  LocalMealDao get _mealDao => ref.read(localMealDaoProvider.notifier);

  @override
  Future<bool> isEmpty() => _mealDao.isEmpty();

  @override
  Future<List<Meal>> getAll({
    PageConfig<Meal>? pageConfig,
  }) {
    return _mealDao.getAll(
      limit: pageConfig?.size,
      offset: pageConfig?.offset,
    );
  }

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
