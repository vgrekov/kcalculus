import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/food_repository.dart';
import 'package:kcalculus/data/storage/local/edible/dao/edible_dao.dart';
import 'package:kcalculus/data/storage/local/food/dao/food_dao.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';

class LocalFoodRepository extends FoodRepository {
  LocalFoodDao get _foodDao => ref.read(localFoodDaoProvider.notifier);

  LocalEdibleDao get _edibleDao => ref.read(localEdibleDaoProvider.notifier);

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

final localFoodRepositoryProvider =
    NotifierProvider<FoodRepository, ChangeSignal?>(
  LocalFoodRepository.new,
);
