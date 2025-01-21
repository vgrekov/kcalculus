import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kcalculus/data/services/local/database/dao/edible/edible_dao.dart';
import 'package:kcalculus/data/services/local/database/dao/food/food_dao.dart';
import 'package:kcalculus/data/services/local/database/dao/ingredient/ingredient_dao.dart';
import 'package:kcalculus/data/services/local/database/dao/nutrition_facts/nutrition_facts_dao.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/exceptions.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const _kDbName = 'kcalculus.db';

  static const _kDbVersion = 16;

  static const _kSqlStatementSeparator = '--SQL-STATEMENT-SEPARATOR';

  static final _kMigrationNumberFormatter = NumberFormat('000');

  static const _kMigrationScriptPattern =
      'assets/db/migrations/{migration_number}.sql';

  static FutureOr<bool> isMigrationRequired() async {
    final dbDir = await getDatabasesPath();
    final dbPath = path.join(dbDir, _kDbName);

    final dbFile = File(dbPath);
    final dbExists = await dbFile.exists();
    if (!dbExists) return true;

    Database? db;
    try {
      db = await openDatabase(dbPath);
      final dbVersion = await db.getVersion();
      if (dbVersion < _kDbVersion) {
        return true;
      }
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskDbMigrationFailedMessage,
        cause: error,
      );
    } finally {
      if (db?.isOpen == true) {
        await db?.close();
      }
    }

    return false;
  }

  static FutureOr<void> migrateDatabase() async {
    final dbDir = await getDatabasesPath();
    final dbPath = path.join(dbDir, _kDbName);

    final dbFile = File(dbPath);
    final dbExists = await dbFile.exists();

    File? dbBackupFile;

    Database? db;
    try {
      if (dbExists) {
        final dbBackupPath = path.join(
          dbDir,
          '$_kDbName.${dt.formatTimestamp(DateTime.now())}.backup',
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
            final migrationScript = _kMigrationScriptPattern.replaceAll(
              '{migration_number}',
              migrationVersion,
            );
            final sql = await rootBundle.loadString(migrationScript);

            final statements = sql.split(_kSqlStatementSeparator);
            for (final statement in statements) {
              await db.execute(statement.trim());
            }
          }
        },
        version: _kDbVersion,
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
        (loc) => loc.maintenanceTaskDbMigrationFailedMessage,
        cause: error,
      );
    }
  }

  DatabaseService() {
    _database = _openDatabase();
    nutritionFactsDao = NutritionFactsDao(_database);
    edibleDao = EdibleDao(_database);
    foodDao = FoodDao(_database);
    ingredientDao = IngredientDao(_database);
  }

  late final Future<Database> _database;

  late final NutritionFactsDao nutritionFactsDao;

  late final EdibleDao edibleDao;

  late final FoodDao foodDao;

  late final IngredientDao ingredientDao;

  Future<Database> _openDatabase() async {
    final dbDir = await getDatabasesPath();
    final dbPath = path.join(dbDir, _kDbName);

    Database? db;
    try {
      db = await openDatabase(dbPath);
      return db;
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.databaseErrorFailedToOpen,
        cause: error,
      );
    } finally {
      if (db?.isOpen == true) {
        await db?.close();
      }
    }
  }

  Future<T> transaction<T>(Future<T> Function(Transaction) action) async {
    final db = await _database;
    return db.transaction(action);
  }

  void dispose() async {
    final db = await _database;
    db.close();
  }
}

final databaseService = FutureProvider.autoDispose<DatabaseService>(
  (ref) async {
    final dbService = DatabaseService();

    ref.onDispose(() {
      dbService.dispose();
    });

    return dbService;
  },
);
