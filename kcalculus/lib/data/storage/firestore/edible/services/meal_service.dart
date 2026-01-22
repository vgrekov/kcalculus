import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_utils.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/meal_firestore_model.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';

class FirestoreMealService extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => ref.read(firestoreProvider);

  Future<bool> isEmpty({
    required String userId,
  }) async {
    final snapshot = await _db
        .collection(MealFirestoreModel.collection(userId))
        .count()
        .get();

    return (snapshot.count ?? 0) == 0;
  }

  Future<List<MealFirestoreModel>> all({
    required String userId,
    PageConfig<MealFirestoreModel>? pageConfig,
  }) async {
    var query = _db
        .collection(MealFirestoreModel.collection(userId))
        .orderBy(MealFirestoreModelJsonFields.eatenAt, descending: false)
        .orderBy(FieldPath.documentId, descending: true);

    if (pageConfig != null) {
      query = query.limit(pageConfig.size);
      if (pageConfig.startAfter != null) {
        query = query.startAfter([
          dateToTimestamp(pageConfig.startAfter!.eatenAt),
          pageConfig.startAfter!.id,
        ]);
      }
    }

    final snapshot = await query.get();

    return snapshot.docs
        .map(
          (s) => MealFirestoreModel.fromJson({
            MealFirestoreModelJsonFields.id: s.id,
            ...s.data(),
          }),
        )
        .toList();
  }

  Future<List<MealFirestoreModel>> getByDate(
    DateTime date, {
    required String userId,
  }) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    var query = _db
        .collection(MealFirestoreModel.collection(userId))
        .where(MealFirestoreModelJsonFields.deletedAt, isNull: true)
        .where(
          MealFirestoreModelJsonFields.eatenAt,
          isGreaterThanOrEqualTo: Timestamp.fromDate(start),
        )
        .where(
          MealFirestoreModelJsonFields.eatenAt,
          isLessThan: Timestamp.fromDate(end),
        )
        .orderBy(MealFirestoreModelJsonFields.eatenAt, descending: true)
        .orderBy(FieldPath.documentId, descending: true);

    final snapshot = await query.get();

    return snapshot.docs
        .map(
          (s) => MealFirestoreModel.fromJson({
            MealFirestoreModelJsonFields.id: s.id,
            ...s.data(),
          }),
        )
        .toList();
  }

  Future<MealFirestoreModel?> get(
    String id, {
    required String userId,
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db
        .collection(MealFirestoreModel.collection(userId))
        .doc(id);

    final snapshot = await executor.get(docRef);

    final data = snapshot.data();

    return data == null
        ? null
        : MealFirestoreModel.fromJson({
            MealFirestoreModelJsonFields.id: snapshot.id,
            ...data,
          });
  }

  Future<String> save(
    MealFirestoreModel model, {
    required String userId,
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db
        .collection(MealFirestoreModel.collection(userId))
        .doc(model.id);

    if (model.id == null) {
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

    return docRef.id;
  }

  Future<bool> delete(
    String id, {
    required String userId,
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db
        .collection(MealFirestoreModel.collection(userId))
        .doc(id);

    await executor.update(
      docRef,
      {
        MealFirestoreModelJsonFields.deletedAt: FieldValue.serverTimestamp(),
      },
    );

    return true;
  }

  Future<bool> restore(
    String id, {
    required String userId,
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db
        .collection(MealFirestoreModel.collection(userId))
        .doc(id);

    await executor.update(
      docRef,
      {
        MealFirestoreModelJsonFields.deletedAt: null,
      },
    );

    return true;
  }

  Future<void> purge({
    required String userId,
  }) => batchDelete(
    _db.collection(MealFirestoreModel.collection(userId)),
  );
}

final firestoreMealServiceProvider =
    NotifierProvider<FirestoreMealService, void>(
      FirestoreMealService.new,
    );
