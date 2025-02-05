import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/portions/add/view_models/portion_add_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('PortionAddViewModel');

enum PortionAddCommand {
  showUnknownErrorNotification,
  showNoCommonMeasureMessage,
  showEdibleAlreadyExistsDialog,
  showSelectedEdibleModifiedAlreadyExistsDialog,
  showSelectedEdibleModifiedCreatesNewDialog,
  exit,
}

enum ModifiedEdibleOption {
  useSelected,
  createNew,
}

class PortionAddViewModel extends AutoDisposeNotifier<PortionAddUiState> {
  UiCommander<PortionAddCommand>? _commander;

  @override
  PortionAddUiState build() {
    _commander = UiCommander<PortionAddCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return PortionAddUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void selectEdible(Edible edible) {
    state = state.copyWith(
      selectedEdible: edible,
      name: edible.name,
      description: edible.description,
      nutritionFacts: edible.getNutritionFacts(),
    );
  }

  void updateState({
    required String name,
    required String description,
    Unit? amountUnit,
    double? amountValue,
    List<NutritionFacts>? nutritionFacts,
  }) {
    state = state.copyWith(
      name: name,
      description: description,
      amountUnit: amountUnit,
      amountValue: amountValue,
      nutritionFacts: nutritionFacts,
    );
  }

  Future<void> savePortion(
    FutureOr<void> Function(Edible, Amount) onSavePortion,
  ) async {
    _log.finer('savePortion() START');

    try {
      _log.finer('savePortion() Checking for common measure');

      if (!_checkIfCommonMeasureExists()) {
        _log.finer('savePortion() Common measure not found');

        return;
      }

      _log.finer('savePortion() Getting edible');

      final edible = await _getEdible();
      if (edible == null) {
        _log.finer('savePortion() No edible');

        return;
      }

      _log.finest('savePortion() Using edible: ${edible.toJson()}');

      final amount = state.getAmount()!;

      _log.finer('savePortion() Saving portion');

      await onSavePortion(edible, amount);

      _commander!.send(PortionAddCommand.exit);
    } catch (error, stackTrace) {
      _log.severe('Failed to save portion', error, stackTrace);

      _commander!.send(PortionAddCommand.showUnknownErrorNotification);
    }

    _log.finer('savePortion() END');
  }

  bool _checkIfCommonMeasureExists() {
    final hasCommonMeasure = state.amountUnit != null &&
        state.nutritionFacts != null &&
        state.nutritionFacts!
            .any((nf) => nf.amount.unit.measure == state.amountUnit!.measure);
    if (!hasCommonMeasure) {
      _commander!.send(PortionAddCommand.showNoCommonMeasureMessage);
      return false;
    }

    return true;
  }

  bool? _isSelectedEdibleModified() {
    if (state.selectedEdible != null) {
      if (state.selectedEdible!.name != state.name ||
          state.selectedEdible!.description != state.description) {
        return true;
      }

      final nutritionFactsEntered = state.nutritionFacts!.toSet();
      final nutritionFactsSelected =
          state.selectedEdible!.getNutritionFacts().toSet();
      if (!setEquals(nutritionFactsEntered, nutritionFactsSelected)) {
        return true;
      }

      return false;
    }

    return null;
  }

  FutureOr<Edible?> _getEdible() async {
    final selectedEdibleModified = _isSelectedEdibleModified();

    if (selectedEdibleModified == false) {
      _log.finer('_getEdible() No changes, so using selected edible');

      return state.selectedEdible;
    }

    final edibleRepository = ref.read(edibleRepositoryProvider);
    final alreadyExists = await edibleRepository.exists(
      state.name,
      state.description,
    );

    if (selectedEdibleModified == null && alreadyExists) {
      _log.finer(
        '_getEdible() Nothing selected, but such edible already exists',
      );

      _commander!.send(PortionAddCommand.showEdibleAlreadyExistsDialog);
      return null;
    }

    if (selectedEdibleModified == true && alreadyExists) {
      _log.finer(
        '_getEdible() Selected modified, but such edible already exists',
      );

      _commander!.send(
          PortionAddCommand.showSelectedEdibleModifiedAlreadyExistsDialog);
      return null;
    }

    if (selectedEdibleModified == true && !alreadyExists) {
      _log.finer('_getEdible() Selected modified, asking for instructions');

      final edibleOption = await _commander!.send<void, ModifiedEdibleOption?>(
        PortionAddCommand.showSelectedEdibleModifiedCreatesNewDialog,
      );

      if (edibleOption != null) {
        switch (edibleOption) {
          case ModifiedEdibleOption.useSelected:
            selectEdible(state.selectedEdible!);
            if (_checkIfCommonMeasureExists()) {
              _log.finer('_getEdible() Using selected (as instructed)');

              return state.selectedEdible;
            }

            _log.finer('_getEdible() Common measure not found for selected');

            return null;
          case ModifiedEdibleOption.createNew:
            _log.finer('_getEdible() Creating new food (as instructed)');

            return _buildFood();
        }
      }
      return null;
    }

    _log.finer('_getEdible() Creating new food');

    return _buildFood();
  }

  Edible _buildFood() {
    return Food(
      name: state.name,
      description: state.description,
      nutritionFacts: state.nutritionFacts!,
    );
  }
}

final portionAddViewModel =
    NotifierProvider.autoDispose<PortionAddViewModel, PortionAddUiState>(
  () => PortionAddViewModel(),
);
