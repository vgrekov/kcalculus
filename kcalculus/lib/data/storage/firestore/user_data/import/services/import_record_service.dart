import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/_common/providers.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/models/import_record_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/user_data_firestore_model.dart';
import 'package:logging/logging.dart';

final _log = Logger('FirestoreImportRecordService');

class FirestoreImportRecordService
    extends AsyncNotifier<ImportRecordFirestoreModel?> {
  late String _userId;

  late String _deviceId;

  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _subscription;

  @override
  FutureOr<ImportRecordFirestoreModel?> build() async {
    ref.watch(authServiceProvider);

    final user = await ref.read(authServiceProvider.future);

    if (user == null) {
      _unsubscribe();
      return null;
    }

    _userId = user.uid;
    _deviceId = await ref.read(deviceIdProvider.future);

    final completer = Completer<ImportRecordFirestoreModel?>();

    _subscribe(completer);

    ref.onDispose(() {
      _unsubscribe();
    });

    return completer.future;
  }

  FirebaseFirestore get _db => ref.read(firestoreProvider);

  DocumentReference<Map<String, dynamic>> get _recordRef => _db
      .collection(UserDataFirestoreModel.kCollection)
      .doc(_userId)
      .collection(ImportRecordFirestoreModel.kCollection)
      .doc(_deviceId);

  Future<ImportRecordFirestoreModel?> getImport({
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final snapshot = await executor.get(_recordRef);

    final data = snapshot.data();

    return data == null ? null : ImportRecordFirestoreModel.fromJson(data);
  }

  Future<void> addImport(
    ImportRecordFirestoreModel model, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    await executor.set(
      _recordRef,
      model.toJsonFlavour(const StorageActionCreate()),
    );
  }

  Future<void> updateImport(
    ImportRecordFirestoreModel model, {
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    await executor.update(
      _recordRef,
      model.toJsonFlavour(const StorageActionUpdate()),
    );
  }

  void _subscribe(
    Completer<ImportRecordFirestoreModel?> completer,
  ) {
    _subscription?.cancel();
    _subscription = _recordRef.snapshots().listen(
      (snapshot) {
        final report = _fromSnapshot(snapshot);

        if (completer.isCompleted) {
          _updateState(report);
        } else {
          _log.finest('Firestore import record: $report');

          completer.complete(report);
        }
      },
      onError: (error, stackTrace) {
        _log.severe(
          'Failed to load an import record from Firestore',
          error,
          stackTrace,
        );

        state = AsyncError(error, stackTrace);
      },
    );
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }

  ImportRecordFirestoreModel? _fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    return data != null ? ImportRecordFirestoreModel.fromJson(data) : null;
  }

  void _updateState(ImportRecordFirestoreModel? value) {
    if (state.valueOrNull != value) {
      state = AsyncData(value);

      _log.finest('Firestore import record: $value');
    }
  }
}

final firestoreImportRecordServiceProvider =
    AsyncNotifierProvider<
      FirestoreImportRecordService,
      ImportRecordFirestoreModel?
    >(
      FirestoreImportRecordService.new,
    );
