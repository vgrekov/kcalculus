import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/user_data_firestore_model.dart';

class FirestoreUserDataService extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  Future<UserDataFirestoreModel?> getById(
    String id, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db.collection(UserDataFirestoreModel.kCollection).doc(id);

    final snapshot = await executor.get(docRef);

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

  Future<void> add(
    UserDataFirestoreModel model, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef =
        _db.collection(UserDataFirestoreModel.kCollection).doc(model.id);

    await executor.set(
      docRef,
      {
        ...model.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'deletedAt': null,
      },
    );
  }

  Future<void> update(
    UserDataFirestoreModel model, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef =
        _db.collection(UserDataFirestoreModel.kCollection).doc(model.id);

    await executor.update(
      docRef,
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
