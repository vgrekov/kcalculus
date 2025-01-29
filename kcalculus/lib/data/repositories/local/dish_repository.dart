import 'dart:async';

import 'package:kcalculus/data/repositories/dish_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/dish_dao.dart';
import 'package:kcalculus/data/repositories/local/dao/edible_dao.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';

class LocalDishRepository implements DishRepository {
  LocalDishRepository({
    required LocalDishDao dishDao,
    required LocalEdibleDao edibleDao,
  })  : _dishDao = dishDao,
        _edibleDao = edibleDao;

  final LocalDishDao _dishDao;

  final LocalEdibleDao _edibleDao;

  @override
  Future<Dish?> getById(String id) async {
    return _dishDao.getById(id);
  }

  @override
  Future<Dish> save(Dish dish) async {
    final id = await _dishDao.save(dish);
    return (await getById(id))!;
  }

  @override
  Future<bool> delete(String id) {
    return _edibleDao.delete(id);
  }

  @override
  Future<bool> restore(String id) {
    return _edibleDao.restore(id);
  }
}
