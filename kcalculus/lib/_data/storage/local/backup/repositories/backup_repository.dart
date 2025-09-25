import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/local/_common/database.dart';

class LocalBackupRepository extends Notifier<void> {
  @override
  void build() {}

  FutureOr<File> backup() async {
    // Waiting for DB to open to avoid StateError
    await database(ref);

    final dbService = databaseService(ref);

    return dbService.exportDatabase();
  }

  FutureOr<void> restore(File fromFile) async {
    // Waiting for DB to open to avoid StateError
    await database(ref);

    final dbService = databaseService(ref);

    return dbService.importDatabase(fromFile);
  }
}

final localBackupRepositoryProvider =
    NotifierProvider<LocalBackupRepository, void>(
  LocalBackupRepository.new,
);
