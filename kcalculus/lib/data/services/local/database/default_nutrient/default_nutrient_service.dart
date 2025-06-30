import 'package:kcalculus/data/services/local/database/default_nutrient/default_nutrient_db_model.dart';
import 'package:sqflite/sqflite.dart';

class DefaultNutrientService {
  const DefaultNutrientService(this.database);

  final Future<Database> database;

  Future<List<DefaultNutrientDbModel>> getAll({
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    return executor
        .query('default_nutrients')
        .then((data) => data.map(DefaultNutrientDbModel.fromJson).toList());
  }

  Future<void> saveAll(
    List<DefaultNutrientDbModel> models, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await database;

    await executor.delete('default_nutrients');

    final batch = executor.batch();

    for (final model in models) {
      batch.insert(
        'default_nutrients',
        model.toJson(),
      );
    }

    await batch.commit(noResult: true);
  }
}
