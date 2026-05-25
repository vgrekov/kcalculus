import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/dish/models/ingredient_db_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalIngredientService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database =>
      ref.read(localStorageServiceProvider.future);

  Future<List<IngredientDbModel>> getByDish(
    String dishId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor
        .rawQuery(
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
      ORDER BY
        ingredients.sequence_number ASC
      ''',
          [dishId],
        )
        .then((data) => data.map(IngredientDbModel.fromJson).toList());
  }

  Future<Set<String>> getHierarchyByDish(
    String dishId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor
        .rawQuery(
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
        )
        .then((data) => data.map((record) => record['id'] as String).toSet());
  }

  Future<List<String>> getDishesByIngredient(
    String edibleId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor
        .rawQuery(
          '''
          SELECT
            ingredients.dish_id AS id
          FROM
            ingredients
          WHERE
            ingredients.edible_id = ?
          ''',
          [edibleId],
        )
        .then((data) => data.map((record) => record['id'] as String).toList());
  }

  Future<void> add(
    IngredientDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

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
    final executor = txn ?? await _database;

    final count = await executor.delete(
      'ingredients',
      where: 'dish_id = ?',
      whereArgs: [dishId],
    );

    return count > 0;
  }
}

final localIngredientServiceProvider =
    NotifierProvider<LocalIngredientService, void>(
      LocalIngredientService.new,
    );
