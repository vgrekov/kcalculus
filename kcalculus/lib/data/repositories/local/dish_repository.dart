import 'dart:async';

import 'package:kcalculus/data/repositories/dish_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/dish_dao.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';

class LocalDishRepository implements DishRepository {
  LocalDishRepository({
    required LocalDishDao dishDao,
  }) : _dishDao = dishDao;

  final LocalDishDao _dishDao;

  @override
  Future<Dish?> getById(String id) async {
    return _dishDao.getById(id);
  }

  @override
  Future<Dish> save(Dish dish) async {
    final id = await _dishDao.save(dish);
    return (await getById(id))!;
  }
}
