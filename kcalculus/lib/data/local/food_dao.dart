import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/local/db.dart';
import 'package:kcalculus/data/local/edible_dao.dart';
import 'package:kcalculus/data/local/nutrition_facts_dao.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalFoodDao implements FoodDao {
  final Database db;
  final LocalEdibleDao edibleDao;
  final LocalNutritionFactsDao nutritionFactsDao;

  LocalFoodDao({
    required this.db,
    required this.edibleDao,
    required this.nutritionFactsDao,
  });

  Future<void> add(Food model, {Transaction? txn}) async {
    DatabaseExecutor executor = txn ?? db;

    model.id = generateId();

    await edibleDao.add(model, txn: txn);

    await executor.insert('foods', {
      'id': model.id,
    });

    await nutritionFactsDao.save(
      model.nutritionFacts,
      model.id!,
      txn: txn,
    );
  }

  @override
  Future<Food?> getById(String id) async {
    return db.rawQuery(
      '''
      SELECT
        edibles.id AS id,
        edibles.name AS name,
        edibles.description AS description
      FROM
        foods
      LEFT JOIN edibles ON
        edibles.id = foods.id
      WHERE
        foods.id = ?
      ''',
      [id],
    ).then((data) => data.map(_fromRecord).firstOrNull);
  }

  Future<Food> _fromRecord(Map<String, Object?> record) async {
    final id = record['id'] as String;

    final nutritionFacts = await nutritionFactsDao.getByEdibleId(id);

    return Food(
      id: id,
      name: record['name'] as String,
      description: record['description'] as String?,
      nutritionFacts: nutritionFacts,
    );
  }
}

final localFoodDaoProvider = Provider<Future<LocalFoodDao>>((ref) async {
  final db = await ref.watch(dbProvider);
  final edibleDao = await ref.watch(localEdibleDaoProvider);
  final nutritionFactsDao = await ref.watch(localNutritionFactsDaoProvider);
  return LocalFoodDao(
    db: db,
    edibleDao: edibleDao,
    nutritionFactsDao: nutritionFactsDao,
  );
});
