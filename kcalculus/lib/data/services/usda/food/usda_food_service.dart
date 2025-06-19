import 'dart:async';

import 'package:kcalculus/data/services/usda/food/usda_food_db_model.dart';
import 'package:kcalculus/data/services/usda/food/usda_food_dto_model.dart';
import 'package:kcalculus/utils/string_ext.dart';
import 'package:sqflite/sqflite.dart';

class UsdaFoodService {
  static final _kDescriptionDelim = RegExp(r'\s*,\s*');

  const UsdaFoodService(
    FutureOr<Database> database,
  ) : _database = database;

  final FutureOr<Database> _database;

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
    dtoModels.map(_fromDto).forEach(
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

  UsdaFoodDbModel _fromDto(UsdaFoodDtoModel dtoModel) {
    final (name, description) = _splitDescription(dtoModel.description);
    return UsdaFoodDbModel(
      fdc_id: dtoModel.fdcId,
      name: name,
      description: description,
      data_type: dtoModel.dataType,
      priority: dtoModel.priority,
    );
  }

  (String, String) _splitDescription(String description) {
    final chunks = description
        .trim()
        .split(_kDescriptionDelim)
        .where((c) => c.isNotEmpty)
        .toList();
    return (
      chunks.firstOrNull?.capitalize() ?? '',
      chunks.isEmpty ? '' : chunks.sublist(1).join(', ').capitalize(),
    );
  }
}
