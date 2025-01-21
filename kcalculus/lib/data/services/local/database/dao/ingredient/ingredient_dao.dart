import 'package:kcalculus/data/services/local/database/dao/ingredient/ingredient_db_model.dart';
import 'package:sqflite/sqflite.dart';

class IngredientDao {
  IngredientDao(this.database);

  final Future<Database> database;

  Future<void> add(
    IngredientDbModel model, {
    Transaction? txn,
  }) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    await executor.insert(
      'ingredients',
      model.toJson(),
    );
  }

  Future<List<IngredientDbModel>> getByDishId(String dishId) async {
    final db = await database;
    return db.rawQuery(
      '''
      SELECT
        ingredients.dish_id AS dish_id,
        ingredients.amount_value AS amount_value,
        ingredients.amount_unit AS amount_unit,
        foods.id AS edible_food_id,
        dishes.id AS edible_dish_id
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
    ).then((data) => data.map(IngredientDbModel.fromJson).toList());
  }

  Future<Set<String>> getHierarchyByDishId(String dishId) async {
    final db = await database;
    return db.rawQuery(
      '''
      WITH RECURSIVE hierarchy(id) AS (
        VALUES(?)
        UNION
        SELECT
          ingredients.edible_id
        FROM
          ingredients,
          hierarchy
        WHERE
          ingredients.dish_id = hierarchy.id
      )
      SELECT
        hierarchy.id AS id
      FROM
        hierarchy
      ''',
      [dishId],
    ).then((data) => data.map((record) => record['id'] as String).toSet());
  }

  Future<bool> deleteByDishId(String dishId, {Transaction? txn}) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    final count = await executor.delete(
      'ingredients',
      where: 'dish_id = ?',
      whereArgs: [dishId],
    );

    return count > 0;
  }

  Future<void> save(
    List<IngredientDbModel> models,
    String dishId, {
    Transaction? txn,
  }) async {
    await deleteByDishId(dishId, txn: txn);
    for (final model in models) {
      await add(model, txn: txn);
    }
  }
}
