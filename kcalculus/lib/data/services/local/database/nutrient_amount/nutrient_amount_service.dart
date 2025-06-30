import 'package:kcalculus/data/services/local/database/nutrient_amount/nutrient_amount_db_model.dart';
import 'package:sqflite/sqflite.dart';

class NutrientAmountService {
  NutrientAmountService(this.database);

  final Future<Database> database;

  Future<List<NutrientAmountDbModel>> getByNutritionFacts(
    String nutritionFactsId, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

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
    final executor = txn ?? await database;

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
    final executor = txn ?? await database;

    final count = await executor.delete(
      'nutrient_amounts',
      where: 'nutrition_facts_id = ?',
      whereArgs: [nutritionFactsId],
    );

    return count > 0;
  }
}
