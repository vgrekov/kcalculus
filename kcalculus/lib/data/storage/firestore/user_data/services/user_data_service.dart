import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/user_data_firestore_model.dart';

class FirestoreUserDataService extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => ref.read(firestoreProvider);

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
              UserDataFirestoreModelJsonFields.id: snapshot.id,
              ...data,
            },
          );
  }

  Future<void> save(
    UserDataFirestoreModel Function(UserDataFirestoreModel) update, {
    required String id,
    Transaction? txn,
  }) async {
    var model = await getById(id, txn: txn);

    bool exists;
    if (model == null) {
      model = UserDataFirestoreModel(id: id);
      exists = false;
    } else {
      exists = true;
    }

    model = update(model);

    final docRef = _db.collection(UserDataFirestoreModel.kCollection).doc(id);

    final executor = FirestoreExecutor(txn);

    if (!exists) {
      await executor.set(
        docRef,
        model.toJsonFlavour(const StorageActionCreate()),
      );
    } else {
      await executor.update(
        docRef,
        model.toJsonFlavour(const StorageActionUpdate()),
      );
    }
  }

  Future<void> purge({
    required String userId,
  }) => _db.collection(UserDataFirestoreModel.kCollection).doc(userId).delete();
}

final firestoreUserDataServiceProvider =
    NotifierProvider<FirestoreUserDataService, void>(
      FirestoreUserDataService.new,
    );
