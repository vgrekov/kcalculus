import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/default_nutrient/models/default_nutrient_db_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDefaultNutrientService
    extends AsyncNotifier<List<DefaultNutrientDbModel>> {
  @override
  FutureOr<List<DefaultNutrientDbModel>> build() async {
    final db = ref.watch(
      localStorageServiceProvider.selectAsync(
        (db) => db,
      ),
    );

    return _getAll(await db);
  }

  Future<Database> get _database =>
      ref.read(localStorageServiceProvider.future);

  Future<List<DefaultNutrientDbModel>> _getAll(
    DatabaseExecutor executor,
  ) async {
    return executor
        .query('default_nutrients')
        .then((data) => data.map(DefaultNutrientDbModel.fromJson).toList());
  }

  Future<void> saveAll(
    List<DefaultNutrientDbModel> models, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.delete('default_nutrients');

    final batch = executor.batch();

    for (final model in models) {
      batch.insert(
        'default_nutrients',
        model.toJson(),
      );
    }

    await batch.commit(noResult: true);

    state = AsyncData(models);
  }
}

final localDefaultNutrientServiceProvider =
    AsyncNotifierProvider<
      LocalDefaultNutrientService,
      List<DefaultNutrientDbModel>
    >(
      LocalDefaultNutrientService.new,
    );
