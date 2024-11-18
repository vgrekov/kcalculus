import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/local/db.dart';
import 'package:kcalculus/data/local/food_dao.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/meal.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalMealDao implements MealDao {
  final Database db;
  final LocalFoodDao foodDao;

  LocalMealDao({
    required this.db,
    required this.foodDao,
  });

  @override
  Future<void> add(Meal model) async {
    final id = generateId();

    await db.transaction((txn) async {
      if (model.edible is Food) {
        await foodDao.save(model.edible as Food, txn: txn);
      } else if (model.edible is Dish) {
        // TODO: await dishDao.save(model.edible as Dish, txn: txn);
      }

      await txn.insert('meals', {
        'id': id,
        ..._toRecord(model),
      });
    });

    model.id = id;
  }

  @override
  Future<List<Meal>> getByDate(DateTime date) async {
    return db.rawQuery(
      '''
      SELECT
        meals.*,
        foods.id AS food_id,
        dishes.id AS dish_id
      FROM
        meals
      LEFT JOIN foods ON
        foods.id = meals.edible_id
      LEFT JOIN dishes ON
        dishes.id = meals.edible_id
      WHERE
        meals.deleted_at IS NULL
        AND STRFTIME('%d-%m-%Y', meals.eaten_at) = ?
      ORDER BY
        meals.eaten_at
      ''',
      [dt.formatDate(date)],
    ).then((data) => Future.wait(data.map(_fromRecord).toList()));
  }

  @override
  Future<void> update(Meal model) async {
    await db.update(
      'meals',
      _toRecord(model),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  @override
  Future<bool> delete(String id) async {
    final count = await db.update(
      'meals',
      {
        'deleted_at': dt.formatISO8601(DateTime.now()),
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }

  Future<Meal> _fromRecord(Map<String, Object?> record) async {
    Edible? edible;
    if (record['food_id'] != null) {
      edible = await foodDao.getById(record['food_id'] as String);
    } else if (record['dish_id'] != null) {
      // TODO: edible = dishDao.getById(record['dish_id'] as String);
    }

    return Meal(
      id: record['id'] as String,
      edible: edible!,
      amount: Amount(
        unit: Unit.values
            .firstWhere((u) => u.name == record['amount_unit'] as String),
        value: record['amount_value'] as double,
      ),
      eatenAt: dt.parseISO8601(record['eaten_at'] as String),
    );
  }

  Map<String, Object?> _toRecord(Meal model) {
    return {
      'edible_id': model.edible.id,
      'amount_value': model.amount.value,
      'amount_unit': model.amount.unit.name,
      'eaten_at': dt.formatISO8601(model.eatenAt),
    };
  }
}

final localMealDaoProvider = Provider<Future<LocalMealDao>>((ref) async {
  final db = await ref.watch(dbProvider);
  final foodDao = await ref.watch(localFoodDaoProvider);
  return LocalMealDao(
    db: db,
    foodDao: foodDao,
  );
});
