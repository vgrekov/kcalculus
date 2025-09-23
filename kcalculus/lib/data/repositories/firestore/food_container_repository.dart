import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kcalculus/data/repositories/firestore/models/food_container_firestore_model.dart';
import 'package:kcalculus/data/repositories/food_container_repository.dart';
import 'package:kcalculus/data/utils/auth.dart';
import 'package:kcalculus/domain/models/food_container.dart';

class FirestoreFoodContainerRepository implements FoodContainerRepository {
  FirestoreFoodContainerRepository({
    required StreamController<void> changeController,
  }) : _changeController = changeController;

  final StreamController<void> _changeController;

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  @override
  Future<List<FoodContainer>> search(
    String? query, {
    int? limit,
    int? offset,
  }) {
    if (offset != null && limit == null) {
      throw ArgumentError('Argument "limit" is missing');
    }

    if (limit != null && limit <= 0) {
      throw ArgumentError(
          'If present, "limit" argument must be a positive integer');
    }

    if (offset != null && offset < 0) {
      throw ArgumentError(
          'If present, "offset" argument must be a non-negative integer');
    }

    return Auth.guard((user) async {
      // TODO: Remove this after pagination is in place
      if ((offset ?? 0) > 0) return [];

      final query = _db
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

      if (limit != null) {
        // TODO: Implement pagination
        //query = query.limit(limit).offset(offset ?? 0);
        // query.startAfter(values)
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

      _changeController.add(null);

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

      _changeController.add(null);

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

      _changeController.add(null);

      return true;
    });
  }
}
