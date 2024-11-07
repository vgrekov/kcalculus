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
    });
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
          results.food_id,
          results.dish_id,
          MAX(results.eaten_at) AS last_eaten_at
        FROM (
          SELECT
            edibles.id AS id,
            edibles.name AS name,
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
          WHERE
            UPPER(edibles.name) LIKE '%' || UPPER(?) || '%'
        ) results
        GROUP BY
          results.id,
          results.name,
          results.food_id,
          results.dish_id
      )
      ORDER BY
        last_eaten_at DESC
      ''',
      [query ?? ''],
    ).then((data) => data.map(_fromSearchResultRecord).toList());
  }

  EdibleSearchResult _fromSearchResultRecord(Map<String, Object?> record) {
    return EdibleSearchResult(
      id: record['id'] as String,
      name: record['name'] as String,
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
