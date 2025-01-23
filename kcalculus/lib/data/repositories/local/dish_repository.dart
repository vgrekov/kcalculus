import 'dart:async';
import 'dart:collection';

import 'package:kcalculus/data/repositories/dish_repository.dart';
import 'package:kcalculus/data/repositories/local/converters/dish_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/food_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/ingredient_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/nutrition_facts_converter.dart';
import 'package:kcalculus/data/services/local/database/ingredient/ingredient_db_model.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/exceptions.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalDishRepository implements DishRepository {
  LocalDishRepository({
    required DatabaseService dbService,
    required LocalDishConverter dishConverter,
    required LocalIngredientConverter ingredientConverter,
    required LocalFoodConverter foodConverter,
    required LocalNutritionFactsConverter nutritionFactsConverter,
  })  : _dbService = dbService,
        _dishConverter = dishConverter,
        _ingredientConverter = ingredientConverter,
        _foodConverter = foodConverter,
        _nutritionFactsConverter = nutritionFactsConverter;

  final DatabaseService _dbService;

  final LocalDishConverter _dishConverter;

  final LocalIngredientConverter _ingredientConverter;

  final LocalFoodConverter _foodConverter;

  final LocalNutritionFactsConverter _nutritionFactsConverter;

  @override
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
      final foodDbModel = await _dbService.food.getById(id);
      if (foodDbModel != null) {
        final nutritionFactsDbModels =
            await _dbService.nutritionFacts.getByEdible(id);

        Edible edible = _foodConverter.toModel(
          foodDbModel,
          nutritionFactsDbModels,
        );

        resolvedEdibles[id] = edible;
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

        Edible edible = _dishConverter.toModel(
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

        resolvedEdibles[id] = edible;
      }
    }
  }

  @override
  Future<Dish> save(Dish dish) async {
    await _checkForIngredientsCycle(dish);

    String dishId = dish.id ?? generateId();

    await _dbService.transaction((txn) async {
      final ingredientsByDish = <String, List<IngredientDbModel>>{};

      final ediblesToSave = Queue<(Edible, String)>();

      ediblesToSave.add((dish, dishId));

      while (ediblesToSave.isNotEmpty) {
        final item = ediblesToSave.removeFirst();
        final edible = item.$1;
        final edibleId = item.$2;

        if (edible is Food) {
          _saveFood(edible, edibleId, txn);
        } else if (edible is Dish) {
          _saveDish(edible, edibleId, txn);

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

    return (await getById(dishId))!;
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

  Future<void> _saveFood(Food food, String foodId, Transaction txn) async {
    final foodDbModel = _foodConverter.toDbModel(food, foodId);

    if (food.id == null) {
      await _dbService.edible.add(foodDbModel.toBaseDbModel(), txn: txn);
      await _dbService.food.add(foodDbModel, txn: txn);
    } else {
      await _dbService.edible.update(foodDbModel.toBaseDbModel(), txn: txn);
    }

    await _dbService.nutritionFacts.saveForEdible(
      food.nutritionFacts
          .map((model) => _nutritionFactsConverter.toDbModel(model, foodId))
          .toList(),
      foodId,
      txn: txn,
    );
  }

  Future<void> _saveDish(Dish dish, String dishId, Transaction txn) async {
    final dishDbModel = _dishConverter.toDbModel(dish, dishId);

    if (dish.id == null) {
      await _dbService.edible.add(dishDbModel.toBaseDbModel(), txn: txn);
      await _dbService.dish.add(dishDbModel, txn: txn);
    } else {
      await _dbService.edible.update(dishDbModel.toBaseDbModel(), txn: txn);
      await _dbService.dish.update(dishDbModel, txn: txn);
    }
  }
}
