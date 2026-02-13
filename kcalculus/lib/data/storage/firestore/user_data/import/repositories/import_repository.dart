import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/_common/providers.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/exceptions/import_locked_by_another_device_exception.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/models/import_record_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/services/import_lock_service.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/services/import_record_service.dart';
import 'package:kcalculus/domain/import/models/import_process.dart';
import 'package:kcalculus/domain/import/models/import_record.dart';
import 'package:kcalculus/domain/import/models/import_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('FirestoreImportRepository');

class FirestoreImportRepository extends AsyncNotifier<ImportProcess> {
  @override
  FutureOr<ImportProcess> build() async {
    ref.watch(authServiceProvider);
    ref.watch(firestoreImportLockServiceProvider);
    ref.watch(firestoreImportRecordServiceProvider);

    final user = await ref.read(authServiceProvider.future);

    if (user == null) return const ImportProcess.unavailable();

    final deviceId = await ref.read(deviceIdProvider.future);

    final importLock = await ref.read(
      firestoreImportLockServiceProvider.future,
    );

    final importRecord = await ref.read(
      firestoreImportRecordServiceProvider.future,
    );

    if (importLock != null && importLock.deviceId != deviceId) {
      return const ImportProcess.remote();
    } else if (importLock == null && importRecord == null) {
      return const ImportProcess.idle();
    } else if (importLock != null && importRecord == null) {
      return const ImportProcess.localPending();
    } else if (importLock != null &&
        importRecord != null &&
        !importRecord.state.resolved) {
      return ImportProcess.localActive(importRecord.toDomain());
    } else {
      return const ImportProcess.unavailable();
    }
  }

  FirebaseFirestore get _db => ref.read(firestoreProvider);

  FirestoreImportLockService get _importLockService =>
      ref.read(firestoreImportLockServiceProvider.notifier);

  FirestoreImportRecordService get _importRecordService =>
      ref.read(firestoreImportRecordServiceProvider.notifier);

  Future<ImportRecord?> provisionImport() => Auth.guard(
    ref,
    (user) => _db.runTransaction(
      (txn) async {
        final deviceId = await ref.read(deviceIdProvider.future);

        final lock = await _importLockService.getLock(txn: txn);

        if (lock?.deviceId == deviceId) {
          final fsModel = await _importRecordService.getImport(txn: txn);

          if (fsModel == null) {
            throw StateError(
              'Device $deviceId is locking but there is no import record.',
            );
          }

          return fsModel.toDomain();
        } else if (lock != null) {
          throw ImportLockedByAnotherDeviceException();
        } else {
          final fsModel = await _importRecordService.getImport(txn: txn);

          var model = fsModel?.toDomain();

          if (model != null) {
            return model.state.resolved ? null : model;
          }

          model = ImportRecord(state: ImportState.booked);

          await _importRecordService.addImport(
            ImportRecordFirestoreModel.fromDomain(model),
            txn: txn,
          );

          await _importLockService.lock(txn: txn);

          _log.info('Import booked');

          return model;
        }
      },
    ),
  );

  Future<void> saveImport(ImportRecord model) => Auth.guard(
    ref,
    (user) => _db.runTransaction(
      (txn) async {
        final deviceId = await ref.read(deviceIdProvider.future);

        final import = await _importRecordService.getImport(txn: txn);

        final lock = await _importLockService.getLock(txn: txn);

        if (import == null) {
          await _importRecordService.addImport(
            ImportRecordFirestoreModel.fromDomain(model),
            txn: txn,
          );
        } else {
          await _importRecordService.updateImport(
            ImportRecordFirestoreModel.fromDomain(model),
            txn: txn,
          );
        }

        if (model.state.resolved && lock?.deviceId == deviceId) {
          await _importLockService.unlock(txn: txn);
        }
      },
    ),
  );
}

final firestoreImportRepositoryProvider =
    AsyncNotifierProvider<FirestoreImportRepository, ImportProcess>(
      FirestoreImportRepository.new,
    );
