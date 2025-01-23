import 'package:kcalculus/data/repositories/local/converters/meal_coverter.dart';
import 'package:kcalculus/data/repositories/local/dao/dish_dao.dart';
import 'package:kcalculus/data/repositories/local/dao/food_dao.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalMealDao {
  LocalMealDao({
    required DatabaseService dbService,
    required LocalFoodDao foodDao,
    required LocalDishDao dishDao,
    required LocalMealConverter mealConverter,
  })  : _dbService = dbService,
        _foodDao = foodDao,
        _dishDao = dishDao,
        _mealConverter = mealConverter;

  final DatabaseService _dbService;

  final LocalFoodDao _foodDao;

  final LocalDishDao _dishDao;

  final LocalMealConverter _mealConverter;

  Future<List<Meal>> getByDate(DateTime date) {
    return _dbService.meal.getByDate(date).then(
          (data) => Future.wait(
            data.map(
              (dbModel) async {
                final Edible? edible;
                if (dbModel.edible_dish_id != null) {
                  edible = await _dishDao.getById(dbModel.edible_id);
                } else {
                  edible = await _foodDao.getById(dbModel.edible_id);
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
  }) {
    if (txn != null) {
      return _save(meal, txn: txn);
    } else {
      return _dbService.transaction(
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
        edible = await _dishDao.getById(dishId);
      } else {
        final foodId = await _foodDao.save(meal.edible as Food, txn: txn);
        edible = await _foodDao.getById(foodId);
      }

      meal = meal.copyWith(edible: edible!);
    }

    if (meal.id == null) {
      final id = generateId();

      await _dbService.meal.add(
        _mealConverter.toDbModel(meal, mealId: id),
        txn: txn,
      );

      meal = meal.copyWith(id: id);
    } else {
      await _dbService.meal.update(
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
    return _dbService.meal.delete(id, txn: txn);
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) {
    return _dbService.meal.restore(id, txn: txn);
  }
}
