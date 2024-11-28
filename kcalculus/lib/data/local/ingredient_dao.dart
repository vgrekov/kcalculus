import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/local/db.dart';
import 'package:kcalculus/data/local/dish_dao.dart';
import 'package:kcalculus/data/local/food_dao.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/units.dart';
import 'package:sqflite/sqflite.dart';

class LocalIngredientDao {
  final Database db;

  LocalIngredientDao({
    required this.db,
  });

  Future<void> add(Ingredient model, String dishId, {Transaction? txn}) async {
    DatabaseExecutor executor = txn ?? db;

    await executor.insert('ingredients', {
      'dish_id': dishId,
      ..._toRecord(model),
    });
  }

  Future<List<Ingredient>> getByDishId(
    String dishId, {
    required LocalFoodDao foodDao,
    required LocalDishDao dishDao,
  }) {
    return db.rawQuery(
      '''
      SELECT
        ingredients.amount_value AS amount_value,
        ingredients.amount_unit AS amount_unit,
        foods.id AS food_id,
        dishes.id AS dish_id
      FROM
        ingredients
      LEFT JOIN foods ON
        foods.id = ingredients.edible_id
      LEFT JOIN dishes ON
        dishes.id = ingredients.edible_id
      WHERE
        ingredients.dish_id = ?
      ''',
      [dishId],
    ).then((data) => Future.wait(data
        .map((record) => _fromRecord(
              record,
              foodDao: foodDao,
              dishDao: dishDao,
            ))
        .toList()));
  }

  Future<bool> deleteByDishId(String dishId, {Transaction? txn}) async {
    DatabaseExecutor executor = txn ?? db;

    final count = await executor.delete(
      'ingredients',
      where: 'dish_id = ?',
      whereArgs: [dishId],
    );

    return count > 0;
  }

  Future<void> save(List<Ingredient> models, String edibleId,
      {Transaction? txn}) async {
    deleteByDishId(edibleId, txn: txn);
    for (final model in models) {
      add(model, edibleId, txn: txn);
    }
  }

  Future<Ingredient> _fromRecord(
    Map<String, Object?> record, {
    required LocalFoodDao foodDao,
    required LocalDishDao dishDao,
  }) async {
    Edible? edible;
    if (record['food_id'] != null) {
      edible = await foodDao.getById(record['food_id'] as String);
    } else if (record['dish_id'] != null) {
      edible = await dishDao.getById(record['dish_id'] as String);
    }

    return Ingredient(
      edible: edible!,
      amount: Amount(
        unit: Unit.values
            .firstWhere((u) => u.name == record['amount_unit'] as String),
        value: record['amount_value'] as double,
      ),
    );
  }

  Map<String, Object?> _toRecord(Ingredient model) {
    return {
      'edible_id': model.edible.id!,
      'amount_value': model.amount.value,
      'amount_unit': model.amount.unit.name,
    };
  }
}

final localIngredientDaoProvider =
    Provider<Future<LocalIngredientDao>>((ref) async {
  final db = await ref.watch(dbProvider);
  return LocalIngredientDao(
    db: db,
  );
});
