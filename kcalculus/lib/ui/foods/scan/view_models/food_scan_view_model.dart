import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('FoodScanCommand');

enum FoodScanCommand {
  showCantReadNotification,
  showVersionMismatchNotification,
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
    final jsonVersion = json['version'] as int?;
    if (jsonVersion != Food.kVersion) {
      _log.info(
        '''
          Version msimatch while reading food from barcode:
          Expected ${Food.kVersion}, but found $jsonVersion
          ''',
      );
      _log.eventFoodScanVersionMismatch(Food.kVersion, jsonVersion);

      _commander?.send(FoodScanCommand.showVersionMismatchNotification);

      return null;
    }

    final food = Food.fromJson(json);

    _log.info('Food read from barcode');
    _log.eventFoodScanFromBarcode();

    return food;
  }

  Future<Food?> _searchOpenFoodFacts(String barcode) async {
    final openFoodFactsRepository =
        await ref.read(openFoodFactsRepositoryProvider.future);

    final nutrientDefaults =
        await ref.read(nutrientRepositoryProvider).getDefaults();

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
