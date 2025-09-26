import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/usda/_common/services/usda_service.dart';
import 'package:kcalculus/_data/usda/nutrient/converters/usda_nutrient_dto_converter.dart';
import 'package:kcalculus/_data/usda/nutrient/models/usda_nutrient_db_model.dart';
import 'package:kcalculus/_data/usda/nutrient/models/usda_nutrient_dto_model.dart';
import 'package:sqflite/sqflite.dart';

class UsdaNutrientService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database => ref.read(usdaServiceProvider.future);

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
    final converter = ref.read(usdaNutrientDtoConverterProvider.notifier);

    dtoModels
        .map(
          (dtoModel) => converter.toDbModel(dtoModel, fdcId),
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

final usdaNutrientServiceProvider = NotifierProvider<UsdaNutrientService, void>(
  UsdaNutrientService.new,
);
