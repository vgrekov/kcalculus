import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/usda/_common/services/usda_service.dart';
import 'package:kcalculus/data/usda/portion/converters/usda_portion_dto_converter.dart';
import 'package:kcalculus/data/usda/portion/models/usda_portion_db_model.dart';
import 'package:kcalculus/data/usda/portion/models/usda_portion_dto_model.dart';
import 'package:sqflite/sqflite.dart';

class UsdaPortionService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database => ref.read(usdaServiceProvider.future);

  Future<List<UsdaPortionDbModel>> getByFdcId(
    int fdcId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor.query(
      'portions',
      where: 'fdc_id = ?',
      whereArgs: [fdcId],
    ).then((data) => data.map(UsdaPortionDbModel.fromJson).toList());
  }

  void batchInsert(
    Iterable<UsdaPortionDtoModel> dtoModels,
    int fdcId, {
    required Batch batch,
  }) async {
    final converter = ref.read(usdaPortionDtoConverterProvider.notifier);

    dtoModels
        .map(
          (dtoModel) => converter.toDbModel(dtoModel, fdcId),
        )
        .forEach(
          (dbModel) => batch.insert(
            'portions',
            dbModel.toJson(),
          ),
        );
  }

  Future<void> deleteAll({
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.delete('portions');
  }
}

final usdaPortionServiceProvider = NotifierProvider<UsdaPortionService, void>(
  UsdaPortionService.new,
);
