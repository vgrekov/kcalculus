import 'dart:async';
import 'dart:io';

import 'package:kcalculus/data/services/local/database/database_manager.dart';

class BackupRepository {
  BackupRepository({
    required DatabaseManager dbManager,
  }) : _dbManager = dbManager;

  final DatabaseManager _dbManager;

  FutureOr<File> backup() {
    return _dbManager.exportDatabase();
  }

  FutureOr<void> restore(File fromFile) {
    return _dbManager.importDatabase(fromFile);
  }
}
