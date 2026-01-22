import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/meal/models/meal_db_model.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:sqflite/sqflite.dart';

class LocalMealService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database =>
      ref.read(localStorageServiceProvider.future);

  Future<bool> isEmpty({
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor
        .rawQuery(
          '''
      SELECT
        COUNT(id) AS meals_count
      FROM
        meals
      ''',
        )
        .then((data) => (data.first['meals_count'] as int) == 0);
  }

  Future<List<MealDbModel>> all({
    int? limit,
    int? offset,
    Transaction? txn,
  }) async {
    if (offset != null && limit == null) {
      throw ArgumentError('Argument "limit" is missing');
    }

    if (limit != null && limit <= 0) {
      throw ArgumentError(
        'If present, "limit" argument must be a positive integer',
      );
    }

    if (offset != null && offset < 0) {
      throw ArgumentError(
        'If present, "offset" argument must be a non-negative integer',
      );
    }

    final executor = txn ?? await _database;

    var sql = '''
      SELECT
        meals.*,
        foods.id AS edible_food_id,
        dishes.id AS edible_dish_id
      FROM
        meals
      LEFT JOIN foods ON
        foods.id = meals.edible_id
      LEFT JOIN dishes ON
        dishes.id = meals.edible_id
      ORDER BY
        meals.eaten_at ASC
      ''';

    var arguments = [];

    if (limit != null) {
      sql += 'LIMIT ? OFFSET ?';
      arguments.addAll([
        limit,
        offset ?? 0,
      ]);
    }

    return executor
        .rawQuery(sql, arguments)
        .then((data) => data.map(MealDbModel.fromJson).toList());
  }

  Future<List<MealDbModel>> getByDate(
    DateTime date, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor
        .rawQuery(
          '''
      SELECT
        meals.*,
        foods.id AS edible_food_id,
        dishes.id AS edible_dish_id
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
        meals.eaten_at DESC
      ''',
          [dt.formatDate(date)],
        )
        .then((data) => data.map(MealDbModel.fromJson).toList());
  }

  Future<void> add(
    MealDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.insert('meals', {
      ...model.toJson(),
      'created_at': dt.formatISO8601(DateTime.now()),
    });
  }

  Future<void> update(
    MealDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.update(
      'meals',
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
    final executor = txn ?? await _database;

    final count = await executor.update(
      'meals',
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
      'meals',
      {
        'deleted_at': null,
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }
}

final localMealServiceProvider = NotifierProvider<LocalMealService, void>(
  LocalMealService.new,
);
