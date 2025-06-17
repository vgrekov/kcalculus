import 'package:kcalculus/data/services/local/database/edible/edible_db_model.dart';
import 'package:kcalculus/data/services/local/database/edible/edible_search_result_db_model.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:sqflite/sqflite.dart';

class EdibleService {
  EdibleService(this.database);

  final Future<Database> database;

  Future<List<EdibleSearchResultDbModel>> search(
    String? query, {
    bool onlyFoods = false,
    bool onlyDishes = false,
    int? limit,
    int? offset,
    Transaction? txn,
  }) async {
    if (offset != null && limit == null) {
      throw ArgumentError('Argument "limit" is missing');
    }

    if (limit != null && limit <= 0) {
      throw ArgumentError(
          'If present, "limit" argument must be a positive integer');
    }

    if (offset != null && offset < 0) {
      throw ArgumentError(
          'If present, "offset" argument must be a non-negative integer');
    }

    final executor = txn ?? await database;

    var sql = '''
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
            meals.eaten_at AS eaten_at
          FROM
            edibles
          LEFT JOIN foods ON
            foods.id = edibles.id
          LEFT JOIN dishes ON
            dishes.id = edibles.id
          LEFT JOIN meals ON
            meals.edible_id = edibles.id
            AND meals.deleted_at IS NULL
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
            AND UPPER(edibles.name || ', ' || edibles.description) LIKE '%' || UPPER(?) || '%'
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
      ''';

    var arguments = [
      onlyFoods ? 1 : 0,
      onlyDishes ? 1 : 0,
      query ?? '',
    ];

    if (limit != null) {
      sql += 'LIMIT ? OFFSET ?';
      arguments.addAll([
        limit,
        offset ?? 0,
      ]);
    }

    return executor
        .rawQuery(sql, arguments)
        .then((data) => data.map(EdibleSearchResultDbModel.fromJson).toList());
  }

  Future<int> count(
    String? query, {
    bool onlyFoods = false,
    bool onlyDishes = false,
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    var sql = '''
      SELECT
        COUNT(edibles.id) AS edible_count
      FROM
        edibles
      LEFT JOIN foods ON
        foods.id = edibles.id
      LEFT JOIN dishes ON
        dishes.id = edibles.id
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
        AND UPPER(edibles.name || ', ' || edibles.description) LIKE '%' || UPPER(?) || '%'
      ''';

    var arguments = [
      onlyFoods ? 1 : 0,
      onlyDishes ? 1 : 0,
      query ?? '',
    ];

    return executor
        .rawQuery(sql, arguments)
        .then((data) => (data[0]['edible_count'] as int?) ?? 0);
  }

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    return executor.rawQuery(
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

  Future<bool> wasEaten(
    String id, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    return executor.rawQuery(
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

  Future<void> add(
    EdibleDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

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
    final executor = txn ?? await database;

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

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    final count = await executor.update(
      'edibles',
      {
        'deleted_at': dt.formatISO8601(DateTime.now()),
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    final count = await executor.update(
      'edibles',
      {
        'deleted_at': null,
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }
}
