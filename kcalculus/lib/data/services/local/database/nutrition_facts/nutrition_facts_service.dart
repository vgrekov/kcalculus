import 'package:kcalculus/data/services/local/database/nutrition_facts/nutrition_facts_db_model.dart';
import 'package:sqflite/sqflite.dart';

class NutritionFactsService {
  NutritionFactsService(this.database);

  final Future<Database> database;

  Future<List<NutritionFactsDbModel>> getByEdible(
    String edibleId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

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
    final executor = txn ?? await database;

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
    final executor = txn ?? await database;

    final count = await executor.delete(
      'nutrition_facts',
      where: 'edible_id = ?',
      whereArgs: [edibleId],
    );

    return count > 0;
  }
}
