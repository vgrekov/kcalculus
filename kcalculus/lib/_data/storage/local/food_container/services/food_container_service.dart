import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/local/_common/database.dart';
import 'package:kcalculus/_data/storage/local/food_container/models/food_container_db_model.dart';
import 'package:kcalculus/domain/utils/page_config.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:sqflite/sqflite.dart';

class LocalFoodContainerService extends Notifier<void> {
  @override
  void build() {}

  Future<List<FoodContainerDbModel>> search(
    String? query, {
    PageConfig<FoodContainerDbModel>? pageConfig,
    Transaction? txn,
  }) async {
    final executor = txn ?? await database(ref);

    var sql = '''
      SELECT
        id,
        name,
        description,
        weight_unit,
        weight_value,
        created_at,
        updated_at
      FROM
        food_containers
      WHERE
        deleted_at IS NULL
        AND UPPER(name) LIKE '%' || UPPER(?) || '%'
      ORDER BY
        CASE
          WHEN updated_at IS NOT NULL THEN updated_at
          ELSE created_at
        END DESC
      ''';

    var arguments = <Object?>[
      query ?? '',
    ];

    if (pageConfig != null) {
      sql += 'LIMIT ? OFFSET ?';
      arguments.addAll([
        pageConfig.size,
        pageConfig.offset ?? 0,
      ]);
    }

    return executor
        .rawQuery(sql, arguments)
        .then((data) => data.map(FoodContainerDbModel.fromJson).toList());
  }

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
    Transaction? txn,
  }) async {
    final executor = txn ?? await database(ref);

    return executor.rawQuery(
      '''
      SELECT
        COUNT(id) AS containers_count
      FROM
        food_containers
      WHERE
        id != ?
        AND deleted_at IS NULL
        AND UPPER(name) = UPPER(?)
        AND UPPER(description) = UPPER(?)
      ''',
      [
        exceptWithId ?? '',
        name,
        description,
      ],
    ).then((data) => (data.first['containers_count'] as int) > 0);
  }

  Future<FoodContainerDbModel?> getById(
    String id, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database(ref);

    return executor.rawQuery(
      '''
      SELECT
        id,
        name,
        description,
        weight_unit,
        weight_value,
        created_at,
        updated_at
      FROM
        food_containers
      WHERE
        id = ?
      ''',
      [id],
    ).then((data) => data.map(FoodContainerDbModel.fromJson).firstOrNull);
  }

  Future<void> add(
    FoodContainerDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database(ref);

    await executor.insert(
      'food_containers',
      {
        ...model.toJson(),
        'created_at': dt.formatISO8601(DateTime.now()),
      },
    );
  }

  Future<void> update(
    FoodContainerDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database(ref);

    await executor.update(
      'food_containers',
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
    final executor = txn ?? await database(ref);

    final count = await executor.update(
      'food_containers',
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
    final executor = txn ?? await database(ref);

    final count = await executor.update(
      'food_containers',
      {
        'deleted_at': null,
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }
}

final localFoodContainerServiceProvider =
    NotifierProvider<LocalFoodContainerService, void>(
  LocalFoodContainerService.new,
);
