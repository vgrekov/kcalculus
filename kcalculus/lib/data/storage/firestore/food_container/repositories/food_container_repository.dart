import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/_common/repositories/food_container_repository.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/food_container/models/food_container_firestore_model.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';

class FirestoreFoodContainerRepository extends FoodContainerRepository {
  FirebaseFirestore get _db => FirebaseFirestore.instance;

  @override
  Future<List<FoodContainer>> search(
    String? query, {
    PageConfig<FoodContainer>? pageConfig,
  }) {
    return Auth.guard((user) async {
      var query = _db
          .collection(FoodContainerFirestoreModel.kCollection)
          .where('ownerId', isEqualTo: user.uid)
          .where('deletedAt', isNull: true)
          .orderBy('updatedAt', descending: true)
          .orderBy(FieldPath.documentId, descending: true)
          .withConverter<FoodContainerFirestoreModel>(
            fromFirestore: (snapshot, _) =>
                FoodContainerFirestoreModel.fromJson(
              {
                'id': snapshot.id,
                ...snapshot.data()!,
              },
            ),
            toFirestore: (model, _) => model.toJson(),
          );

      if (pageConfig != null) {
        query = query.limit(pageConfig.size);
        if (pageConfig.startAfter != null) {
          query = query.startAfter([
            dateToTimestamp(pageConfig.startAfter!.updatedAt),
            pageConfig.startAfter!.id,
          ]);
        }
      }

      final snapshot = await query.get();

      return snapshot.docs.map((s) => s.data().toDomain()).toList();
    });
  }

  @override
  Future<FoodContainer?> getById(String id) {
    return Auth.guard((user) async {
      final snapshot = await _db
          .collection(FoodContainerFirestoreModel.kCollection)
          .doc(id)
          .get();

      final data = snapshot.data();

      return data == null
          ? null
          : FoodContainerFirestoreModel.fromJson(
              {
                'id': snapshot.id,
                ...data,
              },
            ).toDomain();
    });
  }

  @override
  Future<FoodContainer> save(FoodContainer container) {
    return Auth.guard((user) async {
      final fsModel = FoodContainerFirestoreModel.fromDomain(
        container,
        user.uid,
      );

      final collectionRef =
          _db.collection(FoodContainerFirestoreModel.kCollection);
      DocumentReference<Map<String, dynamic>> docRef;
      if (fsModel.id == null) {
        docRef = await collectionRef.add(
          {
            ...fsModel.toJson(),
            'createdAt': FieldValue.serverTimestamp(),
            'updatedAt': FieldValue.serverTimestamp(),
            'deletedAt': null,
          },
        );
      } else {
        docRef = collectionRef.doc(fsModel.id);
        await docRef.update(
          {
            ...fsModel.toJson(),
            'updatedAt': FieldValue.serverTimestamp(),
          },
        );
      }

      emitChangeSignal();

      final snapshot = await docRef.get();

      return FoodContainerFirestoreModel.fromJson(
        {
          'id': snapshot.id,
          ...snapshot.data()!,
        },
      ).toDomain();
    });
  }

  @override
  Future<bool> delete(String id) {
    return Auth.guard((user) async {
      await _db
          .collection(FoodContainerFirestoreModel.kCollection)
          .doc(id)
          .update(
        {
          'deletedAt': DateTime.now().toIso8601String(),
        },
      );

      emitChangeSignal();

      return true;
    });
  }

  @override
  Future<bool> restore(String id) {
    return Auth.guard((user) async {
      await _db
          .collection(FoodContainerFirestoreModel.kCollection)
          .doc(id)
          .update(
        {
          'deletedAt': null,
        },
      );

      emitChangeSignal();

      return true;
    });
  }
}

final firestoreFoodContainerRepositoryProvider =
    NotifierProvider<FoodContainerRepository, ChangeSignal?>(
  FirestoreFoodContainerRepository.new,
);
