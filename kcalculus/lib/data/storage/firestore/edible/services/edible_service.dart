import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_utils.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_preview_firestore_model.dart';
import 'package:kcalculus/domain/_common/exceptions/duplication_exception.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/import/exceptions/import_unsaved_model_exception.dart';

class FirestoreEdibleService extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => ref.read(firestoreProvider);

  Future<bool> isEmpty({
    required String userId,
  }) async {
    var query = _db
        .collection(EdibleFirestoreModel.kCollection)
        .where(
          EdibleFirestoreModelJsonFields.ownerId,
          isEqualTo: userId,
        );

    final snapshot = await query.count().get();

    return (snapshot.count ?? 0) == 0;
  }

  Future<List<EdiblePreviewFirestoreModel>> all({
    required String userId,
    bool includeDeleted = false,
    PageConfig<EdiblePreviewFirestoreModel>? pageConfig,
  }) async {
    var query = _db
        .collection(EdibleFirestoreModel.kCollection)
        .where(EdibleFirestoreModelJsonFields.ownerId, isEqualTo: userId);

    if (!includeDeleted) {
      query = query.where(
        EdibleFirestoreModelJsonFields.deleted,
        isEqualTo: false,
      );
    }

    query = query
        .orderBy(EdibleFirestoreModelJsonFields.touchedAt, descending: true)
        .orderBy(FieldPath.documentId, descending: true);

    if (pageConfig != null) {
      query = query.limit(pageConfig.size);
      if (pageConfig.startAfter != null) {
        query = query.startAfter([
          dateToTimestamp(pageConfig.startAfter!.touchedAt),
          pageConfig.startAfter!.id,
        ]);
      }
    }

    final snapshot = await query.get();

    return snapshot.docs
        .map(
          (s) => EdiblePreviewFirestoreModel.fromJson({
            EdibleFirestoreModelJsonFields.id: s.id,
            ...s.data(),
          }),
        )
        .toList();
  }

  Future<List<EdiblePreviewFirestoreModel>> recent({
    required String userId,
    required Duration lookbackDuration,
  }) async {
    final since = dateToTimestamp(
      DateTime.now().subtract(lookbackDuration),
    );

    final queries = [
      // upserted
      _db
          .collection(EdibleFirestoreModel.kCollection)
          .where(EdibleFirestoreModelJsonFields.ownerId, isEqualTo: userId)
          .where(EdibleFirestoreModelJsonFields.deleted, isEqualTo: false)
          .where(
            EdibleFirestoreModelJsonFields.updatedAt,
            isGreaterThanOrEqualTo: since,
          )
          .orderBy(EdibleFirestoreModelJsonFields.updatedAt, descending: true)
          .orderBy(FieldPath.documentId, descending: true),
      // deleted
      _db
          .collection(EdibleFirestoreModel.kCollection)
          .where(EdibleFirestoreModelJsonFields.ownerId, isEqualTo: userId)
          .where(
            EdibleFirestoreModelJsonFields.deletedAt,
            isGreaterThanOrEqualTo: since,
          ),
    ];

    final result = <EdiblePreviewFirestoreModel>[];

    for (final query in queries) {
      final snapshot = await query.get();

      result.addAll(
        snapshot.docs.map(
          (s) => EdiblePreviewFirestoreModel.fromJson({
            EdibleFirestoreModelJsonFields.id: s.id,
            ...s.data(),
          }),
        ),
      );
    }

    return result;
  }

  Future<int> count({
    required String userId,
  }) async {
    var query = _db
        .collection(EdibleFirestoreModel.kCollection)
        .where(EdibleFirestoreModelJsonFields.ownerId, isEqualTo: userId)
        .where(EdibleFirestoreModelJsonFields.deleted, isEqualTo: false);

    final snapshot = await query.count().get();

    return snapshot.count ?? 0;
  }

  Future<bool> exists(
    String name,
    String description, {
    required String userId,
    String? exceptWithId,
  }) async {
    var query = _db
        .collection(EdibleFirestoreModel.kCollection)
        .where(FieldPath.documentId, isNotEqualTo: exceptWithId)
        .where(EdibleFirestoreModelJsonFields.ownerId, isEqualTo: userId)
        .where(
          EdibleFirestoreModelJsonFields.nameLower,
          isEqualTo: name.toLowerCase(),
        )
        .where(
          EdibleFirestoreModelJsonFields.descriptionLower,
          isEqualTo: description.toLowerCase(),
        )
        .where(EdibleFirestoreModelJsonFields.deleted, isEqualTo: false);

    final snapshot = await query.count().get();

    return (snapshot.count ?? 0) > 0;
  }

  Future<bool> wasEaten(String id) async {
    final model = await get(id);

    return model?.eatenAt != null;
  }

  FutureOr<bool> isMissingNutritionFactsPreviews(String userId) async {
    var query = _db
        .collection(EdibleFirestoreModel.kCollection)
        .where(EdibleFirestoreModelJsonFields.ownerId, isEqualTo: userId)
        .where(
          EdibleFirestoreModelJsonFields.nutritionFactsPreview,
          isNull: true,
        )
        .where(EdibleFirestoreModelJsonFields.deleted, isEqualTo: false);

    final snapshot = await query.count().get();

    return (snapshot.count ?? 0) > 0;
  }

  Future<List<EdiblePreviewFirestoreModel>>
  findEdiblesWithoutNutritionFactsPreviews(String userId) async {
    var query = _db
        .collection(EdibleFirestoreModel.kCollection)
        .where(EdibleFirestoreModelJsonFields.ownerId, isEqualTo: userId)
        .where(
          EdibleFirestoreModelJsonFields.nutritionFactsPreview,
          isNull: true,
        )
        .where(EdibleFirestoreModelJsonFields.deleted, isEqualTo: false);

    final snapshot = await query.get();

    return snapshot.docs
        .map(
          (s) => EdiblePreviewFirestoreModel.fromJson({
            EdibleFirestoreModelJsonFields.id: s.id,
            ...s.data(),
          }),
        )
        .toList();
  }

  Future<EdibleFirestoreModel?> get(
    String id, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db.collection(EdibleFirestoreModel.kCollection).doc(id);

    final snapshot = await executor.get(docRef);

    final data = snapshot.data();

    return data == null
        ? null
        : EdibleFirestoreModel.fromJson({
            EdibleFirestoreModelJsonFields.id: snapshot.id,
            ...data,
          });
  }

  Future<String> save(
    EdibleFirestoreModel model, {
    bool skipAudit = false,
    Transaction? txn,
  }) async {
    await _checkForDuplication(model);

    final executor = FirestoreExecutor(txn);

    final docRef = _db
        .collection(EdibleFirestoreModel.kCollection)
        .doc(model.id);

    if (model.id == null) {
      await executor.set(
        docRef,
        model.toJsonFlavour(const StorageActionCreate()),
      );
    } else {
      await executor.update(
        docRef,
        model.toJsonFlavour(StorageActionUpdate(skipAudit: skipAudit)),
      );
    }

    return docRef.id;
  }

  Future<void> import(
    EdibleFirestoreModel model, {
    Transaction? txn,
  }) async {
    if (model.id?.isEmpty ?? true) {
      throw ImportUnsavedModelException();
    }

    final executor = FirestoreExecutor(txn);

    final docRef = _db
        .collection(EdibleFirestoreModel.kCollection)
        .doc(model.id);

    await executor.set(
      docRef,
      model.toJson(),
    );
  }

  Future<void> _checkForDuplication(EdibleFirestoreModel model) async {
    final alreadyExists = await exists(
      model.name,
      model.description,
      userId: model.ownerId,
      exceptWithId: model.id,
    );

    if (alreadyExists) {
      throw DuplicationException();
    }
  }

  Future<bool> markEaten(
    String id, {
    required DateTime at,
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db.collection(EdibleFirestoreModel.kCollection).doc(id);

    await executor.update(
      docRef,
      {
        EdibleFirestoreModelJsonFields.eatenAt: dateToTimestamp(at),
        EdibleFirestoreModelJsonFields.touchedAt: FieldValue.serverTimestamp(),
      },
    );

    return true;
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db.collection(EdibleFirestoreModel.kCollection).doc(id);

    await executor.update(
      docRef,
      {
        EdibleFirestoreModelJsonFields.deletedAt: FieldValue.serverTimestamp(),
        EdibleFirestoreModelJsonFields.deleted: true,
      },
    );

    return true;
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final docRef = _db.collection(EdibleFirestoreModel.kCollection).doc(id);

    await executor.update(
      docRef,
      {
        EdibleFirestoreModelJsonFields.deletedAt: null,
        EdibleFirestoreModelJsonFields.deleted: false,
      },
    );

    return true;
  }

  Future<void> purge({
    required String userId,
  }) => batchDelete(
    _db
        .collection(EdibleFirestoreModel.kCollection)
        .where(
          EdibleFirestoreModelJsonFields.ownerId,
          isEqualTo: userId,
        ),
  );
}

final firestoreEdibleServiceProvider =
    NotifierProvider<FirestoreEdibleService, void>(
      FirestoreEdibleService.new,
    );
