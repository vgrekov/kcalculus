import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/usda/_common/services/usda_service.dart';
import 'package:kcalculus/_data/usda/food/converters/usda_food_dto_converter.dart';
import 'package:kcalculus/_data/usda/food/models/usda_food_db_model.dart';
import 'package:kcalculus/_data/usda/food/models/usda_food_dto_model.dart';
import 'package:sqflite/sqflite.dart';

class UsdaFoodService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database => ref.read(usdaServiceProvider.future);

  Future<List<UsdaFoodDbModel>> search(
    String? query, {
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

    if (query?.isEmpty ?? true) {
      return getAll(limit: limit, offset: offset, txn: txn);
    }

    final executor = txn ?? await _database;

    var sql = '''
      SELECT
        *,
        INSTR(LOWER(name), LOWER(?)) AS name_rank,
        INSTR(LOWER(description), LOWER(?)) AS desc_rank
      FROM
        foods
      WHERE
        name_rank > 0
        OR desc_rank > 0
      ORDER BY
        CASE
          WHEN name_rank > 0 THEN name_rank
          ELSE 99999
        END,
        CASE
          WHEN name_rank > 0 THEN name_rank
          WHEN desc_rank > 0 THEN desc_rank
          ELSE 99999
        END,
        name,
        description
      ''';

    var arguments = <Object?>[
      query,
      query,
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
        .then((data) => data.map(UsdaFoodDbModel.fromJson).toList());
  }

  Future<List<UsdaFoodDbModel>> getAll({
    int? limit,
    int? offset,
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    var sql = '''
      SELECT *
      FROM
        foods
      ORDER BY
        name,
        description
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
        .then((data) => data.map(UsdaFoodDbModel.fromJson).toList());
  }

  Future<UsdaFoodDbModel?> getByFdcId(
    int fdcId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor
        .query(
          'foods',
          where: 'fdc_id = ?',
          whereArgs: [fdcId],
          limit: 1,
        )
        .then((data) => data.map(UsdaFoodDbModel.fromJson).firstOrNull);
  }

  void batchInsert(
    Iterable<UsdaFoodDtoModel> dtoModels, {
    required Batch batch,
  }) async {
    final converter = ref.read(usdaFoodDtoConverterProvider.notifier);

    dtoModels.map(converter.toDbModel).forEach(
          (dbModel) => batch.insert(
            'foods',
            dbModel.toJson(),
          ),
        );
  }

  Future<void> deleteAll({
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.delete('foods');
  }
}

final usdaFoodServiceProvider = NotifierProvider<UsdaFoodService, void>(
  UsdaFoodService.new,
);
