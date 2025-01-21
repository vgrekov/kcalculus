import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/local/db.dart';
import 'package:kcalculus/data/local/edible_dao.dart';
import 'package:kcalculus/data/local/nutrition_facts_dao.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
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

  @override
  Future<void> save(Food model, {Transaction? txn}) async {
    if (txn != null) {
      await _save(model, txn: txn);
    } else {
      await db.transaction((txn) async {
        await _save(model, txn: txn);
      });
    }
  }

  Future<void> _save(Food model, {required Transaction txn}) async {
    if (model.id == null) {
      model.id = generateId();

      await edibleDao.add(model, txn: txn);

      await txn.insert('foods', {
        'id': model.id,
      });
    } else {
      await edibleDao.update(model, txn: txn);
    }

    await nutritionFactsDao.save(
      model.nutritionFacts,
      model.id!,
      txn: txn,
    );
  }

  @override
  Future<List<EdibleSearchResult>> search(String? query) {
    return db.rawQuery(
      '''
      SELECT *
      FROM (
        SELECT
          results.id,
          results.name,
          results.description,
          results.created_at,
          results.updated_at,
          MAX(results.eaten_at) AS last_eaten_at
        FROM (
          SELECT
            foods.id AS id,
            edibles.name AS name,
            edibles.description AS description,
            edibles.created_at AS created_at,
            edibles.updated_at AS updated_at,
            CASE
              WHEN direct_meals.eaten_at IS NULL THEN ingredient_meals.eaten_at
              WHEN ingredient_meals.eaten_at IS NULL THEN direct_meals.eaten_at
              ELSE MAX(direct_meals.eaten_at, ingredient_meals.eaten_at)
            END AS eaten_at
          FROM
            foods
          LEFT JOIN edibles ON
            edibles.id = foods.id
          LEFT JOIN meals AS direct_meals ON
            direct_meals.edible_id = edibles.id
            AND direct_meals.deleted_at IS NULL
          LEFT JOIN ingredients ON
            ingredients.edible_id = edibles.id
          LEFT JOIN meals AS ingredient_meals ON
            ingredient_meals.edible_id = ingredients.dish_id
            AND ingredient_meals.deleted_at IS NULL
          WHERE
            edibles.deleted_at IS NULL
            AND UPPER(edibles.name) LIKE '%' || UPPER(?) || '%'
        ) results
        GROUP BY
          results.id,
          results.name,
          results.description,
          results.created_at,
          results.updated_at
      )
      ORDER BY
        CASE
          WHEN last_eaten_at IS NOT NULL THEN last_eaten_at
          WHEN updated_at IS NOT NULL THEN updated_at
          ELSE created_at
        END DESC
      ''',
      [query ?? ''],
    ).then((data) => data.map(_fromSearchResultRecord).toList());
  }

  @override
  Future<Food?> getById(String id) async {
    return db.rawQuery(
      '''
      SELECT
        edibles.id AS id,
        edibles.name AS name,
        edibles.description AS description,
        edibles.created_at AS created_at,
        edibles.updated_at AS updated_at
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
      description: record['description'] as String,
      nutritionFacts: nutritionFacts,
      createdAt: dt.parseISO8601(record['created_at'] as String),
      updatedAt: record['updated_at'] != null
          ? dt.parseISO8601(record['updated_at'] as String)
          : null,
    );
  }

  EdibleSearchResult _fromSearchResultRecord(Map<String, Object?> record) {
    return EdibleSearchResult(
      id: record['id'] as String,
      name: record['name'] as String,
      description: record['description'] as String,
      type: EdibleSearchResultType.food,
      lastEatenAt: record['last_eaten_at'] != null
          ? dt.parseISO8601(record['last_eaten_at'] as String)
          : null,
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
