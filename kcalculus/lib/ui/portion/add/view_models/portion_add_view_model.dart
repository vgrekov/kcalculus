import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/portion/add/view_models/portion_add_ui_state.dart';

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

class PortionAddViewModel extends Notifier<PortionAddUiState>
    with UiCommander<PortionAddCommand> {
  @override
  PortionAddUiState build() {
    return PortionAddUiState();
  }

  void reset() {
    state = build();
  }

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
    try {
      if (!_checkIfCommonMeasureExists()) {
        return;
      }

      final edible = await _getEdible();
      if (edible == null) {
        return;
      }

      final amount = state.getAmount()!;

      await onSavePortion(edible, amount);

      sendCommand(PortionAddCommand.exit);
    } catch (error) {
      print(error);
      sendCommand(PortionAddCommand.showUnknownErrorNotification);
    }
  }

  bool _checkIfCommonMeasureExists() {
    final hasCommonMeasure = state.nutritionFacts!
        .any((nf) => nf.amount.unit.measure == state.amountUnit!.measure);
    if (!hasCommonMeasure) {
      sendCommand(PortionAddCommand.showNoCommonMeasureMessage);
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
      return state.selectedEdible;
    }

    final edibleRepository = ref.read(edibleRepositoryProvider);
    final alreadyExists = await edibleRepository.exists(
      state.name,
      state.description,
    );

    if (selectedEdibleModified == null && alreadyExists) {
      sendCommand(PortionAddCommand.showEdibleAlreadyExistsDialog);
      return null;
    }

    if (selectedEdibleModified == true && alreadyExists) {
      sendCommand(
          PortionAddCommand.showSelectedEdibleModifiedAlreadyExistsDialog);
      return null;
    }

    if (selectedEdibleModified == true && !alreadyExists) {
      final edibleOption = await sendCommand<void, ModifiedEdibleOption?>(
        PortionAddCommand.showSelectedEdibleModifiedCreatesNewDialog,
      );
      if (edibleOption != null) {
        switch (edibleOption) {
          case ModifiedEdibleOption.useSelected:
            selectEdible(state.selectedEdible!);
            if (_checkIfCommonMeasureExists()) {
              return state.selectedEdible;
            }
            return null;
          case ModifiedEdibleOption.createNew:
            return _buildFood();
        }
      }
      return null;
    }

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
    NotifierProvider<PortionAddViewModel, PortionAddUiState>(
  () => PortionAddViewModel(),
);
