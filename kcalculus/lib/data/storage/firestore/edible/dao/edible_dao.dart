import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_type.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';

class FirestoreEdibleDao extends Notifier<void> {
  @override
  void build() {}

  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  Future<Edible?> getById(
    String id, {
    Transaction? txn,
  }) async {
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

    return domainEdibles[id];
  }
}

final firestoreEdibleDaoProvider = NotifierProvider<FirestoreEdibleDao, void>(
  FirestoreEdibleDao.new,
);
