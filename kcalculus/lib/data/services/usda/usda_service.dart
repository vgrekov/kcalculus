import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:kcalculus/data/exceptions/localized_exception.dart';
import 'package:kcalculus/data/objectbox.g.dart';
import 'package:kcalculus/data/services/usda/food_usda_model.dart';
import 'package:kcalculus/data/services/usda/nutrient_usda_model.dart';
import 'package:kcalculus/data/services/usda/portion_usda_model.dart';
import 'package:kcalculus/utils/assets.dart';
import 'package:kcalculus/utils/batcher.dart';
import 'package:kcalculus/utils/crypto.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = Logger('UsdaService');

class UsdaService {
  static const _kStoreName = 'usda-foods';

  static const _kDumpAssetFilename = 'usda_foods.ndjson.gz';

  static const _kDumpAssetPath = 'assets/dumps/$_kDumpAssetFilename';

  static const _kDumpChecksumKey = 'USDA-Foods-Dump-Checksum';

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
    Store? store;

    try {
      final md5Tap = HashTap(hash: md5);

      final lineBatches = streamAsset(_kDumpAssetPath, chunkSizeInBytes: 65536)
          .transform(md5Tap)
          .transform(gzip.decoder)
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .transform(Batcher(200));

      store = await _openStore();

      store.box<PortionUsdaModel>().removeAll();
      store.box<NutrientUsdaModel>().removeAll();
      store.box<FoodUsdaModel>().removeAll();

      int size = 0;
      await for (final batch in lineBatches) {
        final ids = store.box<FoodUsdaModel>().putMany(
              batch
                  .map(jsonDecode)
                  .cast<Map<String, dynamic>>()
                  .map(FoodUsdaModel.fromJson)
                  .toList(),
            );
        size += ids.length;
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
      store?.close();
    }
  }

  static Future<String> _generateDumpChecksum() async {
    final byteData = await rootBundle.load(_kDumpAssetPath);
    final bytes = byteData.buffer.asUint8List();
    final digest = md5.convert(bytes);

    return digest.toString();
  }

  static Future<Store> _openStore() async {
    final docsDir = await getApplicationDocumentsDirectory();
    return openStore(
      directory: path.join(docsDir.path, _kStoreName),
    );
  }
}
