import 'dart:collection';

import 'package:kcalculus/data/repositories/local/converters/dish_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/ingredient_converter.dart';
import 'package:kcalculus/data/repositories/local/dao/food_dao.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/data/services/local/database/ingredient/ingredient_db_model.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/exceptions.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalDishDao {
  LocalDishDao({
    required DatabaseService dbService,
    required LocalFoodDao foodDao,
    required LocalDishConverter dishConverter,
    required LocalIngredientConverter ingredientConverter,
  })  : _dbService = dbService,
        _foodDao = foodDao,
        _dishConverter = dishConverter,
        _ingredientConverter = ingredientConverter;

  final DatabaseService _dbService;

  final LocalFoodDao _foodDao;

  final LocalDishConverter _dishConverter;

  final LocalIngredientConverter _ingredientConverter;

  Future<Dish?> getById(String id) async {
    final resolvedEdibles = <String, Edible>{};

    final ingredientsByDish = <String, List<IngredientDbModel>>{};

    final unresolvedEdibles = <(String, bool)>[];

    unresolvedEdibles.add((id, true));

    while (unresolvedEdibles.isNotEmpty) {
      final item = unresolvedEdibles.last;
      final id = item.$1;
      final isDish = item.$2;

      if (isDish) {
        var ingredients = ingredientsByDish[id];
        if (ingredients == null) {
          ingredients = await _dbService.ingredient.getByDish(id);

          ingredientsByDish[id] = ingredients;

          unresolvedEdibles.addAll(
            ingredients.map(
              (ingredient) => (
                ingredient.edible_id,
                ingredient.edible_dish_id != null,
              ),
            ),
          );
        } else {
          await _resolveDish(id, ingredientsByDish, resolvedEdibles);
          unresolvedEdibles.removeLast();
        }
      } else {
        await _resolveFood(id, resolvedEdibles);
        unresolvedEdibles.removeLast();
      }
    }

    return resolvedEdibles[id] as Dish;
  }

  Future<void> _resolveFood(
    String id,
    Map<String, Edible> resolvedEdibles,
  ) async {
    if (!resolvedEdibles.containsKey(id)) {
      final food = await _foodDao.getById(id);
      if (food != null) {
        resolvedEdibles[id] = food;
      }
    }
  }

  Future<void> _resolveDish(
    String id,
    Map<String, List<IngredientDbModel>> ingredientsByDish,
    Map<String, Edible> resolvedEdibles,
  ) async {
    if (!resolvedEdibles.containsKey(id)) {
      final dishDbModel = await _dbService.dish.getById(id);
      if (dishDbModel != null) {
        final ingredients = ingredientsByDish[id]!;

        final dish = _dishConverter.toModel(
          dishDbModel,
          ingredients
              .map(
                (dbModel) => _ingredientConverter.toModel(
                  dbModel,
                  resolvedEdibles[dbModel.edible_id]!,
                ),
              )
              .toList(),
        );

        resolvedEdibles[id] = dish;
      }
    }
  }

  Future<String> save(
    Dish dish, {
    String? id,
    Transaction? txn,
  }) {
    if (txn != null) {
      return _save(dish, id: id, txn: txn);
    } else {
      return _dbService.transaction(
        (txn) => _save(dish, id: id, txn: txn),
      );
    }
  }

  Future<String> _save(
    Dish dish, {
    String? id,
    required Transaction txn,
  }) async {
    await _checkForIngredientsCycle(dish);

    String dishId = id ?? dish.id ?? generateId();

    await _dbService.transaction((txn) async {
      final ingredientsByDish = <String, List<IngredientDbModel>>{};

      final ediblesToSave = Queue<(Edible, String)>();

      ediblesToSave.add((dish, dishId));

      while (ediblesToSave.isNotEmpty) {
        final item = ediblesToSave.removeFirst();
        final edible = item.$1;
        final edibleId = item.$2;

        if (edible is Food) {
          await _foodDao.save(edible, id: edibleId, txn: txn);
        } else if (edible is Dish) {
          await _saveDish(edible, edibleId, txn);

          for (final ingredient in edible.ingredients) {
            final ingredientEdibleId = ingredient.edible.id ?? generateId();

            ingredientsByDish[edibleId] = (ingredientsByDish[edibleId] ?? [])
              ..add(_ingredientConverter.toDbModel(
                ingredient,
                edibleId,
                ingredientEdibleId,
              ));

            if (ingredient.edible.id == null) {
              ediblesToSave.add((ingredient.edible, ingredientEdibleId));
            }
          }
        }
      }

      for (final dishId in ingredientsByDish.keys) {
        _dbService.ingredient.saveForDish(
          ingredientsByDish[dishId]!,
          dishId,
          txn: txn,
        );
      }
    });

    return dishId;
  }

  Future<void> _checkForIngredientsCycle(Dish model) async {
    if (model.id == null) return;

    final ingredientDishes = model.ingredients
        .where((i) => i.edible is Dish && i.edible.id != null)
        .map((i) => i.edible);

    if (ingredientDishes.isEmpty) return;

    final hierarchies = await Future.wait(ingredientDishes
        .map((e) => _dbService.ingredient.getHierarchyByDish(e.id!)));
    final fullHierarchy = hierarchies.reduce((h1, h2) => h1.union(h2));

    if (fullHierarchy.contains(model.id!)) {
      throw IngredientsCycleException();
    }
  }

  Future<void> _saveDish(Dish dish, String dishId, Transaction txn) async {
    final dishDbModel = _dishConverter.toDbModel(dish, dishId);

    if (dish.id == null) {
      await _dbService.edible.add(dishDbModel.toEdibleDbModel(), txn: txn);
      await _dbService.dish.add(dishDbModel, txn: txn);
    } else {
      await _dbService.edible.update(dishDbModel.toEdibleDbModel(), txn: txn);
      await _dbService.dish.update(dishDbModel, txn: txn);
    }
  }
}
