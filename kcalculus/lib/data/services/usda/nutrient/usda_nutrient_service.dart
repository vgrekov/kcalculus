import 'dart:async';

import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_db_model.dart';
import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_dto_converter.dart';
import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_dto_model.dart';
import 'package:sqflite/sqflite.dart';

class UsdaNutrientService {
  const UsdaNutrientService(
    FutureOr<Database> database,
  ) : _database = database;

  final FutureOr<Database> _database;

  final _converter = const UsdaNutrientDtoConverter();

  Future<List<UsdaNutrientDbModel>> getByFdcId(
    int fdcId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor.query(
      'nutrients',
      where: 'fdc_id = ?',
      whereArgs: [fdcId],
    ).then((data) => data.map(UsdaNutrientDbModel.fromJson).toList());
  }

  void batchInsert(
    Iterable<UsdaNutrientDtoModel> dtoModels,
    int fdcId, {
    required Batch batch,
  }) async {
    dtoModels
        .map(
          (dtoModel) => _converter.toDbModel(dtoModel, fdcId),
        )
        .forEach(
          (dbModel) => batch.insert(
            'nutrients',
            dbModel.toJson(),
          ),
        );
  }

  Future<void> deleteAll({
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.delete('nutrients');
  }
}
