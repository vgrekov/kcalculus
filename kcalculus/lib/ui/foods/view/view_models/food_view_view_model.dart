import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/foods/view/view_models/food_view_ui_state.dart';
import 'package:kcalculus/ui/foods/view/view_models/food_view_view_model_arg.dart';

enum FoodViewCommand {
  showUnknownErrorNotification,
  confirmEditEaten,
  editFood,
}

class FoodViewViewModel extends AutoDisposeFamilyAsyncNotifier<FoodViewUiState,
    FoodViewViewModelArg> {
  UiCommander<FoodViewCommand>? _commander;

  @override
  FutureOr<FoodViewUiState> build(FoodViewViewModelArg arg) async {
    _commander = UiCommander<FoodViewCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    final Food? food;

    if (arg.isUsdaFood) {
      final usdaFoodRepository = ref.read(usdaFoodRepositoryProvider);
      food = await usdaFoodRepository.getById(arg.foodId);
    } else {
      final foodRepository = ref.read(foodRepositoryProvider);
      food = await foodRepository.getById(arg.foodId);
    }

    if (food == null) {
      throw ArgumentError('Food not found for ID: ${arg.foodId}');
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

  void saveUsdaFood() {
    final uiState = state.unwrapPrevious().valueOrNull;
    if (uiState != null) {
      _commander!.send<FoodViewUiState, void>(
        FoodViewCommand.editFood,
        payload: uiState.copyWith(
          food: uiState.food.copyWith(id: null),
        ),
      );
    }
  }
}

final foodViewViewModel = AsyncNotifierProvider.autoDispose
    .family<FoodViewViewModel, FoodViewUiState, FoodViewViewModelArg>(
  FoodViewViewModel.new,
);
