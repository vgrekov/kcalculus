import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:kcalculus/data/exceptions/localized_exception.dart';
import 'package:kcalculus/data/services/local/database/default_nutrient/default_nutrient_service.dart';
import 'package:kcalculus/data/services/local/database/dish/dish_service.dart';
import 'package:kcalculus/data/services/local/database/edible/edible_service.dart';
import 'package:kcalculus/data/services/local/database/food/food_service.dart';
import 'package:kcalculus/data/services/local/database/food_container/food_container_service.dart';
import 'package:kcalculus/data/services/local/database/ingredient/ingredient_service.dart';
import 'package:kcalculus/data/services/local/database/meal/meal_service.dart';
import 'package:kcalculus/data/services/local/database/nutrient_amount/nutrient_amount_service.dart';
import 'package:kcalculus/data/services/local/database/nutrition_facts/nutrition_facts_service.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const _kDbName = 'kcalculus.db';

  static const _kDbVersion = 20;

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

  static Future<File> exportDatabase() async {
    final toDir = await getTemporaryDirectory();

    final dbDir = await getDatabasesPath();
    final dbPath = path.join(dbDir, _kDbName);
    final dbFile = File(dbPath);

    if (!(await dbFile.exists())) {
      throw ArgumentError('Database does not exist.');
    }

    final dbBackupPath = path.join(
      toDir.path,
      '$_kDbName.${dt.formatTimestamp(DateTime.now())}.backup',
    );

    return dbFile.copy(dbBackupPath);
  }

  static Future<void> importDatabase(File fromFile) async {
    if (!(await fromFile.exists())) {
      throw ArgumentError('Source file does not exist.');
    }

    final dbDir = await getDatabasesPath();
    final dbPath = path.join(dbDir, _kDbName);
    final dbFile = File(dbPath);

    File? dbBackupFile;

    try {
      final dbBackupPath = path.join(
        dbDir,
        '$_kDbName.${dt.formatTimestamp(DateTime.now())}.backup',
      );
      dbBackupFile = await dbFile.copy(dbBackupPath);

      await fromFile.copy(dbPath);

      await migrateDatabase();
    } catch (error) {
      if (await dbBackupFile?.exists() == true) {
        await dbBackupFile!.copy(dbPath);
        await dbBackupFile.delete();
      }

      rethrow;
    }
  }

  static Future<Database> _openDatabase() async {
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
    }
  }

  DatabaseService() {
    _database = _openDatabase();
    nutritionFacts = NutritionFactsService(_database);
    edible = EdibleService(_database);
    food = FoodService(_database);
    ingredient = IngredientService(_database);
    dish = DishService(_database);
    meal = MealService(_database);
    foodContainer = FoodContainerService(_database);
    defaultNutrient = DefaultNutrientService(_database);
    nutrientAmount = NutrientAmountService(_database);
  }

  late final Future<Database> _database;

  late final NutritionFactsService nutritionFacts;

  late final EdibleService edible;

  late final FoodService food;

  late final IngredientService ingredient;

  late final DishService dish;

  late final MealService meal;

  late final FoodContainerService foodContainer;

  late final DefaultNutrientService defaultNutrient;

  late final NutrientAmountService nutrientAmount;

  Future<T> transaction<T>(Future<T> Function(Transaction) action) async {
    final db = await _database;
    return db.transaction(action);
  }

  Future<void> dispose() async {
    final db = await _database;
    return db.close();
  }
}
