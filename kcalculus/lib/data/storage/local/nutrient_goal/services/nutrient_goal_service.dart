import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/models/nutrient_goal_db_model.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:sqflite/sqflite.dart';

class LocalNutrientGoalService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database =>
      ref.read(localStorageServiceProvider.future);

  Future<bool> isEmpty({
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor.rawQuery(
      '''
      SELECT
        COUNT(id) AS ng_count
      FROM
        nutrient_goals
      ''',
    ).then((data) => (data.first['ng_count'] as int) == 0);
  }

  Future<List<NutrientGoalDbModel>> getActive(
    DateTime date, {
    Transaction? txn,
  }) async {
    final nextDay = dt.formatISO8601(
      DateTime(
        date.year,
        date.month,
        date.day,
      ).add(Duration(days: 1)),
    );

    final executor = txn ?? await _database;

    return executor.rawQuery(
      '''
      SELECT
        ng.*
      FROM
        nutrient_goals ng
        INNER JOIN (
          SELECT
            nutrient,
            MAX(created_at) AS max_created_at
          FROM
            nutrient_goals
          WHERE
            created_at < ?
            AND (
              deleted_at IS NULL
              OR deleted_at >= ?
            )
          GROUP BY
            nutrient
        ) ng_latest ON
          ng.nutrient = ng_latest.nutrient
          AND ng.created_at = ng_latest.max_created_at
      WHERE
        deleted_at IS NULL
        OR deleted_at >= ?
      ORDER BY
        ng.created_at ASC
      ''',
      [
        nextDay,
        nextDay,
        nextDay,
      ],
    ).then(
      (data) => data
          .map(NutrientGoalDbModel.fromJson)
          .fold(
            <String, NutrientGoalDbModel>{},
            (acc, model) => acc..putIfAbsent(model.nutrient, () => model),
          )
          .values
          .toList(),
    );
  }

  Future<void> add(
    NutrientGoalDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.insert(
      'nutrient_goals',
      {
        ...model.toJson(),
        'created_at': dt.formatISO8601(DateTime.now()),
      },
    );
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    final count = await executor.update(
      'nutrient_goals',
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
    final executor = txn ?? await _database;

    final count = await executor.update(
      'nutrient_goals',
      {
        'deleted_at': null,
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }
}

final localNutrientGoalServiceProvider =
    NotifierProvider<LocalNutrientGoalService, void>(
  LocalNutrientGoalService.new,
);
