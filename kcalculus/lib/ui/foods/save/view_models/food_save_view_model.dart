import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/exceptions/duplication_exception.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/foods/save/view_models/food_save_ui_state.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('FoodSaveViewModel');

enum FoodSaveCommand {
  showUnknownErrorNotification,
  showEdibleAlreadyExistsDialog,
  confirmDiscardChanges,
  exit,
}

class FoodSaveViewModel
    extends AutoDisposeFamilyNotifier<FoodSaveUiState, Food?> {
  UiCommander<FoodSaveCommand>? _commander;

  bool _hasChanges = false;

  @override
  FoodSaveUiState build(Food? arg) {
    _commander = UiCommander<FoodSaveCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    if (arg != null) {
      return FoodSaveUiState(
        id: arg.id,
        name: arg.name,
        description: arg.description,
        nutritionFacts: arg.nutritionFacts,
      );
    }

    return FoodSaveUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void updateState({
    required String name,
    required String description,
    List<NutritionFacts>? nutritionFacts,
  }) {
    state = state.copyWith(
      name: name,
      description: description,
      nutritionFacts: nutritionFacts,
    );
  }

  Future<void> saveFood() async {
    _log.finer('saveFood() START');

    try {
      var food = state.toFood();

      _log.finest('saveFood() Saving food: ${food.toJson()}');

      food = await ref.read(foodRepositoryProvider.notifier).save(food);

      _log.info('Food saved');
      _log.finest('saveFood() Saved food ID: ${food.id}');
      _log.eventFoodSave();

      _commander!.send(FoodSaveCommand.exit);
    } on DuplicationException {
      _log.finer('Edible already exists');

      _commander!.send(FoodSaveCommand.showEdibleAlreadyExistsDialog);
    } catch (error, stackTrace) {
      _log.severe('Failed to save food', error, stackTrace);

      _commander!.send(FoodSaveCommand.showUnknownErrorNotification);
    }

    _log.finer('saveFood() END');
  }

  Future<bool> shouldExit() async {
    final bool? result;
    if (_hasChanges) {
      result = await _commander!.send<void, bool?>(
        FoodSaveCommand.confirmDiscardChanges,
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

final foodSaveViewModel = NotifierProvider.autoDispose
    .family<FoodSaveViewModel, FoodSaveUiState, Food?>(
  FoodSaveViewModel.new,
);
