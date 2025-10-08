import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/domain/dish/exceptions/ingredients_cycle_exception.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/food/models/food.dart';

class FirestoreDishDao extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  Future<String> save(
    Dish dish, {
    required User user,
    Transaction? txn,
    bool skipAudit = false,
  }) =>
      (txn != null)
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
    await _checkForIngredientsCycle(dish, txn: txn);

    final ingredients = [...dish.ingredients];

    for (var i = 0; i < ingredients.length; i++) {
      final ingredient = ingredients[i];

      if (ingredient.edible.id == null) {
        final edibleId = await _edibleService.save(
          EdibleFirestoreModel.fromDomain(ingredient.edible, user.uid),
          skipAudit: skipAudit,
          txn: txn,
        );

        final edible = switch (ingredient.edible) {
          Food food => food.copyWith(id: edibleId),
          Dish dish => dish.copyWith(id: edibleId),
          _ => ingredient.edible,
        };

        ingredients[i] = ingredient.copyWith(edible: edible);
      }
    }

    dish = dish.copyWith(ingredients: ingredients);

    return _edibleService.save(
      EdibleFirestoreModel.fromDomainDish(dish, user.uid),
      skipAudit: skipAudit,
      txn: txn,
    );
  }

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
