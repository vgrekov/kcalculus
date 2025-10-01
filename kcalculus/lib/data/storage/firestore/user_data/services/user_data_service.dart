import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/user_data_firestore_model.dart';

class FirestoreUserDataService extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  Future<UserDataFirestoreModel?> getById(String id) async {
    final snapshot =
        await _db.collection(UserDataFirestoreModel.kCollection).doc(id).get();

    final data = snapshot.data();

    return data == null
        ? null
        : UserDataFirestoreModel.fromJson(
            {
              'id': snapshot.id,
              ...data,
            },
          );
  }

  Future<void> add(UserDataFirestoreModel model) async {
    final docRef =
        _db.collection(UserDataFirestoreModel.kCollection).doc(model.id);

    await docRef.set(
      {
        ...model.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'deletedAt': null,
      },
    );
  }

  Future<void> update(UserDataFirestoreModel model) async {
    final docRef =
        _db.collection(UserDataFirestoreModel.kCollection).doc(model.id);

    await docRef.update(
      {
        ...model.toJson(),
        'updatedAt': FieldValue.serverTimestamp(),
      },
    );
  }
}

final firestoreUserDataServiceProvider =
    NotifierProvider<FirestoreUserDataService, void>(
  FirestoreUserDataService.new,
);
