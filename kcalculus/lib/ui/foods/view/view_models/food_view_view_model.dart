import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';

enum FoodViewCommand {
  showUnknownErrorNotification,
  confirmEditEaten,
  editFood,
}

class FoodViewViewModel extends AutoDisposeFamilyAsyncNotifier<Food, String>
    with UiCommander<FoodViewCommand> {
  @override
  FutureOr<Food> build(String arg) async {
    final foodRepository = ref.read(foodRepositoryProvider);
    final food = await foodRepository.getById(arg);
    if (food == null) {
      throw ArgumentError('Food not found for ID: $arg');
    }

    return food;
  }

  void copyFood() {
    final food = state.unwrapPrevious().valueOrNull;
    if (food != null) {
      sendCommand<Food, void>(
        FoodViewCommand.editFood,
        payload: food.copy(),
      );
    }
  }

  void editFood() async {
    final food = state.unwrapPrevious().valueOrNull;
    if (food != null) {
      final edibleRepository = ref.read(edibleRepositoryProvider);
      final wasEaten = await edibleRepository.wasEaten(food.id!);

      if (wasEaten) {
        final editConfirmed = await sendCommand<void, bool?>(
          FoodViewCommand.confirmEditEaten,
        );

        if (editConfirmed == true) {
          sendCommand<Food, void>(
            FoodViewCommand.editFood,
            payload: food,
          );
        } else if (editConfirmed == false) {
          sendCommand<Food, void>(
            FoodViewCommand.editFood,
            payload: food.copy(),
          );
        }
      } else {
        sendCommand<Food, void>(
          FoodViewCommand.editFood,
          payload: food,
        );
      }
    }
  }
}

final foodViewViewModel =
    AsyncNotifierProvider.autoDispose.family<FoodViewViewModel, Food, String>(
  FoodViewViewModel.new,
);
