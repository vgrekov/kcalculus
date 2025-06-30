import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/foods/view/view_models/food_view_ui_state.dart';

enum FoodViewCommand {
  showUnknownErrorNotification,
  confirmEditEaten,
  editFood,
}

class FoodViewViewModel
    extends AutoDisposeFamilyAsyncNotifier<FoodViewUiState, String> {
  UiCommander<FoodViewCommand>? _commander;

  @override
  FutureOr<FoodViewUiState> build(String arg) async {
    _commander = UiCommander<FoodViewCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    final foodRepository = ref.read(foodRepositoryProvider);
    final food = await foodRepository.getById(arg);
    if (food == null) {
      throw ArgumentError('Food not found for ID: $arg');
    }

    final nutrientDefaults =
        await ref.read(nutrientRepositoryProvider).getDefaults();

    return FoodViewUiState(
      food: food,
      nutrientDefaults: nutrientDefaults,
    );
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void copyFood() {
    final uiState = state.unwrapPrevious().valueOrNull;
    if (uiState != null) {
      _commander!.send<FoodViewUiState, void>(
        FoodViewCommand.editFood,
        payload: uiState.copyWith(
          food: uiState.food.copy(),
        ),
      );
    }
  }

  void editFood() async {
    final uiState = state.unwrapPrevious().valueOrNull;
    if (uiState != null) {
      final edibleRepository = ref.read(edibleRepositoryProvider);
      final wasEaten = await edibleRepository.wasEaten(uiState.food.id!);

      if (wasEaten) {
        final editConfirmed = await _commander!.send<void, bool?>(
          FoodViewCommand.confirmEditEaten,
        );

        if (editConfirmed == true) {
          _commander!.send<FoodViewUiState, void>(
            FoodViewCommand.editFood,
            payload: uiState,
          );
        } else if (editConfirmed == false) {
          _commander!.send<FoodViewUiState, void>(
            FoodViewCommand.editFood,
            payload: uiState.copyWith(
              food: uiState.food.copy(),
            ),
          );
        }
      } else {
        _commander!.send<FoodViewUiState, void>(
          FoodViewCommand.editFood,
          payload: uiState,
        );
      }
    }
  }
}

final foodViewViewModel = AsyncNotifierProvider.autoDispose
    .family<FoodViewViewModel, FoodViewUiState, String>(
  FoodViewViewModel.new,
);
