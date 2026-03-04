import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_utils.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/nutrient_goal_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/user_data_firestore_model.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/import/exceptions/import_unsaved_model_exception.dart';

class FirestoreNutrientGoalService extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => ref.read(firestoreProvider);

  Future<bool> isEmpty(String userId) async {
    final snapshot = await _db
        .collection(UserDataFirestoreModel.kCollection)
        .doc(userId)
        .collection(NutrientGoalFirestoreModel.kCollection)
        .count()
        .get();

    return (snapshot.count ?? 0) == 0;
  }

  Future<List<NutrientGoalFirestoreModel>> all({
    required String userId,
    bool includeDeleted = false,
    PageConfig<NutrientGoalFirestoreModel>? pageConfig,
  }) async {
    var query = _db
        .collection(UserDataFirestoreModel.kCollection)
        .doc(userId)
        .collection(NutrientGoalFirestoreModel.kCollection)
        .withConverter<NutrientGoalFirestoreModel>(
          fromFirestore: (snapshot, _) => NutrientGoalFirestoreModel.fromJson(
            {
              NutrientGoalFirestoreModelJsonFields.id: snapshot.id,
              ...snapshot.data()!,
            },
          ),
          toFirestore: (model, _) => model.toJson(),
        )
        .orderBy(
          NutrientGoalFirestoreModelJsonFields.createdAt,
          descending: false,
        )
        .orderBy(FieldPath.documentId, descending: true);

    if (!includeDeleted) {
      query = query.where(
        NutrientGoalFirestoreModelJsonFields.deletedAt,
        isLessThan: NutrientGoalFirestoreModel.kMaxTimestamp,
      );
    }

    if (pageConfig != null) {
      query = query.limit(pageConfig.size);
      if (pageConfig.startAfter != null) {
        query = query.startAfter([
          dateToTimestamp(pageConfig.startAfter!.createdAt),
          pageConfig.startAfter!.id,
        ]);
      }
    }

    final snapshot = await query.get();

    return snapshot.docs.map((s) => s.data()).toList();
  }

  Future<List<NutrientGoalFirestoreModel>> getActiveGoals(
    DateTime date,
    String userId,
  ) async {
    final nextDay = Timestamp.fromDate(
      DateTime(
        date.year,
        date.month,
        date.day,
      ).add(Duration(days: 1)),
    );

    var query = _db
        .collection(UserDataFirestoreModel.kCollection)
        .doc(userId)
        .collection(NutrientGoalFirestoreModel.kCollection)
        .where(
          NutrientGoalFirestoreModelJsonFields.createdAt,
          isLessThan: nextDay,
        )
        .where(
          NutrientGoalFirestoreModelJsonFields.deletedAt,
          isGreaterThanOrEqualTo: nextDay,
        )
        .withConverter<NutrientGoalFirestoreModel>(
          fromFirestore: (snapshot, _) => NutrientGoalFirestoreModel.fromJson(
            {
              NutrientGoalFirestoreModelJsonFields.id: snapshot.id,
              ...snapshot.data()!,
            },
          ),
          toFirestore: (model, _) => model.toJson(),
        );

    final snapshot = await query.get();

    final currentGoals = snapshot.docs
        .map((s) => s.data())
        .fold(
          <String, NutrientGoalFirestoreModel>{},
          (acc, goal) {
            final oldGoal = acc[goal.nutrient];

            if (oldGoal?.createdAt?.isBefore(goal.createdAt!) ?? true) {
              acc[goal.nutrient] = goal;
            }

            return acc;
          },
        )
        .values
        .toList();

    currentGoals.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

    return currentGoals;
  }

  Future<String> save(
    NutrientGoalFirestoreModel model,
    String userId, {
    Transaction? txn,
  }) async {
    if (txn != null) {
      return _save(model, userId, txn: txn);
    } else {
      return _db.runTransaction(
        (txn) {
          return _save(model, userId, txn: txn);
        },
      );
    }
  }

  Future<String> _save(
    NutrientGoalFirestoreModel model,
    String userId, {
    required Transaction txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    if (model.id != null) {
      delete(model.id!, userId, txn: txn);
    }

    final newRef = _db
        .collection(UserDataFirestoreModel.kCollection)
        .doc(userId)
        .collection(NutrientGoalFirestoreModel.kCollection)
        .doc();

    await executor.set(
      newRef,
      model.toJsonFlavour(const StorageActionCreate()),
    );

    return newRef.id;
  }

  Future<void> import(
    NutrientGoalFirestoreModel model,
    String userId, {
    Transaction? txn,
  }) async {
    if (model.id?.isEmpty ?? true) {
      throw ImportUnsavedModelException();
    }

    final executor = FirestoreExecutor(txn);

    final newRef = _db
        .collection(UserDataFirestoreModel.kCollection)
        .doc(userId)
        .collection(NutrientGoalFirestoreModel.kCollection)
        .doc(model.id);

    await executor.set(
      newRef,
      model.toJson(),
    );
  }

  Future<bool> delete(
    String id,
    String userId, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db
        .collection(UserDataFirestoreModel.kCollection)
        .doc(userId)
        .collection(NutrientGoalFirestoreModel.kCollection)
        .doc(id);

    await executor.update(
      docRef,
      {
        NutrientGoalFirestoreModelJsonFields.deletedAt:
            FieldValue.serverTimestamp(),
      },
    );

    return true;
  }

  Future<bool> restore(
    String id,
    String userId, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db
        .collection(UserDataFirestoreModel.kCollection)
        .doc(userId)
        .collection(NutrientGoalFirestoreModel.kCollection)
        .doc(id);

    await executor.update(
      docRef,
      {
        NutrientGoalFirestoreModelJsonFields.deletedAt:
            NutrientGoalFirestoreModel.kMaxTimestamp,
      },
    );

    return true;
  }

  Future<void> purge({
    required String userId,
  }) => batchDelete(
    _db
        .collection(UserDataFirestoreModel.kCollection)
        .doc(userId)
        .collection(NutrientGoalFirestoreModel.kCollection),
  );
}

final firestoreNutrientGoalServiceProvider =
    NotifierProvider<FirestoreNutrientGoalService, void>(
      FirestoreNutrientGoalService.new,
    );
