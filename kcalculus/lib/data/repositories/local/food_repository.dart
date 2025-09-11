import 'dart:async';

import 'package:kcalculus/data/repositories/food_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/edible_dao.dart';
import 'package:kcalculus/data/repositories/local/dao/food_dao.dart';
import 'package:kcalculus/domain/models/food.dart';

class LocalFoodRepository implements FoodRepository {
  LocalFoodRepository({
    required LocalFoodDao foodDao,
    required LocalEdibleDao edibleDao,
    required StreamController<void> changeController,
  })  : _foodDao = foodDao,
        _edibleDao = edibleDao,
        _changeController = changeController;

  final LocalFoodDao _foodDao;

  final LocalEdibleDao _edibleDao;

  final StreamController<void> _changeController;

  @override
  Future<Food?> getById(String id) {
    return _foodDao.getById(id);
  }

  @override
  Future<Food> save(
    Food food, {
    bool skipAudit = false,
  }) async {
    final id = await _foodDao.save(
      food,
      skipAudit: skipAudit,
    );
    _changeController.add(null);
    return (await getById(id))!;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _edibleDao.delete(id);
    _changeController.add(null);
    return result;
  }

  @override
  Future<bool> restore(String id) async {
    final result = await _edibleDao.restore(id);
    _changeController.add(null);
    return result;
  }
}
