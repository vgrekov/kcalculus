import 'dart:async';
import 'dart:io';

abstract interface class DatabaseManager {
  FutureOr<File> exportDatabase();

  FutureOr<void> importDatabase(File fromFile);
}
