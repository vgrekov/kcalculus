import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:kcalculus/data/exceptions/localized_exception.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const kSqlStatementSeparator = '--SQL-STATEMENT-SEPARATOR';

final _kMigrationNumberFormatter = NumberFormat('000');

const _kMigrationScriptPattern = '{migration_number}.sql';

FutureOr<bool> isDbMigrationRequired(
  String dbName,
  int targetVersion,
) async {
  final log = Logger(dbName);

  final dbDir = await getDatabasesPath();
  final dbPath = path.join(dbDir, dbName);

  final dbFile = File(dbPath);
  final dbExists = await dbFile.exists();
  if (!dbExists) {
    log.finer('Initial migration required');
    return true;
  }

  Database? db;
  try {
    db = await openDatabase(dbPath);
    final currentVersion = await db.getVersion();
    if (currentVersion < targetVersion) {
      log.finer('Migration required to version $targetVersion');
      return true;
    }

    log.finer('No migration required');
    return false;
  } catch (error, stackTrace) {
    log.severe(
        'Failed to check if database migration required', error, stackTrace);
    rethrow;
  } finally {
    if (db?.isOpen == true) {
      await db?.close();
    }
  }
}

FutureOr<void> migrateDb(
  String dbName,
  int targetVersion,
  String migrationsDir,
) async {
  final log = Logger(dbName);

  final dbDir = await getDatabasesPath();
  final dbPath = path.join(dbDir, dbName);

  final dbFile = File(dbPath);
  final dbExists = await dbFile.exists();

  File? dbBackupFile;

  Database? db;
  try {
    if (dbExists) {
      final dbBackupPath = path.join(
        dbDir,
        '$dbName.${dt.formatTimestamp(DateTime.now())}.backup',
      );
      dbBackupFile = await dbFile.copy(dbBackupPath);
    }

    db = await openDatabase(
      dbPath,
      onConfigure: (db) async {
        final sql = await rootBundle.loadString('assets/db/enable_fk.sql');
        await db.execute(sql);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var version = oldVersion + 1; version <= newVersion; version++) {
          final migrationVersion = _kMigrationNumberFormatter.format(version);
          final migrationScript =
              '$migrationsDir/$_kMigrationScriptPattern'.replaceAll(
            '{migration_number}',
            migrationVersion,
          );

          final sql = await rootBundle.loadString(migrationScript);

          final statements = sql.split(kSqlStatementSeparator);
          for (final statement in statements) {
            await db.execute(statement.trim());
          }
        }
      },
      version: targetVersion,
    );

    log.info('Migrated to version $targetVersion');

    await db.close();

    await dbBackupFile?.delete();
  } catch (error, stackTrace) {
    log.severe('Failed to migrate database', error, stackTrace);

    if (db?.isOpen == true) {
      await db?.close();
    }

    if (await dbBackupFile?.exists() == true) {
      await dbBackupFile!.copy(dbPath);
      await dbBackupFile.delete();
    }

    rethrow;
  }
}

Future<File> exportDb(String dbName) async {
  final toDir = await getTemporaryDirectory();

  final dbDir = await getDatabasesPath();
  final dbPath = path.join(dbDir, dbName);
  final dbFile = File(dbPath);

  if (!(await dbFile.exists())) {
    throw ArgumentError('Database does not exist.');
  }

  final dbBackupPath = path.join(
    toDir.path,
    '$dbName.${dt.formatTimestamp(DateTime.now())}.backup',
  );

  return dbFile.copy(dbBackupPath);
}

Future<void> importDb(
  File fromFile,
  String dbName,
  int targetVersion,
  String migrationsDir,
) async {
  if (!(await fromFile.exists())) {
    throw ArgumentError('Source file does not exist.');
  }

  final dbDir = await getDatabasesPath();
  final dbPath = path.join(dbDir, dbName);
  final dbFile = File(dbPath);

  File? dbBackupFile;

  try {
    final dbBackupPath = path.join(
      dbDir,
      '$dbName.${dt.formatTimestamp(DateTime.now())}.backup',
    );
    dbBackupFile = await dbFile.copy(dbBackupPath);

    await fromFile.copy(dbPath);

    await migrateDb(dbName, targetVersion, migrationsDir);
  } catch (error) {
    if (await dbBackupFile?.exists() == true) {
      await dbBackupFile!.copy(dbPath);
      await dbBackupFile.delete();
    }

    rethrow;
  }
}

Future<Database> openDb(String dbName) async {
  final dbDir = await getDatabasesPath();
  final dbPath = path.join(dbDir, dbName);

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
