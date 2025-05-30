import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/dishes/view/view_models/dish_view_ui_state.dart';

enum DishViewCommand {
  showUnknownErrorNotification,
  confirmEditEaten,
  editDish,
}

class DishViewViewModel
    extends AutoDisposeFamilyAsyncNotifier<DishViewUiState, String> {
  UiCommander<DishViewCommand>? _commander;

  @override
  FutureOr<DishViewUiState> build(String arg) async {
    _commander = UiCommander<DishViewCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    final dishRepository = ref.read(dishRepositoryProvider);
    final dish = await dishRepository.getById(arg);
    if (dish == null) {
      throw ArgumentError('Dish not found for ID: $arg');
    }

    final nutrientDefaults =
        await ref.read(nutrientRepositoryProvider).getDefaults();

    return DishViewUiState(
      dish: dish,
      nutrientDefaults: nutrientDefaults,
    );
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void copyDish() {
    final uiState = state.unwrapPrevious().valueOrNull;
    if (uiState != null) {
      _commander!.send<DishViewUiState, void>(
        DishViewCommand.editDish,
        payload: uiState.copyWith(
          dish: uiState.dish.copy(),
        ),
      );
    }
  }

  void editDish() async {
    final uiState = state.unwrapPrevious().valueOrNull;
    if (uiState != null) {
      final edibleRepository = ref.read(edibleRepositoryProvider);
      final wasEaten = await edibleRepository.wasEaten(uiState.dish.id!);

      if (wasEaten) {
        final editConfirmed = await _commander!.send<void, bool?>(
          DishViewCommand.confirmEditEaten,
        );

        if (editConfirmed == true) {
          _commander!.send<DishViewUiState, void>(
            DishViewCommand.editDish,
            payload: uiState,
          );
        } else if (editConfirmed == false) {
          _commander!.send<DishViewUiState, void>(
            DishViewCommand.editDish,
            payload: uiState.copyWith(
              dish: uiState.dish.copy(),
            ),
          );
        }
      } else {
        _commander!.send<DishViewUiState, void>(
          DishViewCommand.editDish,
          payload: uiState,
        );
      }
    }
  }
}

final dishViewViewModel = AsyncNotifierProvider.autoDispose
    .family<DishViewViewModel, DishViewUiState, String>(
  DishViewViewModel.new,
);
