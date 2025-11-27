import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_utils.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/food_container/models/food_container_firestore_model.dart';
import 'package:kcalculus/domain/_common/exceptions/duplication_exception.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';

class FirestoreFoodContainerService extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  Future<bool> isEmpty({
    required String userId,
  }) async {
    var query = _db
        .collection(FoodContainerFirestoreModel.kCollection)
        .where('ownerId', isEqualTo: userId);

    final snapshot = await query.count().get();

    return (snapshot.count ?? 0) == 0;
  }

  Future<List<FoodContainerFirestoreModel>> all({
    required String userId,
    PageConfig<FoodContainerFirestoreModel>? pageConfig,
  }) async {
    var query = _db
        .collection(FoodContainerFirestoreModel.kCollection)
        .where('ownerId', isEqualTo: userId)
        .where('deleted', isEqualTo: false)
        .orderBy('updatedAt', descending: true)
        .orderBy(FieldPath.documentId, descending: true);

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

    return snapshot.docs
        .map((s) => FoodContainerFirestoreModel.fromJson({
              'id': s.id,
              ...s.data(),
            }))
        .toList();
  }

  Future<List<FoodContainerFirestoreModel>> recent({
    required String userId,
    required Duration lookbackDuration,
  }) async {
    final since = dateToTimestamp(
      DateTime.now().subtract(lookbackDuration),
    );

    final queries = [
      // upserted
      _db
          .collection(FoodContainerFirestoreModel.kCollection)
          .where('ownerId', isEqualTo: userId)
          .where('deleted', isEqualTo: false)
          .where('updatedAt', isGreaterThanOrEqualTo: since)
          .orderBy('updatedAt', descending: true)
          .orderBy(FieldPath.documentId, descending: true),
      // deleted
      _db
          .collection(FoodContainerFirestoreModel.kCollection)
          .where('ownerId', isEqualTo: userId)
          .where('deletedAt', isGreaterThanOrEqualTo: since),
    ];

    final result = <FoodContainerFirestoreModel>[];

    for (final query in queries) {
      final snapshot = await query.get();

      result.addAll(
        snapshot.docs.map(
          (s) => FoodContainerFirestoreModel.fromJson({
            'id': s.id,
            ...s.data(),
          }),
        ),
      );
    }

    return result;
  }

  Future<FoodContainerFirestoreModel?> get(
    String id, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef =
        _db.collection(FoodContainerFirestoreModel.kCollection).doc(id);

    final snapshot = await executor.get(docRef);

    final data = snapshot.data();

    return data == null
        ? null
        : FoodContainerFirestoreModel.fromJson({
            'id': snapshot.id,
            ...data,
          });
  }

  Future<String> save(
    FoodContainerFirestoreModel model, {
    bool skipAudit = false,
    Transaction? txn,
  }) async {
    await _checkForDuplication(model);

    final executor = FirestoreExecutor(txn);

    final docRef =
        _db.collection(FoodContainerFirestoreModel.kCollection).doc(model.id);

    if (model.id == null) {
      await executor.set(
        docRef,
        {
          ...model.toJson(),
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'deletedAt': null,
          'deleted': false,
        },
      );
    } else {
      await executor.update(
        docRef,
        {
          ...model.toJson(),
          if (!skipAudit) ...{
            'updatedAt': FieldValue.serverTimestamp(),
          },
        },
      );
    }

    return docRef.id;
  }

  Future<bool> _exists(
    String name,
    String description, {
    required String userId,
    String? exceptWithId,
  }) async {
    var query = _db
        .collection(FoodContainerFirestoreModel.kCollection)
        .where(FieldPath.documentId, isNotEqualTo: exceptWithId)
        .where('ownerId', isEqualTo: userId)
        .where('name_lower', isEqualTo: name.toLowerCase())
        .where('description_lower', isEqualTo: description.toLowerCase())
        .where('deleted', isEqualTo: false);

    final snapshot = await query.count().get();

    return (snapshot.count ?? 0) > 0;
  }

  Future<void> _checkForDuplication(FoodContainerFirestoreModel model) async {
    final alreadyExists = await _exists(
      model.name,
      model.description,
      userId: model.ownerId,
      exceptWithId: model.id,
    );

    if (alreadyExists) {
      throw DuplicationException();
    }
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef =
        _db.collection(FoodContainerFirestoreModel.kCollection).doc(id);

    await executor.update(
      docRef,
      {
        'deletedAt': FieldValue.serverTimestamp(),
        'deleted': true,
      },
    );

    return true;
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef =
        _db.collection(FoodContainerFirestoreModel.kCollection).doc(id);

    await executor.update(
      docRef,
      {
        'deletedAt': null,
        'deleted': false,
      },
    );

    return true;
  }

  Future<void> purge({
    required String userId,
  }) =>
      batchDelete(
        _db
            .collection(FoodContainerFirestoreModel.kCollection)
            .where('ownerId', isEqualTo: userId),
      );
}

final firestoreFoodContainerService =
    NotifierProvider<FirestoreFoodContainerService, void>(
  FirestoreFoodContainerService.new,
);
