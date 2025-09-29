import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/_data/storage/local/dish/converters/dish_converter.dart';
import 'package:kcalculus/_data/storage/local/dish/converters/ingredient_converter.dart';
import 'package:kcalculus/_data/storage/local/dish/models/ingredient_db_model.dart';
import 'package:kcalculus/_data/storage/local/dish/services/dish_service.dart';
import 'package:kcalculus/_data/storage/local/dish/services/ingredient_service.dart';
import 'package:kcalculus/_data/storage/local/edible/dao/edible_dao.dart';
import 'package:kcalculus/_data/storage/local/edible/services/edible_service.dart';
import 'package:kcalculus/_data/storage/local/food/dao/food_dao.dart';
import 'package:kcalculus/domain/exceptions/duplication_exception.dart';
import 'package:kcalculus/domain/exceptions/ingredients_cycle_exception.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalDishDao extends Notifier<void> {
  @override
  void build() {}

  LocalEdibleService get _edibleService =>
      ref.read(localEdibleServiceProvider.notifier);

  LocalIngredientService get _ingredientService =>
      ref.read(localIngredientServiceProvider.notifier);

  LocalDishService get _dishService =>
      ref.read(localDishServiceProvider.notifier);

  LocalEdibleDao get _edibleDao => ref.read(localEdibleDaoProvider.notifier);

  LocalFoodDao get _foodDao => ref.read(localFoodDaoProvider.notifier);

  LocalDishConverter get _dishConverter =>
      ref.read(localDishConverterProvider.notifier);

  LocalIngredientConverter get _ingredientConverter =>
      ref.read(localIngredientConverterProvider.notifier);

  Future<Dish?> getById(
    String id, {
    Transaction? txn,
  }) async {
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
          ingredients = await _ingredientService.getByDish(id, txn: txn);

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
          await _resolveDish(
            id,
            ingredientsByDish,
            resolvedEdibles,
            txn: txn,
          );
          unresolvedEdibles.removeLast();
        }
      } else {
        await _resolveFood(
          id,
          resolvedEdibles,
          txn: txn,
        );
        unresolvedEdibles.removeLast();
      }
    }

    return resolvedEdibles[id] as Dish;
  }

  Future<void> _resolveFood(
    String id,
    Map<String, Edible> resolvedEdibles, {
    Transaction? txn,
  }) async {
    if (!resolvedEdibles.containsKey(id)) {
      final food = await _foodDao.getById(id, txn: txn);
      if (food != null) {
        resolvedEdibles[id] = food;
      }
    }
  }

  Future<void> _resolveDish(
    String id,
    Map<String, List<IngredientDbModel>> ingredientsByDish,
    Map<String, Edible> resolvedEdibles, {
    Transaction? txn,
  }) async {
    if (!resolvedEdibles.containsKey(id)) {
      final dishDbModel = await _dishService.getById(id, txn: txn);
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
    bool skipAudit = false,
  }) async {
    if (txn != null) {
      return _save(
        dish,
        id: id,
        txn: txn,
        skipAudit: skipAudit,
      );
    } else {
      final db = await ref.read(localStorageServiceProvider.future);

      return db.transaction(
        (txn) => _save(
          dish,
          id: id,
          txn: txn,
          skipAudit: skipAudit,
        ),
      );
    }
  }

  Future<String> _save(
    Dish dish, {
    String? id,
    required Transaction txn,
    bool skipAudit = false,
  }) async {
    await _checkForDuplication(dish, txn: txn);

    await _checkForIngredientsCycle(dish, txn: txn);

    String dishId = id ?? dish.id ?? generateId();

    final ingredientsByDish = <String, List<IngredientDbModel>>{};

    final ediblesToSave = Queue<(Edible, String)>();

    ediblesToSave.add((dish, dishId));

    while (ediblesToSave.isNotEmpty) {
      final item = ediblesToSave.removeFirst();
      final edible = item.$1;
      final edibleId = item.$2;

      if (edible is Food) {
        await _foodDao.save(
          edible,
          id: edibleId,
          txn: txn,
          skipAudit: skipAudit,
        );
      } else if (edible is Dish) {
        await _saveDish(
          edible,
          edibleId,
          txn: txn,
          skipAudit: skipAudit,
        );

        for (final item in edible.ingredients.indexed) {
          final ingredient = item.$2;
          final index = item.$1;

          final ingredientEdibleId = ingredient.edible.id ?? generateId();

          ingredientsByDish[edibleId] = (ingredientsByDish[edibleId] ?? [])
            ..add(_ingredientConverter.toDbModel(
              ingredient,
              edibleId,
              ingredientEdibleId,
              index,
            ));

          if (ingredient.edible.id == null) {
            ediblesToSave.add((ingredient.edible, ingredientEdibleId));
          }
        }
      }
    }

    for (final dishId in ingredientsByDish.keys) {
      await _ingredientService.saveForDish(
        ingredientsByDish[dishId]!,
        dishId,
        txn: txn,
      );
    }

    return dishId;
  }

  Future<void> _checkForIngredientsCycle(
    Dish model, {
    Transaction? txn,
  }) async {
    if (model.id == null) return;

    final ingredientDishes = model.ingredients
        .where((i) => i.edible is Dish && i.edible.id != null)
        .map((i) => i.edible);

    if (ingredientDishes.isEmpty) return;

    final hierarchies = await Future.wait(ingredientDishes
        .map((e) => _ingredientService.getHierarchyByDish(e.id!, txn: txn)));
    final fullHierarchy = hierarchies.reduce((h1, h2) => h1.union(h2));

    if (fullHierarchy.contains(model.id!)) {
      throw IngredientsCycleException();
    }
  }

  Future<void> _checkForDuplication(
    Edible model, {
    Transaction? txn,
  }) async {
    final alreadyExists = await _edibleDao.exists(
      model.name,
      model.description,
      exceptWithId: model.id,
      txn: txn,
    );

    if (alreadyExists) {
      throw DuplicationException();
    }
  }

  Future<void> _saveDish(
    Dish dish,
    String dishId, {
    required Transaction txn,
    bool skipAudit = false,
  }) async {
    final dishDbModel = _dishConverter.toDbModel(dish, dishId);

    if (dish.id == null) {
      await _edibleService.add(dishDbModel.toEdibleDbModel(), txn: txn);
      await _dishService.add(dishDbModel, txn: txn);
    } else {
      await _edibleService.update(
        dishDbModel.toEdibleDbModel(),
        txn: txn,
        skipAudit: skipAudit,
      );
      await _dishService.update(dishDbModel, txn: txn);
    }
  }
}

final localDishDaoProvider = NotifierProvider<LocalDishDao, void>(
  LocalDishDao.new,
);
