import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/_common/database/models/database_config.dart';
import 'package:kcalculus/data/exceptions/localized_exception.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final _log = Logger('DatabaseService');

class DatabaseService extends FamilyAsyncNotifier<Database, DatabaseConfig> {
  late DatabaseConfig _config;

  @override
  FutureOr<Database> build(DatabaseConfig arg) async {
    _config = arg;

    final db = await _openDatabase();

    ref.onDispose(() {
      db.close();
    });

    return db;
  }

  FutureOr<bool> isDatabaseMigrationRequired() async {
    ensureDatabaseIsReady();

    final db = state.asData!.value;

    try {
      final currentVersion = await db.getVersion();
      if (currentVersion < _config.version) {
        if (currentVersion == 0) {
          _log.finer('${_config.name}] - Initial migration required');
        } else {
          _log.finer(
            '[${_config.name}] - Migration required to version ${_config.version}',
          );
        }

        return true;
      }

      _log.finer('[${_config.name}] - No migration required');
      return false;
    } catch (error, stackTrace) {
      _log.severe(
        '[${_config.name}] - Failed to check if database migration required',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  FutureOr<void> migrateDatabase() async {
    ensureDatabaseIsReady();

    var db = state.asData!.value;

    state = const AsyncLoading();

    try {
      db = await _migrateDatabase(db);

      state = AsyncData(db);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);

      rethrow;
    }
  }

  Future<File> exportDatabase() async {
    ensureDatabaseIsReady();

    final db = state.asData!.value;

    state = const AsyncLoading();

    try {
      final dbFile = File(db.path);

      await db.close();

      final toDir = await getTemporaryDirectory();

      final dbBackupPath = path.join(
        toDir.path,
        '${_config.name}.${dt.formatTimestamp(DateTime.now())}.backup',
      );

      return dbFile.copy(dbBackupPath);
    } finally {
      state = await AsyncValue.guard(_openDatabase);
    }
  }

  Future<void> importDatabase(File fromFile) async {
    if (!(await fromFile.exists())) {
      throw ArgumentError('Source file does not exist.');
    }

    ensureDatabaseIsReady();

    var db = state.asData!.value;

    state = const AsyncLoading();

    final dbPath = db.path;

    File? dbBackupFile;

    try {
      await db.close();

      final dbDir = await getDatabasesPath();
      final dbFile = File(dbPath);

      final dbBackupPath = path.join(
        dbDir,
        '${_config.name}.${dt.formatTimestamp(DateTime.now())}.backup',
      );
      dbBackupFile = await dbFile.copy(dbBackupPath);

      await fromFile.copy(dbPath);

      db = await _openDatabase();
      db = await _migrateDatabase(db);

      state = AsyncData(db);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);

      if (await dbBackupFile?.exists() == true) {
        await dbBackupFile!.copy(dbPath);
        await dbBackupFile.delete();
      }

      rethrow;
    }
  }

  Future<Database> _openDatabase() async {
    final dbDir = await getDatabasesPath();
    final dbPath = path.join(dbDir, _config.name);

    Database? db;
    try {
      db = await openDatabase(dbPath);
      return db;
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.databaseErrorFailedToOpen,
        cause: error,
      );
    }
  }

  void ensureDatabaseIsReady() {
    if (state is! AsyncData) {
      throw StateError('[${_config.name}] - Database is not ready yet');
    }
  }

  Future<Database> _migrateDatabase(Database db) async {
    final dbPath = db.path;

    File? dbBackupFile;

    try {
      final dbDir = await getDatabasesPath();

      final dbFile = File(dbPath);

      final dbExists = (await db.getVersion()) > 0;

      await db.close();

      if (dbExists) {
        final dbBackupPath = path.join(
          dbDir,
          '${_config.name}.${dt.formatTimestamp(DateTime.now())}.backup',
        );
        dbBackupFile = await dbFile.copy(dbBackupPath);
      }

      db = await openDatabase(
        dbPath,
        onConfigure: (db) async {
          if (_config.initScript != null) {
            final sql = await rootBundle.loadString(_config.initScript!);
            await db.execute(sql);
          }
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          for (var version = oldVersion + 1; version <= newVersion; version++) {
            final migrationScript = _config.migrationScriptFor(version);

            final sql = await rootBundle.loadString(migrationScript);

            final statements = sql.split(_config.sqlStatementSeparator);
            for (final statement in statements) {
              await db.execute(statement.trim());
            }
          }
        },
        version: _config.version,
      );

      _log.info('${_config.name}] - Migrated to version ${_config.version}');

      await dbBackupFile?.delete();

      return db;
    } catch (error, stackTrace) {
      _log.severe(
          '${_config.name}] - Failed to migrate database', error, stackTrace);

      if (db.isOpen == true) {
        await db.close();
      }

      if (await dbBackupFile?.exists() == true) {
        await dbBackupFile!.copy(dbPath);
        await dbBackupFile.delete();
      }

      rethrow;
    }
  }
}

final databaseServiceProvider =
    AsyncNotifierProvider.family<DatabaseService, Database, DatabaseConfig>(
  DatabaseService.new,
);
