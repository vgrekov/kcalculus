import 'package:kcalculus/data/services/local/database/dao/edible/edible_db_model.dart';
import 'package:kcalculus/data/services/local/database/dao/edible/edible_search_result_db_model.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:sqflite/sqflite.dart';

class EdibleDao {
  EdibleDao(this.database);

  final Future<Database> database;

  Future<void> add(
    EdibleDbModel model, {
    Transaction? txn,
  }) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    await executor.insert(
      'edibles',
      {
        ...model.toJson(),
        'created_at': dt.formatISO8601(DateTime.now()),
      },
    );
  }

  Future<void> update(
    EdibleDbModel model, {
    Transaction? txn,
  }) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    await executor.update(
      'edibles',
      {
        ...model.toJson(),
        'updated_at': dt.formatISO8601(DateTime.now()),
      },
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<List<EdibleSearchResultDbModel>> search(
    String? query, {
    bool onlyFoods = false,
    bool onlyDishes = false,
  }) async {
    final db = await database;
    return db.rawQuery(
      '''
      SELECT *
      FROM (
        SELECT
          results.id,
          results.name,
          results.description,
          results.created_at,
          results.updated_at,
          results.food_id,
          results.dish_id,
          MAX(results.eaten_at) AS last_eaten_at
        FROM (
          SELECT
            edibles.id AS id,
            edibles.name AS name,
            edibles.description AS description,
            edibles.created_at AS created_at,
            edibles.updated_at AS updated_at,
            foods.id AS food_id,
            dishes.id AS dish_id,
            CASE
              WHEN direct_meals.eaten_at IS NULL THEN ingredient_meals.eaten_at
              WHEN ingredient_meals.eaten_at IS NULL THEN direct_meals.eaten_at
              ELSE MAX(direct_meals.eaten_at, ingredient_meals.eaten_at)
            END AS eaten_at
          FROM
            edibles
          LEFT JOIN foods ON
            foods.id = edibles.id
          LEFT JOIN dishes ON
            dishes.id = edibles.id
          LEFT JOIN meals AS direct_meals ON
            direct_meals.edible_id = edibles.id
            AND direct_meals.deleted_at IS NULL
          LEFT JOIN ingredients ON
            ingredients.edible_id = edibles.id
          LEFT JOIN meals AS ingredient_meals ON
            ingredient_meals.edible_id = ingredients.dish_id
            AND ingredient_meals.deleted_at IS NULL
          WHERE
            edibles.deleted_at IS NULL
            AND (
              ? = 0
              OR foods.id IS NOT NULL
            )
            AND (
              ? = 0
              OR dishes.id IS NOT NULL
            )
            AND UPPER(edibles.name) LIKE '%' || UPPER(?) || '%'
        ) results
        GROUP BY
          results.id,
          results.name,
          results.description,
          results.created_at,
          results.updated_at,
          results.food_id,
          results.dish_id
      )
      ORDER BY
        CASE
          WHEN last_eaten_at IS NOT NULL THEN last_eaten_at
          WHEN updated_at IS NOT NULL THEN updated_at
          ELSE created_at
        END DESC
      ''',
      [
        onlyFoods ? 1 : 0,
        onlyDishes ? 1 : 0,
        query ?? '',
      ],
    ).then((data) => data.map(EdibleSearchResultDbModel.fromJson).toList());
  }

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) async {
    final db = await database;
    return db.rawQuery(
      '''
      SELECT
        COUNT(edibles.id) AS edibles_count
      FROM
        edibles
      WHERE
        edibles.id != ?
        AND edibles.deleted_at IS NULL
        AND UPPER(edibles.name) = UPPER(?)
        AND UPPER(edibles.description) = UPPER(?)
      ''',
      [
        exceptWithId ?? '',
        name,
        description,
      ],
    ).then((data) => (data.first['edibles_count'] as int) > 0);
  }

  Future<bool> delete(String id) async {
    final db = await database;
    final count = await db.update(
      'edibles',
      {
        'deleted_at': dt.formatISO8601(DateTime.now()),
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }

  Future<bool> restore(String id) async {
    final db = await database;
    final count = await db.update(
      'edibles',
      {
        'deleted_at': null,
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }

  Future<bool> wasEaten(String id) async {
    final db = await database;
    return db.rawQuery(
      '''
      WITH RECURSIVE hierarchy_up(id) AS (
        VALUES(?)
        UNION ALL
        SELECT
          ingredients.dish_id
        FROM
          ingredients,
          hierarchy_up
        WHERE
          ingredients.edible_id = hierarchy_up.id
      )
      SELECT
        1
      FROM
        meals,
        hierarchy_up
      WHERE
        meals.edible_id = hierarchy_up.id
        AND meals.deleted_at IS NULL
      LIMIT 1
      ''',
      [id],
    ).then((data) => data.isNotEmpty);
  }
}
