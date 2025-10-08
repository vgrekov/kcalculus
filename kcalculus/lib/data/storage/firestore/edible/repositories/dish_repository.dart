import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_type.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/dish/exceptions/ingredients_cycle_exception.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/food/models/food.dart';

class FirestoreDishRepository extends DishRepository {
  FirebaseFirestore get _db => FirebaseFirestore.instance;

  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  @override
  Future<Dish?> getById(String id) => Auth.guard(
        (user) => _db.runTransaction((txn) async {
          final domainEdibles = <String, Edible>{};

          final firestoreEdibles = <String, EdibleFirestoreModel>{};

          final stack = <String>[id];

          while (stack.isNotEmpty) {
            final id = stack.last;

            var firestoreEdible = firestoreEdibles[id];
            if (firestoreEdible == null) {
              firestoreEdible = await _edibleService.get(
                id,
                txn: txn,
              );

              if (firestoreEdible != null) {
                firestoreEdibles[id] = firestoreEdible;

                firestoreEdible.ingredients?.forEach(
                  (i) => stack.add(i.edibleId),
                );
              } else {
                stack.removeLast();
              }
            } else {
              final domainEdible = switch (firestoreEdible.type) {
                EdibleType.food => firestoreEdible.toFood(),
                EdibleType.dish => firestoreEdible.toDish(domainEdibles),
              };

              if (domainEdible != null) {
                domainEdibles[id] = domainEdible;
              }

              stack.removeLast();
            }
          }

          final rootEdible = domainEdibles[id];

          return rootEdible is Dish ? rootEdible : null;
        }),
      );

  @override
  Future<Dish> save(
    Dish dish, {
    bool skipAudit = false,
  }) =>
      Auth.guard(
        (user) async {
          final id = await _db.runTransaction((txn) async {
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
          });

          emitChangeSignal();

          return (await getById(id))!;
        },
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

  @override
  Future<bool> delete(String id) => Auth.guard(
        (user) async {
          final result = await _edibleService.delete(id);

          emitChangeSignal();

          return result;
        },
      );

  @override
  Future<bool> restore(String id) => Auth.guard(
        (user) async {
          final result = await _edibleService.restore(id);

          emitChangeSignal();

          return result;
        },
      );
}

final firestoreDishRepositoryProvider =
    NotifierProvider<DishRepository, ChangeSignal?>(
  FirestoreDishRepository.new,
);
