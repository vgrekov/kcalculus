import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/local/db.dart';
import 'package:kcalculus/data/local/edible_dao.dart';
import 'package:kcalculus/data/local/food_dao.dart';
import 'package:kcalculus/data/local/ingredient_dao.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_ratio.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/exceptions.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalDishDao implements DishDao {
  final Database db;
  final LocalEdibleDao edibleDao;
  final LocalFoodDao foodDao;
  final LocalIngredientDao ingredientDao;

  LocalDishDao({
    required this.db,
    required this.edibleDao,
    required this.foodDao,
    required this.ingredientDao,
  });

  @override
  Future<Dish> save(Dish model, {Transaction? txn}) async {
    await _checkForIngredientsCycle(model);

    if (txn != null) {
      return _save(model, txn: txn);
    } else {
      return db.transaction((txn) {
        return _save(model, txn: txn);
      });
    }
  }

  Future<Dish> _save(Dish model, {required Transaction txn}) async {
    if (model.id == null) {
      model = model.copyWith(id: generateId());

      await edibleDao.add(model, txn: txn);

      await txn.insert('dishes', {
        'id': model.id,
        ..._toRecord(model),
      });
    } else {
      await edibleDao.update(model, txn: txn);

      await txn.update(
        'dishes',
        _toRecord(model),
        where: 'id = ?',
        whereArgs: [model.id],
      );
    }

    await ingredientDao.save(
      model.ingredients,
      model.id!,
      foodDao: foodDao,
      dishDao: this,
      txn: txn,
    );

    return model;
  }

  Future<void> _checkForIngredientsCycle(Dish model) async {
    if (model.id == null) return;

    final ingredientDishes = model.ingredients
        .where((i) => i.edible is Dish && i.edible.id != null)
        .map((i) => i.edible);

    if (ingredientDishes.isEmpty) return;

    final hierarchies = await Future.wait(
        ingredientDishes.map((e) => ingredientDao.getHierarchyByDishId(e.id!)));
    final fullHierarchy = hierarchies.reduce((h1, h2) => h1.union(h2));

    if (fullHierarchy.contains(model.id!)) {
      throw IngredientsCycleException();
    }
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
            dishes.id AS id,
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
            dishes
          LEFT JOIN edibles ON
            edibles.id = dishes.id
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
  Future<Dish?> getById(String id) async {
    return db.rawQuery(
      '''
      SELECT
        edibles.id AS id,
        edibles.name AS name,
        edibles.description AS description,
        dishes.mass_per_amount_value AS mass_per_amount_value,
        dishes.mass_per_amount_unit AS mass_per_amount_unit,
        dishes.mass_total_amount_value AS mass_total_amount_value,
        dishes.mass_total_amount_unit AS mass_total_amount_unit,
        dishes.volume_per_amount_value AS volume_per_amount_value,
        dishes.volume_per_amount_unit AS volume_per_amount_unit,
        dishes.volume_total_amount_value AS volume_total_amount_value,
        dishes.volume_total_amount_unit AS volume_total_amount_unit,
        dishes.quantity_per_amount_value AS quantity_per_amount_value,
        dishes.quantity_per_amount_unit AS quantity_per_amount_unit,
        dishes.quantity_total_amount_value AS quantity_total_amount_value,
        dishes.quantity_total_amount_unit AS quantity_total_amount_unit,
        edibles.created_at AS created_at,
        edibles.updated_at AS updated_at
      FROM
        dishes
      LEFT JOIN edibles ON
        edibles.id = dishes.id
      WHERE
        dishes.id = ?
      ''',
      [id],
    ).then((data) => data.map(_fromRecord).firstOrNull);
  }

  NutritionRatio? _fromNutritionRatioRecord(
    Map<String, Object?> record, {
    required String perAmountValueKey,
    required String perAmountUnitKey,
    required String totalAmountValueKey,
    required String totalAmountUnitKey,
  }) {
    final perAmountValue = record[perAmountValueKey] as double?;
    final perAmountUnit = record[perAmountUnitKey] as String?;
    final totalAmountValue = record[totalAmountValueKey] as double?;
    final totalAmountUnit = record[totalAmountUnitKey] as String?;

    if (perAmountValue != null &&
        perAmountUnit != null &&
        totalAmountValue != null &&
        totalAmountUnit != null) {
      return NutritionRatio(
        perAmount: Amount(
          unit: Unit.values.firstWhere((u) => u.name == perAmountUnit),
          value: perAmountValue,
        ),
        totalAmount: Amount(
          unit: Unit.values.firstWhere((u) => u.name == totalAmountUnit),
          value: totalAmountValue,
        ),
      );
    }

    return null;
  }

  Future<Dish> _fromRecord(Map<String, Object?> record) async {
    final id = record['id'] as String;

    final ingredients = await ingredientDao.getByDishId(
      id,
      foodDao: foodDao,
      dishDao: this,
    );

    final massRatio = _fromNutritionRatioRecord(
      record,
      perAmountValueKey: 'mass_per_amount_value',
      perAmountUnitKey: 'mass_per_amount_unit',
      totalAmountValueKey: 'mass_total_amount_value',
      totalAmountUnitKey: 'mass_total_amount_unit',
    );
    final volumeRatio = _fromNutritionRatioRecord(
      record,
      perAmountValueKey: 'volume_per_amount_value',
      perAmountUnitKey: 'volume_per_amount_unit',
      totalAmountValueKey: 'volume_total_amount_value',
      totalAmountUnitKey: 'volume_total_amount_unit',
    );
    final quantityRatio = _fromNutritionRatioRecord(
      record,
      perAmountValueKey: 'quantity_per_amount_value',
      perAmountUnitKey: 'quantity_per_amount_unit',
      totalAmountValueKey: 'quantity_total_amount_value',
      totalAmountUnitKey: 'quantity_total_amount_unit',
    );

    return Dish(
      id: id,
      name: record['name'] as String,
      description: record['description'] as String,
      ingredients: ingredients,
      nutritionRatios: {
        if (massRatio != null) Measure.mass: massRatio,
        if (volumeRatio != null) Measure.volume: volumeRatio,
        if (quantityRatio != null) Measure.quantity: quantityRatio,
      },
      createdAt: dt.parseISO8601(record['created_at'] as String),
      updatedAt: record['updated_at'] != null
          ? dt.parseISO8601(record['updated_at'] as String)
          : null,
    );
  }

  Map<String, Object?> _toRecord(Dish model) {
    final massRatio = model.nutritionRatios[Measure.mass];
    final volumeRatio = model.nutritionRatios[Measure.volume];
    final quantityRatio = model.nutritionRatios[Measure.quantity];

    return {
      'mass_per_amount_value': massRatio?.perAmount.value,
      'mass_per_amount_unit': massRatio?.perAmount.unit.name,
      'mass_total_amount_value': massRatio?.totalAmount.value,
      'mass_total_amount_unit': massRatio?.totalAmount.unit.name,
      'volume_per_amount_value': volumeRatio?.perAmount.value,
      'volume_per_amount_unit': volumeRatio?.perAmount.unit.name,
      'volume_total_amount_value': volumeRatio?.totalAmount.value,
      'volume_total_amount_unit': volumeRatio?.totalAmount.unit.name,
      'quantity_per_amount_value': quantityRatio?.perAmount.value,
      'quantity_per_amount_unit': quantityRatio?.perAmount.unit.name,
      'quantity_total_amount_value': quantityRatio?.totalAmount.value,
      'quantity_total_amount_unit': quantityRatio?.totalAmount.unit.name
    };
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

final localDishDaoProvider = Provider<Future<LocalDishDao>>((ref) async {
  final db = await ref.watch(dbProvider);
  final edibleDao = await ref.watch(localEdibleDaoProvider);
  final foodDao = await ref.watch(localFoodDaoProvider);
  final ingredientDao = await ref.watch(localIngredientDaoProvider);
  return LocalDishDao(
    db: db,
    edibleDao: edibleDao,
    foodDao: foodDao,
    ingredientDao: ingredientDao,
  );
});
