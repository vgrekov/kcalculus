import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_utils.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/meal_firestore_model.dart';

class FirestoreMealService extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  Future<bool> isEmpty({
    required String userId,
  }) async {
    final snapshot = await _db
        .collection(MealFirestoreModel.collection(userId))
        .count()
        .get();

    return (snapshot.count ?? 0) == 0;
  }

  Future<List<MealFirestoreModel>> getByDate(
    DateTime date, {
    required String userId,
  }) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    var query = _db
        .collection(MealFirestoreModel.collection(userId))
        .where('deletedAt', isNull: true)
        .where('eatenAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('eatenAt', isLessThan: Timestamp.fromDate(end))
        .orderBy('eatenAt', descending: true)
        .orderBy(FieldPath.documentId, descending: true);

    final snapshot = await query.get();

    return snapshot.docs
        .map((s) => MealFirestoreModel.fromJson({
              'id': s.id,
              ...s.data(),
            }))
        .toList();
  }

  Future<MealFirestoreModel?> get(
    String id, {
    required String userId,
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef =
        _db.collection(MealFirestoreModel.collection(userId)).doc(id);

    final snapshot = await executor.get(docRef);

    final data = snapshot.data();

    return data == null
        ? null
        : MealFirestoreModel.fromJson({
            'id': snapshot.id,
            ...data,
          });
  }

  Future<String> save(
    MealFirestoreModel model, {
    required String userId,
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef =
        _db.collection(MealFirestoreModel.collection(userId)).doc(model.id);

    if (model.id == null) {
      await executor.set(
        docRef,
        {
          ...model.toJson(),
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'deletedAt': null,
        },
      );
    } else {
      await executor.update(
        docRef,
        {
          ...model.toJson(),
          'updatedAt': FieldValue.serverTimestamp(),
        },
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

    final docRef =
        _db.collection(MealFirestoreModel.collection(userId)).doc(id);

    await executor.update(
      docRef,
      {
        'deletedAt': FieldValue.serverTimestamp(),
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

    final docRef =
        _db.collection(MealFirestoreModel.collection(userId)).doc(id);

    await executor.update(
      docRef,
      {
        'deletedAt': null,
      },
    );

    return true;
  }

  Future<void> purge({
    required String userId,
  }) =>
      batchDelete(
        _db.collection(MealFirestoreModel.collection(userId)),
      );
}

final firestoreMealServiceProvider =
    NotifierProvider<FirestoreMealService, void>(
  FirestoreMealService.new,
);
