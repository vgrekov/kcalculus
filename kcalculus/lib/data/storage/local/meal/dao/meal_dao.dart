import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/dish/dao/dish_dao.dart';
import 'package:kcalculus/data/storage/local/food/dao/food_dao.dart';
import 'package:kcalculus/data/storage/local/meal/converters/meal_coverter.dart';
import 'package:kcalculus/data/storage/local/meal/services/meal_service.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalMealDao extends Notifier<void> {
  @override
  void build() {}

  LocalMealService get _mealService =>
      ref.read(localMealServiceProvider.notifier);

  LocalFoodDao get _foodDao => ref.read(localFoodDaoProvider.notifier);

  LocalDishDao get _dishDao => ref.read(localDishDaoProvider.notifier);

  LocalMealConverter get _mealConverter =>
      ref.read(localMealConverterProvider.notifier);

  Future<List<Meal>> getByDate(
    DateTime date, {
    Transaction? txn,
  }) {
    return _mealService.getByDate(date, txn: txn).then(
          (data) => Future.wait(
            data.map(
              (dbModel) async {
                final Edible? edible;
                if (dbModel.edible_dish_id != null) {
                  edible = await _dishDao.getById(
                    dbModel.edible_id,
                    txn: txn,
                  );
                } else {
                  edible = await _foodDao.getById(
                    dbModel.edible_id,
                    txn: txn,
                  );
                }

                return _mealConverter.toModel(dbModel, edible!);
              },
            ).toList(),
          ),
        );
  }

  Future<Meal> save(
    Meal meal, {
    Transaction? txn,
  }) async {
    if (txn != null) {
      return _save(meal, txn: txn);
    } else {
      final db = await ref.read(localStorageServiceProvider.future);

      return db.transaction(
        (txn) => _save(meal, txn: txn),
      );
    }
  }

  Future<Meal> _save(
    Meal meal, {
    required Transaction txn,
  }) async {
    if (meal.edible.id == null) {
      final Edible? edible;
      if (meal.edible is Dish) {
        final dishId = await _dishDao.save(meal.edible as Dish, txn: txn);
        edible = await _dishDao.getById(dishId, txn: txn);
      } else {
        final foodId = await _foodDao.save(meal.edible as Food, txn: txn);
        edible = await _foodDao.getById(foodId, txn: txn);
      }

      meal = meal.copyWith(edible: edible!);
    }

    if (meal.id == null) {
      final id = generateId();

      await _mealService.add(
        _mealConverter.toDbModel(meal, mealId: id),
        txn: txn,
      );

      meal = meal.copyWith(id: id);
    } else {
      await _mealService.update(
        _mealConverter.toDbModel(meal),
        txn: txn,
      );
    }

    return meal;
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) {
    return _mealService.delete(id, txn: txn);
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) {
    return _mealService.restore(id, txn: txn);
  }
}

final localMealDaoProvider = NotifierProvider<LocalMealDao, void>(
  LocalMealDao.new,
);
