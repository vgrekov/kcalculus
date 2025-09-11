import 'dart:async';

import 'package:kcalculus/data/repositories/dish_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/dish_dao.dart';
import 'package:kcalculus/data/repositories/local/dao/edible_dao.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';

class LocalDishRepository implements DishRepository {
  LocalDishRepository({
    required LocalDishDao dishDao,
    required LocalEdibleDao edibleDao,
    required StreamController<void> changeController,
  })  : _dishDao = dishDao,
        _edibleDao = edibleDao,
        _changeController = changeController;

  final LocalDishDao _dishDao;

  final LocalEdibleDao _edibleDao;

  final StreamController<void> _changeController;

  @override
  Future<Dish?> getById(String id) async {
    return _dishDao.getById(id);
  }

  @override
  Future<Dish> save(
    Dish dish, {
    bool skipAudit = false,
  }) async {
    final id = await _dishDao.save(
      dish,
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
