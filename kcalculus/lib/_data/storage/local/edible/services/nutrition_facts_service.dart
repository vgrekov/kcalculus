import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/_data/storage/local/edible/models/nutrition_facts_db_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalNutritionFactsService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database =>
      ref.read(localStorageServiceProvider.future);

  Future<List<NutritionFactsDbModel>> getByEdible(
    String edibleId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor.query(
      'nutrition_facts',
      where: 'edible_id = ?',
      whereArgs: [edibleId],
    ).then((data) => data.map(NutritionFactsDbModel.fromJson).toList());
  }

  Future<void> add(
    NutritionFactsDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.insert(
      'nutrition_facts',
      model.toJson(),
    );
  }

  Future<void> saveForEdible(
    List<NutritionFactsDbModel> models,
    String edibleId, {
    Transaction? txn,
  }) async {
    await deleteByEdible(edibleId, txn: txn);
    for (final model in models) {
      await add(model, txn: txn);
    }
  }

  Future<bool> deleteByEdible(
    String edibleId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    final count = await executor.delete(
      'nutrition_facts',
      where: 'edible_id = ?',
      whereArgs: [edibleId],
    );

    return count > 0;
  }
}

final localNutritionFactsServiceProvider =
    NotifierProvider<LocalNutritionFactsService, void>(
  LocalNutritionFactsService.new,
);
