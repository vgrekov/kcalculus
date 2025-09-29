import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/_common/repositories/dish_repository.dart';
import 'package:kcalculus/_data/storage/local/dish/dao/dish_dao.dart';
import 'package:kcalculus/_data/storage/local/edible/dao/edible_dao.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';

class LocalDishRepository extends DishRepository {
  LocalDishDao get _dishDao => ref.read(localDishDaoProvider.notifier);

  LocalEdibleDao get _edibleDao => ref.read(localEdibleDaoProvider.notifier);

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

    emitChangeSignal();

    return (await getById(id))!;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _edibleDao.delete(id);

    emitChangeSignal();

    return result;
  }

  @override
  Future<bool> restore(String id) async {
    final result = await _edibleDao.restore(id);

    emitChangeSignal();

    return result;
  }
}

final localDishRepositoryProvider =
    NotifierProvider<LocalDishRepository, ChangeSignal?>(
  LocalDishRepository.new,
);
