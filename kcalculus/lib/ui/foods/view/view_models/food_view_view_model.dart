import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';

enum FoodViewCommand {
  showUnknownErrorNotification,
  confirmEditEaten,
  editFood,
}

class FoodViewViewModel extends AutoDisposeFamilyAsyncNotifier<Food, String> {
  final _commander = UiCommander<FoodViewCommand>();

  @override
  FutureOr<Food> build(String arg) async {
    ref.onDispose(() {
      _commander.dispose();
    });

    final foodRepository = ref.read(foodRepositoryProvider);
    final food = await foodRepository.getById(arg);
    if (food == null) {
      throw ArgumentError('Food not found for ID: $arg');
    }

    return food;
  }

  StreamProvider<UiCommand> get commandProvider => _commander.provider;

  void copyFood() {
    final food = state.unwrapPrevious().valueOrNull;
    if (food != null) {
      _commander.send<Food, void>(
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
        final editConfirmed = await _commander.send<void, bool?>(
          FoodViewCommand.confirmEditEaten,
        );

        if (editConfirmed == true) {
          _commander.send<Food, void>(
            FoodViewCommand.editFood,
            payload: food,
          );
        } else if (editConfirmed == false) {
          _commander.send<Food, void>(
            FoodViewCommand.editFood,
            payload: food.copy(),
          );
        }
      } else {
        _commander.send<Food, void>(
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
