import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/_common/database/models/database_config.dart';
import 'package:kcalculus/data/_common/database/services/database_service.dart';
import 'package:kcalculus/data/usda/food/models/usda_food_dto_model.dart';
import 'package:kcalculus/data/usda/food/services/usda_food_service.dart';
import 'package:kcalculus/data/usda/nutrient/services/usda_nutrient_service.dart';
import 'package:kcalculus/data/usda/portion/services/usda_portion_service.dart';
import 'package:kcalculus/utils/assets.dart';
import 'package:kcalculus/utils/batcher.dart';
import 'package:kcalculus/utils/crypto.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final _log = Logger('UsdaService');

const _kUsdaDbConfig = DatabaseConfig(
  name: 'usda.db',
  version: 2,
  initScript: 'assets/db/enable_fk.sql',
  migrationsDir: 'assets/usda/db/migrations',
);

class UsdaService extends DatabaseService {
  static const _kDumpAssetFilename = 'usda_foods.ndjson.gz';

  static const _kDumpAssetPath = 'assets/usda/dumps/$_kDumpAssetFilename';

  static const _kDumpChecksumKey = 'USDA-Foods-Dump-Checksum';

  static Future<String> _generateDumpChecksum() async {
    final byteData = await rootBundle.load(_kDumpAssetPath);
    final bytes = byteData.buffer.asUint8List();
    final digest = md5.convert(bytes);

    return digest.toString();
  }

  FutureOr<bool> isDumpLoadRequired() async {
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

      rethrow;
    }
  }

  FutureOr<void> loadDump() async {
    ensureDatabaseIsReady();

    final db = state.asData!.value;

    try {
      final md5Tap = HashTap(hash: md5);

      final lineBatches = streamAsset(_kDumpAssetPath, chunkSizeInBytes: 65536)
          .transform(md5Tap)
          .transform(gzip.decoder)
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .transform(Batcher(200));

      final foodService = ref.read(usdaFoodServiceProvider.notifier);
      final portionService = ref.read(usdaPortionServiceProvider.notifier);
      final nutrientService = ref.read(usdaNutrientServiceProvider.notifier);

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
      await prefs.setString(_kDumpChecksumKey, dumpChecksum);
    } catch (error, stackTrace) {
      _log.severe('Failed to load USDA FoodData dump', error, stackTrace);

      rethrow;
    }
  }
}

final usdaServiceProvider =
    AsyncNotifierProvider.family<UsdaService, Database, DatabaseConfig>(
  UsdaService.new,
)(_kUsdaDbConfig);
