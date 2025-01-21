import 'package:kcalculus/data/services/local/database/dao/nutrition_facts/nutrition_facts_db_model.dart';
import 'package:sqflite/sqflite.dart';

class NutritionFactsDao {
  NutritionFactsDao(this.database);

  final Future<Database> database;

  Future<List<NutritionFactsDbModel>> getByEdible(String edibleId) async {
    final db = await database;

    return db.query(
      'nutrition_facts',
      where: 'edible_id = ?',
      whereArgs: [edibleId],
    ).then((data) => data.map(NutritionFactsDbModel.fromJson).toList());
  }

  Future<void> add(
    NutritionFactsDbModel model, {
    Transaction? txn,
  }) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

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
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    final count = await executor.delete(
      'nutrition_facts',
      where: 'edible_id = ?',
      whereArgs: [edibleId],
    );

    return count > 0;
  }
}
