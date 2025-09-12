import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:kcalculus/data/exceptions/localized_exception.dart';
import 'package:kcalculus/data/services/usda/food/usda_food_dto_model.dart';
import 'package:kcalculus/data/services/usda/food/usda_food_service.dart';
import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_service.dart';
import 'package:kcalculus/data/services/usda/portion/usda_portion_service.dart';
import 'package:kcalculus/data/utils/db_utils.dart';
import 'package:kcalculus/utils/assets.dart';
import 'package:kcalculus/utils/batcher.dart';
import 'package:kcalculus/utils/crypto.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final _log = Logger('UsdaService');

class UsdaService {
  static const _kDbName = 'usda.db';

  static const _kDbVersion = 2;

  static const _kDbMigrationsDir = 'assets/usda/db/migrations';

  static const _kDumpAssetFilename = 'usda_foods.ndjson.gz';

  static const _kDumpAssetPath = 'assets/usda/dumps/$_kDumpAssetFilename';

  static const _kDumpChecksumKey = 'USDA-Foods-Dump-Checksum';

  static FutureOr<bool> isMigrationRequired() async {
    try {
      return await isDbMigrationRequired(_kDbName, _kDbVersion);
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskUsdaDbMigrationFailedMessage,
        cause: error,
      );
    }
  }

  static FutureOr<void> migrateDatabase() async {
    try {
      await migrateDb(
        _kDbName,
        _kDbVersion,
        _kDbMigrationsDir,
      );
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskUsdaDbMigrationFailedMessage,
        cause: error,
      );
    }
  }

  static FutureOr<bool> isDumpLoadRequired() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final dumpChecksumOld = prefs.getString(_kDumpChecksumKey);

      if (dumpChecksumOld != null) {
        final dumpChecksumNew = await _generateDumpChecksum();
        if (dumpChecksumOld == dumpChecksumNew) {
          _log.finer('No loading required');
          return false;
        } else {
          _log.finer('Update loading required.');
        }
      } else {
        _log.finer('Initial loading required');
      }

      return true;
    } catch (error, stackTrace) {
      _log.severe('Failed to check if USDA FoodData dump loading required',
          error, stackTrace);

      throw LocalizedException(
        (loc) => loc.maintenanceTaskUsdaFoodDataLoadingFailedMessage,
        cause: error,
      );
    }
  }

  static FutureOr<void> loadDump() async {
    Database? db;

    try {
      final md5Tap = HashTap(hash: md5);

      final lineBatches = streamAsset(_kDumpAssetPath, chunkSizeInBytes: 65536)
          .transform(md5Tap)
          .transform(gzip.decoder)
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .transform(Batcher(200));

      db = await openDb(_kDbName);

      final foodService = UsdaFoodService(db);
      final portionService = UsdaPortionService(db);
      final nutrientService = UsdaNutrientService(db);

      await db.transaction((txn) async {
        await nutrientService.deleteAll(txn: txn);
        await portionService.deleteAll(txn: txn);
        await foodService.deleteAll(txn: txn);
      });

      int size = 0;
      await for (final lines in lineBatches) {
        final batch = db.batch();

        final foods = lines
            .map(jsonDecode)
            .cast<Map<String, dynamic>>()
            .map(UsdaFoodDtoModel.fromJson)
            .toList();

        foodService.batchInsert(foods, batch: batch);

        for (final food in foods) {
          if (food.portions != null) {
            portionService.batchInsert(
              food.portions!,
              food.fdcId,
              batch: batch,
            );
          }
          nutrientService.batchInsert(
            food.nutrients,
            food.fdcId,
            batch: batch,
          );
        }

        batch.commit(noResult: true);

        size += lines.length;
      }

      final dumpChecksum = md5Tap.digest.toString();

      _log.info('Loaded $size records from dump $dumpChecksum');

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_kDumpChecksumKey, dumpChecksum);
    } catch (error, stackTrace) {
      _log.severe('Failed to load USDA FoodData dump', error, stackTrace);

      throw LocalizedException(
        (loc) => loc.maintenanceTaskUsdaFoodDataLoadingFailedMessage,
        cause: error,
      );
    } finally {
      db?.close();
    }
  }

  static Future<String> _generateDumpChecksum() async {
    final byteData = await rootBundle.load(_kDumpAssetPath);
    final bytes = byteData.buffer.asUint8List();
    final digest = md5.convert(bytes);

    return digest.toString();
  }

  UsdaService() {
    _database = openDb(_kDbName);
    foods = UsdaFoodService(_database);
    portions = UsdaPortionService(_database);
    nutrients = UsdaNutrientService(_database);
  }

  late final Future<Database> _database;

  late final UsdaFoodService foods;

  late final UsdaPortionService portions;

  late final UsdaNutrientService nutrients;

  void dispose() async {
    final db = await _database;
    if (db.isOpen) {
      db.close();
    }
  }
}
