import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/open_food_facts/open_food_facts.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/food/exceptions/unsupported_version_exception.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('FoodScanCommand');

enum FoodScanCommand {
  showCantReadNotification,
  showUnsupportedVersionNotification,
  provideFood,
}

class FoodScanViewModel extends AutoDisposeNotifier<void> {
  UiCommander<FoodScanCommand>? _commander;

  @override
  void build() {
    _commander = UiCommander<FoodScanCommand>(_commander);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> readFood(String barcode) async {
    _log.finer('readFood() START');

    try {
      _log.finest('readFood() Reading food from barcode: $barcode');

      Food? food;

      try {
        food = _parseSharedFoodBarcode(barcode);
      } on UnsupportedVersionException catch (e) {
        _log.info(
          'Unsupported food version while scanning QR code: ${e.version}',
        );
        _log.eventFoodScanUnsupportedVersion(e.version);

        _commander?.send(FoodScanCommand.showUnsupportedVersionNotification);
      } catch (error) {
        food = await _searchOpenFoodFacts(barcode);

        if (food == null) {
          rethrow;
        }
      }

      if (food != null) {
        _commander?.send<Food, void>(
          FoodScanCommand.provideFood,
          payload: food,
        );
      }
    } catch (error, stackTrace) {
      _log.severe('Failed to read food from barcode', error, stackTrace);

      _commander?.send(FoodScanCommand.showCantReadNotification);
    }

    _log.finer('readFood() END');
  }

  Food? _parseSharedFoodBarcode(String barcode) {
    final compressedBytes = base64.decode(barcode);
    final bytes = gzip.decode(compressedBytes);
    final jsonString = utf8.decode(bytes);

    final Map<String, dynamic> json = jsonDecode(jsonString);

    final food = Food.fromJsonCompat(json);

    _log.info('Food read from barcode');
    _log.eventFoodScanFromBarcode();

    return food;
  }

  Future<Food?> _searchOpenFoodFacts(String barcode) async {
    final openFoodFactsRepository =
        ref.read(openFoodFactsRepositoryProvider.notifier);

    final nutrientDefaults =
        await ref.read(defaultNutrientRepositoryProvider.future);

    final food = await openFoodFactsRepository.getFoodByBarcode(
      barcode,
      nutrientDefaults,
    );

    if (food != null) {
      _log.info('Food found in OpenFoodFacts');
      _log.eventFoodScanFromOFF();
    }

    return food;
  }
}

final foodScanViewModel = NotifierProvider.autoDispose<FoodScanViewModel, void>(
  FoodScanViewModel.new,
);
