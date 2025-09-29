import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/edible/models/nutrient_amount_db_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalNutrientAmountService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database =>
      ref.read(localStorageServiceProvider.future);

  Future<List<NutrientAmountDbModel>> getByNutritionFacts(
    String nutritionFactsId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor.query(
      'nutrient_amounts',
      where: 'nutrition_facts_id = ?',
      whereArgs: [nutritionFactsId],
    ).then((data) => data.map(NutrientAmountDbModel.fromJson).toList());
  }

  Future<void> add(
    NutrientAmountDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.insert(
      'nutrient_amounts',
      model.toJson(),
    );
  }

  Future<void> addForNutritionFacts(
    List<NutrientAmountDbModel> models,
    String nutritionFactsId, {
    Transaction? txn,
  }) async {
    await Future.wait(
      models.map(
        (model) => add(model, txn: txn),
      ),
    );
  }

  Future<bool> deleteByNutritionFacts(
    String nutritionFactsId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    final count = await executor.delete(
      'nutrient_amounts',
      where: 'nutrition_facts_id = ?',
      whereArgs: [nutritionFactsId],
    );

    return count > 0;
  }
}

final localNutrientAmountServiceProvider =
    NotifierProvider<LocalNutrientAmountService, void>(
  LocalNutrientAmountService.new,
);
