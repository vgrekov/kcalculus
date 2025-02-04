import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';

enum DishViewCommand {
  showUnknownErrorNotification,
  confirmEditEaten,
  editDish,
}

class DishViewViewModel extends AutoDisposeFamilyAsyncNotifier<Dish, String> {
  UiCommander<DishViewCommand>? _commander;

  @override
  FutureOr<Dish> build(String arg) async {
    _commander = UiCommander<DishViewCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    final dishRepository = ref.read(dishRepositoryProvider);
    final dish = await dishRepository.getById(arg);
    if (dish == null) {
      throw ArgumentError('Dish not found for ID: $arg');
    }

    return dish;
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void copyDish() {
    final dish = state.unwrapPrevious().valueOrNull;
    if (dish != null) {
      _commander!.send<Dish, void>(
        DishViewCommand.editDish,
        payload: dish.copy(),
      );
    }
  }

  void editDish() async {
    final dish = state.unwrapPrevious().valueOrNull;
    if (dish != null) {
      final edibleRepository = ref.read(edibleRepositoryProvider);
      final wasEaten = await edibleRepository.wasEaten(dish.id!);

      if (wasEaten) {
        final editConfirmed = await _commander!.send<void, bool?>(
          DishViewCommand.confirmEditEaten,
        );

        if (editConfirmed == true) {
          _commander!.send<Dish, void>(
            DishViewCommand.editDish,
            payload: dish,
          );
        } else if (editConfirmed == false) {
          _commander!.send<Dish, void>(
            DishViewCommand.editDish,
            payload: dish.copy(),
          );
        }
      } else {
        _commander!.send<Dish, void>(
          DishViewCommand.editDish,
          payload: dish,
        );
      }
    }
  }
}

final dishViewViewModel =
    AsyncNotifierProvider.autoDispose.family<DishViewViewModel, Dish, String>(
  DishViewViewModel.new,
);
