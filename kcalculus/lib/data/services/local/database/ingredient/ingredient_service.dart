import 'package:kcalculus/data/services/local/database/ingredient/ingredient_db_model.dart';
import 'package:sqflite/sqflite.dart';

class IngredientService {
  IngredientService(this.database);

  final Future<Database> database;

  Future<List<IngredientDbModel>> getByDish(
    String dishId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    return executor.rawQuery(
      '''
      SELECT
        ingredients.dish_id AS dish_id,
        ingredients.edible_id AS edible_id,
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

  Future<Set<String>> getHierarchyByDish(
    String dishId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    return executor.rawQuery(
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

  Future<void> add(
    IngredientDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    await executor.insert(
      'ingredients',
      model.toJson(),
    );
  }

  Future<void> saveForDish(
    List<IngredientDbModel> models,
    String dishId, {
    Transaction? txn,
  }) async {
    await deleteByDish(dishId, txn: txn);
    for (final model in models) {
      await add(model, txn: txn);
    }
  }

  Future<bool> deleteByDish(
    String dishId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    final count = await executor.delete(
      'ingredients',
      where: 'dish_id = ?',
      whereArgs: [dishId],
    );

    return count > 0;
  }
}
