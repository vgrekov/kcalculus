import 'dart:async';

import 'package:kcalculus/data/repositories/food_container_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/food_container_dao.dart';
import 'package:kcalculus/domain/models/food_container.dart';

class LocalContainerRepository implements FoodContainerRepository {
  LocalContainerRepository({
    required LocalFoodContainerDao containerDao,
    required StreamController<void> changeController,
  })  : _containerDao = containerDao,
        _changeController = changeController;

  final LocalFoodContainerDao _containerDao;

  final StreamController<void> _changeController;

  @override
  Future<List<FoodContainer>> search(
    String? query, {
    int? limit,
    int? offset,
  }) {
    return _containerDao.search(
      query,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<FoodContainer?> getById(String id) {
    return _containerDao.getById(id);
  }

  @override
  Future<FoodContainer> save(FoodContainer container) async {
    final id = await _containerDao.save(container);
    _changeController.add(null);
    return (await getById(id))!;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _containerDao.delete(id);
    _changeController.add(null);
    return result;
  }

  @override
  Future<bool> restore(String id) async {
    final result = await _containerDao.restore(id);
    _changeController.add(null);
    return result;
  }
}
