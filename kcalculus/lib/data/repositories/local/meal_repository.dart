import 'dart:async';

import 'package:kcalculus/data/repositories/local/dao/meal_dao.dart';
import 'package:kcalculus/data/repositories/meal_repository.dart';
import 'package:kcalculus/domain/models/meal.dart';

class LocalMealRepository implements MealRepository {
  LocalMealRepository({
    required LocalMealDao mealDao,
    required StreamController<void> changeController,
  })  : _mealDao = mealDao,
        _changeController = changeController;

  final LocalMealDao _mealDao;

  final StreamController<void> _changeController;

  @override
  Future<List<Meal>> getByDate(DateTime date) {
    return _mealDao.getByDate(date);
  }

  @override
  Future<Meal> save(Meal meal) async {
    final result = await _mealDao.save(meal);
    _changeController.add(null);
    return result;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _mealDao.delete(id);
    _changeController.add(null);
    return result;
  }

  @override
  Future<bool> restore(String id) async {
    final result = await _mealDao.restore(id);
    _changeController.add(null);
    return result;
  }
}
