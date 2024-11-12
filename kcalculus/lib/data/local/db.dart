import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

const _dbName = 'kcalculus.db';
const _dbVersion = 10;

final _migrationNumberFormatter = NumberFormat('000');
const _migrationScriptPattern = 'assets/db/migrations/{migration_number}.sql';

final dbProvider = Provider<Future<Database>>((ref) async {
  final dbPath = await getDatabasesPath();
  return openDatabase(
    path.join(dbPath, _dbName),
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
        await db.execute(sql);
      }
    },
    version: _dbVersion,
  );
});
