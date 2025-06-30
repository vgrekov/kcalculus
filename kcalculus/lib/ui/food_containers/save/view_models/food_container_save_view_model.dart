import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/exceptions/duplication_exception.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/food_containers/save/view_models/food_container_save_ui_state.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('FoodContainerSaveViewModel');

enum FoodContainerSaveCommand {
  showContainerAlreadyExistsDialog,
  showUnknownErrorNotification,
  confirmDiscardChanges,
  exit,
}

class FoodContainerSaveViewModel extends AutoDisposeFamilyNotifier<
    FoodContainerSaveUiState, FoodContainer?> {
  UiCommander<FoodContainerSaveCommand>? _commander;

  bool _hasChanges = false;

  @override
  FoodContainerSaveUiState build(FoodContainer? arg) {
    _commander = UiCommander<FoodContainerSaveCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    if (arg != null) {
      return FoodContainerSaveUiState(
        id: arg.id,
        name: arg.name,
        description: arg.description,
        weightUnit: arg.weight.unit,
        weightValue: arg.weight.value,
      );
    }

    return FoodContainerSaveUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void updateState({
    required String name,
    required String description,
    required Unit weightUnit,
    double? weightValue,
  }) {
    state = state.copyWith(
      name: name,
      description: description,
      weightUnit: weightUnit,
      weightValue: weightValue,
    );
  }

  Future<void> saveFoodContainer() async {
    _log.finer('saveFoodContainer() START');

    try {
      var container = state.toFoodContainer();

      _log.finest(
          'saveFoodContainer() Saving food container: ${container.toJson()}');

      container =
          await ref.read(foodContainerRepositoryProvider).save(container);

      _log.info('Food container saved');
      _log.finest(
          'saveFoodContainer() Saved food container ID: ${container.id}');
      _log.eventFoodSave();

      _commander!.send(FoodContainerSaveCommand.exit);
    } on DuplicationException {
      _log.finer('Food container already exists');

      _commander!
          .send(FoodContainerSaveCommand.showContainerAlreadyExistsDialog);
    } catch (error, stackTrace) {
      _log.severe('Failed to save food container', error, stackTrace);

      _commander!.send(FoodContainerSaveCommand.showUnknownErrorNotification);
    }

    _log.finer('saveFoodContainer() END');
  }

  Future<bool> shouldExit() async {
    final bool? result;
    if (_hasChanges) {
      result = await _commander!.send<void, bool?>(
        FoodContainerSaveCommand.confirmDiscardChanges,
      );
    } else {
      result = true;
    }

    return result == true;
  }

  void onUserInteractionChange() {
    _hasChanges = true;
  }
}

final foodContainerSaveViewModel = NotifierProvider.autoDispose.family<
    FoodContainerSaveViewModel, FoodContainerSaveUiState, FoodContainer?>(
  FoodContainerSaveViewModel.new,
);
