import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kcalculus/maintenance/init.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/exceptions.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

const _dbName = 'kcalculus.db';
const _dbVersion = 16;
const _sqlStatementSeparator = '--SQL-STATEMENT-SEPARATOR';

final _migrationNumberFormatter = NumberFormat('000');
const _migrationScriptPattern = 'assets/db/migrations/{migration_number}.sql';

class DbInitTask implements InitTask {
  @override
  InitTaskInfo getInfo(AppLocalizations localizations) {
    return InitTaskInfo(
      title: localizations.initTaskDbTitle,
    );
  }

  @override
  FutureOr<void> run() async {
    // TODO: delete this!
    await Future.delayed(Duration(seconds: 3));

    final dbDir = await getDatabasesPath();

    final dbPath = path.join(dbDir, _dbName);
    final dbFile = File(dbPath);
    final dbExists = await dbFile.exists();

    File? dbBackupFile;

    Database? db;

    try {
      if (dbExists) {
        final dbBackupPath = path.join(
          dbDir,
          '$_dbName.${dt.formatTimestamp(DateTime.now())}.backup',
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
            final migrationVersion = _migrationNumberFormatter.format(version);
            final migrationScript = _migrationScriptPattern.replaceAll(
              '{migration_number}',
              migrationVersion,
            );
            final sql = await rootBundle.loadString(migrationScript);

            final statements = sql.split(_sqlStatementSeparator);
            for (final statement in statements) {
              await db.execute(statement.trim());
            }
          }
        },
        version: _dbVersion,
      );

      await db.close();

      await dbBackupFile?.delete();
    } catch (error) {
      if (db?.isOpen == true) {
        await db?.close();
      }

      if (await dbBackupFile?.exists() == true) {
        await dbBackupFile!.copy(dbPath);
        await dbBackupFile.delete();
      }

      throw LocalizedException(
        (loc) => loc.initTaskDbFailedMessage,
        cause: error,
      );
    }
  }
}

final dbProvider = Provider.autoDispose<Future<Database>>((ref) async {
  final dbDir = await getDatabasesPath();
  final dbPath = path.join(dbDir, _dbName);
  final db = await openDatabase(dbPath);

  ref.onDispose(() {
    db.close();
  });

  return db;
});
