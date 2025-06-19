import 'dart:async';

import 'package:kcalculus/data/services/usda/portion/usda_portion_db_model.dart';
import 'package:kcalculus/data/services/usda/portion/usda_portion_dto_model.dart';
import 'package:sqflite/sqflite.dart';

class UsdaPortionService {
  const UsdaPortionService(
    FutureOr<Database> database,
  ) : _database = database;

  final FutureOr<Database> _database;

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
    dtoModels.map((dtoModel) => _fromDto(dtoModel, fdcId)).forEach(
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

  UsdaPortionDbModel _fromDto(UsdaPortionDtoModel dtoModel, int fdcId) {
    return UsdaPortionDbModel(
      fdc_id: fdcId,
      measure_unit_id: dtoModel.measureUnitId,
      amount: dtoModel.amount,
      gram_weight: dtoModel.gramWeight,
    );
  }
}
