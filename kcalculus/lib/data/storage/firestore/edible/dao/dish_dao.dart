import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/utils/dish_utils.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/edible_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/domain/_common/exceptions/duplication_exception.dart';
import 'package:kcalculus/domain/dish/exceptions/ingredients_cycle_exception.dart';
import 'package:kcalculus/domain/dish/exceptions/invalid_ingredient_exception.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/food/models/food.dart';

class FirestoreDishDao extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => ref.read(firestoreProvider);

  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  FirestoreEdibleDao get _edibleDao =>
      ref.read(firestoreEdibleDaoProvider.notifier);

  Future<String> save(
    Dish dish, {
    required User user,
    Transaction? txn,
    bool skipAudit = false,
  }) => (txn != null)
      ? _save(dish, user: user, txn: txn, skipAudit: skipAudit)
      : _db.runTransaction(
          (txn) => _save(dish, user: user, txn: txn, skipAudit: skipAudit),
        );

  Future<String> _save(
    Dish dish, {
    required User user,
    required Transaction txn,
    bool skipAudit = false,
  }) async {
    await _checkForDuplication(dish, user: user);

    await _checkForIngredientsCycle(dish, txn: txn);

    final dependencyUpdates = await prepareIngredientDependencyUpdates(
      dish,
      getDishesByIngredient: (id) =>
          _edibleService.getDishesByIngredient(id, userId: user.uid),
      getDish: (id) async {
        final edible = await _edibleDao.getById(id);
        return edible is Dish ? edible : null;
      },
    );

    final ingredients = [...dish.ingredients];

    for (var i = 0; i < ingredients.length; i++) {
      final ingredient = ingredients[i];

      final edible = ingredient.edible;

      if (edible.id == null) {
        if (edible is Food) {
          final edibleId = await _edibleService.save(
            EdibleFirestoreModel.fromDomain(edible, user.uid),
            skipAudit: skipAudit,
            txn: txn,
          );

          ingredients[i] = ingredient.copyWith(
            edible: edible.copyWith(id: edibleId),
          );
        } else {
          throw InvalidIngredientException('Non food unsaved ingedient');
        }
      }
    }

    dish = dish.copyWith(ingredients: ingredients);

    final id = await _edibleService.save(
      EdibleFirestoreModel.fromDomainDish(dish, user.uid),
      skipAudit: skipAudit,
      txn: txn,
    );

    await Future.wait(
      dependencyUpdates.map(
        (model) => _edibleService.updateNutritionFactsPreview(
          EdibleFirestoreModel.fromDomainDish(model, user.uid),
          txn: txn,
        ),
      ),
    );

    return id;
  }

  Future<void> _checkForDuplication(
    Dish dish, {
    required User user,
  }) async {
    if (await _alreadyExists(dish, user: user)) {
      throw DuplicationException(dish);
    }

    for (final ingredient in dish.ingredients) {
      if (await _alreadyExists(ingredient.edible, user: user)) {
        throw DuplicationException(ingredient);
      }
    }
  }

  Future<bool> _alreadyExists(
    Edible edible, {
    required User user,
  }) => _edibleService.exists(
    edible.name,
    edible.description,
    userId: user.uid,
    exceptWithId: edible.id,
  );

  Future<void> _checkForIngredientsCycle(
    Dish model, {
    Transaction? txn,
  }) async {
    if (model.id == null) return;

    final queue = Queue.from(
      model.ingredients
          .where((i) => i.edible.id != null)
          .map((i) => i.edible.id!),
    );

    while (queue.isNotEmpty) {
      final id = queue.removeFirst();
      if (id == model.id) {
        throw IngredientsCycleException();
      }

      final edible = await _edibleService.get(id, txn: txn);
      if (edible?.ingredients != null) {
        queue.addAll(edible!.ingredients!.map((i) => i.edibleId));
      }
    }
  }
}

final firestoreDishDaoProvider = NotifierProvider<FirestoreDishDao, void>(
  FirestoreDishDao.new,
);
