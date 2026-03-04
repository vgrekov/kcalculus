import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';

class LocalBackupRepository extends Notifier<void> {
  @override
  void build() {}

  FutureOr<File> backup() async {
    // Waiting for DB to open to avoid StateError
    await ref.read(localStorageServiceProvider.future);

    final dbService = ref.read(localStorageServiceProvider.notifier);

    return dbService.exportDatabase();
  }

  FutureOr<void> restore(File fromFile) async {
    // Waiting for DB to open to avoid StateError
    await ref.read(localStorageServiceProvider.future);

    final dbService = ref.read(localStorageServiceProvider.notifier);

    return dbService.importDatabase(fromFile);
  }
}

final localBackupRepositoryProvider =
    NotifierProvider<LocalBackupRepository, void>(
  LocalBackupRepository.new,
);
