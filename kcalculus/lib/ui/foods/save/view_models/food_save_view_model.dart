import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/foods/save/view_models/food_save_ui_state.dart';

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
    try {
      final food = await _getFood();
      if (food == null) {
        return;
      }

      await ref.read(foodRepositoryProvider).save(food);

      _commander!.send(FoodSaveCommand.exit);
    } catch (error) {
      print(error);
      _commander!.send(FoodSaveCommand.showUnknownErrorNotification);
    }
  }

  FutureOr<Food?> _getFood() async {
    final edibleRepository = ref.read(edibleRepositoryProvider);
    final alreadyExists = await edibleRepository.exists(
      state.name,
      state.description,
      exceptWithId: state.id,
    );

    if (alreadyExists) {
      _commander!.send(FoodSaveCommand.showEdibleAlreadyExistsDialog);
      return null;
    }

    return Food(
      id: state.id,
      name: state.name,
      description: state.description,
      nutritionFacts: state.nutritionFacts!,
    );
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
