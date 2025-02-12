import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
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

  void readFood(String barcode) {
    _log.finer('readFood() START');

    try {
      _log.finest('readFood() Reading food from barcode: $barcode');

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

        _commander?.send(FoodScanCommand.showVersionMismatchNotification);

        return;
      }

      final food = Food.fromJson(json);

      _log.info('Food read from barcode');

      _commander?.send<Food, void>(
        FoodScanCommand.provideFood,
        payload: food,
      );
    } catch (error, stackTrace) {
      _log.info('Failed to read food from barcode', error, stackTrace);

      _commander?.send(FoodScanCommand.showCantReadNotification);
    }

    _log.finer('readFood() END');
  }
}

final foodScanViewModel = NotifierProvider.autoDispose<FoodScanViewModel, void>(
  FoodScanViewModel.new,
);
