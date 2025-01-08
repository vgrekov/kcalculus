import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/local/db.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/models/units.dart';
import 'package:sqflite/sqflite.dart';

class LocalNutritionFactsDao {
  final Database db;

  LocalNutritionFactsDao({
    required this.db,
  });

  Future<void> add(NutritionFacts model, String edibleId,
      {Transaction? txn}) async {
    DatabaseExecutor executor = txn ?? db;

    await executor.insert('nutrition_facts', {
      'edible_id': edibleId,
      ..._toRecord(model),
    });
  }

  Future<List<NutritionFacts>> getByEdibleId(String edibleId) {
    return db.query(
      'nutrition_facts',
      where: 'edible_id = ?',
      whereArgs: [edibleId],
    ).then((data) => data.map(_fromRecord).toList());
  }

  Future<bool> deleteByEdibleId(String edibleId, {Transaction? txn}) async {
    DatabaseExecutor executor = txn ?? db;

    final count = await executor.delete(
      'nutrition_facts',
      where: 'edible_id = ?',
      whereArgs: [edibleId],
    );

    return count > 0;
  }

  Future<void> save(List<NutritionFacts> models, String edibleId,
      {Transaction? txn}) async {
    await deleteByEdibleId(edibleId, txn: txn);
    for (final model in models) {
      await add(model, edibleId, txn: txn);
    }
  }

  NutritionFacts _fromRecord(Map<String, Object?> record) {
    return NutritionFacts(
      amount: Amount(
        unit: Unit.values
            .firstWhere((u) => u.name == record['amount_unit'] as String),
        value: record['amount_value'] as double,
      ),
      nutrientData: NutrientData(
        calories: record['calories'] as double,
        fatInGrams: record['fat_in_grams'] as double,
        carbsInGrams: record['carbs_in_grams'] as double,
        fiberInGrams: record['fiber_in_grams'] as double,
        proteinInGrams: record['protein_in_grams'] as double,
      ),
    );
  }

  Map<String, Object?> _toRecord(NutritionFacts model) {
    return {
      'amount_value': model.amount.value,
      'amount_unit': model.amount.unit.name,
      'calories': model.nutrientData.calories,
      'fat_in_grams': model.nutrientData.fatInGrams,
      'carbs_in_grams': model.nutrientData.carbsInGrams,
      'fiber_in_grams': model.nutrientData.fiberInGrams,
      'protein_in_grams': model.nutrientData.proteinInGrams,
    };
  }
}

final localNutritionFactsDaoProvider =
    Provider<Future<LocalNutritionFactsDao>>((ref) async {
  final db = await ref.watch(dbProvider);
  return LocalNutritionFactsDao(db: db);
});
