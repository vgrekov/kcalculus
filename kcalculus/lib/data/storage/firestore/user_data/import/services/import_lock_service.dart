import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/_common/providers.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/firestore_executor.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/models/import_lock_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/models/import_record_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/user_data_firestore_model.dart';
import 'package:logging/logging.dart';

final _log = Logger('FirestoreImportLockService');

class FirestoreImportLockService
    extends AsyncNotifier<ImportLockFirestoreModel?> {
  late String _userId;

  late String _deviceId;

  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _subscription;

  @override
  FutureOr<ImportLockFirestoreModel?> build() async {
    ref.watch(authServiceProvider);

    final user = await ref.read(authServiceProvider.future);

    if (user == null) {
      _unsubscribe();
      return null;
    }

    _userId = user.uid;
    _deviceId = await ref.read(deviceIdProvider.future);

    final completer = Completer<ImportLockFirestoreModel?>();

    _subscribe(completer);

    ref.onDispose(() {
      _unsubscribe();
    });

    return completer.future;
  }

  FirebaseFirestore get _db => ref.read(firestoreProvider);

  DocumentReference<Map<String, dynamic>> get _lockRef => _db
      .collection(UserDataFirestoreModel.kCollection)
      .doc(_userId)
      .collection(ImportRecordFirestoreModel.kCollection)
      .doc(ImportLockFirestoreModel.kDocumentId);

  Future<ImportLockFirestoreModel?> getLock({
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final ref = _lockRef;

    final snapshot = await executor.get(ref);

    return _fromSnapshot(snapshot);
  }

  Future<void> lock({
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final ref = _lockRef;

    final lock = ImportLockFirestoreModel(deviceId: _deviceId);

    await executor.set(ref, lock.toJson());
  }

  Future<void> unlock({
    Transaction? txn,
  }) async {
    final executor = FirestoreExecutor(txn);

    final ref = _lockRef;

    await executor.delete(ref);
  }

  void _subscribe(
    Completer<ImportLockFirestoreModel?> completer,
  ) {
    _subscription?.cancel();
    _subscription = _lockRef.snapshots().listen(
      (snapshot) {
        final lock = _fromSnapshot(snapshot);

        if (completer.isCompleted) {
          _updateState(lock);
        } else {
          _log.finest('Firestore import lock: $lock');

          completer.complete(lock);
        }
      },
      onError: (error, stackTrace) {
        _log.severe(
          'Failed to load an import lock from Firestore',
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

  ImportLockFirestoreModel? _fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    return data != null ? ImportLockFirestoreModel.fromJson(data) : null;
  }

  void _updateState(ImportLockFirestoreModel? value) {
    if (state.valueOrNull != value) {
      state = AsyncData(value);

      _log.finest('Firestore import lock: $value');
    }
  }
}

final firestoreImportLockServiceProvider =
    AsyncNotifierProvider<
      FirestoreImportLockService,
      ImportLockFirestoreModel?
    >(
      FirestoreImportLockService.new,
    );
