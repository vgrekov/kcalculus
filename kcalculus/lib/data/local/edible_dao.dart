import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/local/db.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:sqflite/sqflite.dart';

class LocalEdibleDao implements EdibleDao {
  final Database db;

  LocalEdibleDao({
    required this.db,
  });

  Future<void> add(Edible model, {Transaction? txn}) async {
    DatabaseExecutor executor = txn ?? db;

    await executor.insert('edibles', {
      'id': model.id,
      'name': model.name,
      'description': model.description,
      'created_at': dt.formatISO8601(DateTime.now()),
    });
  }

  Future<void> update(Edible model, {Transaction? txn}) async {
    DatabaseExecutor executor = txn ?? db;

    await executor.update(
      'edibles',
      {
        'name': model.name,
        'description': model.description,
        'updated_at': dt.formatISO8601(DateTime.now()),
      },
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  @override
  Future<List<EdibleSearchResult>> search(String? query) {
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
      [query ?? ''],
    ).then((data) => data.map(_fromSearchResultRecord).toList());
  }

  @override
  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) {
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

  @override
  Future<bool> delete(String id) async {
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

  EdibleSearchResult _fromSearchResultRecord(Map<String, Object?> record) {
    return EdibleSearchResult(
      id: record['id'] as String,
      name: record['name'] as String,
      description: record['description'] as String,
      type: record['dish_id'] != null
          ? EdibleSearchResultType.dish
          : EdibleSearchResultType.food,
      lastEatenAt: record['last_eaten_at'] != null
          ? dt.parseISO8601(record['last_eaten_at'] as String)
          : null,
    );
  }
}

final localEdibleDaoProvider = Provider<Future<LocalEdibleDao>>((ref) async {
  final db = await ref.watch(dbProvider);
  return LocalEdibleDao(db: db);
});
