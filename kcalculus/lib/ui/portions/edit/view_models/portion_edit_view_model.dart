import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/portion.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/portions/edit/view_models/portion_edit_ui_state.dart';

enum PortionEditCommand {
  showUnknownErrorNotification,
  showNoCommonMeasureMessage,
  exit,
}

class PortionEditViewModel extends Notifier<PortionEditUiState> {
  final _commander = UiCommander<PortionEditCommand>();

  @override
  PortionEditUiState build() {
    ref.onDispose(() {
      _commander.dispose();
    });

    return PortionEditUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander.provider;

  void reset() {
    state = build();
  }

  void loadPortion(Portion portion) {
    state = state.copyWith(
      edible: portion.edible,
      amountUnit: portion.amount.unit,
      amountValue: portion.amount.value,
    );
  }

  void updateState({
    Unit? amountUnit,
    double? amountValue,
  }) {
    state = state.copyWith(
      amountUnit: amountUnit,
      amountValue: amountValue,
    );
  }

  Future<void> savePortion(
    FutureOr<void> Function(Amount) onSavePortion,
  ) async {
    try {
      if (!_checkIfCommonMeasureExists()) {
        return;
      }

      final amount = state.getAmount()!;

      await onSavePortion(amount);

      _commander.send(PortionEditCommand.exit);
    } catch (error) {
      print(error);
      _commander.send(PortionEditCommand.showUnknownErrorNotification);
    }
  }

  bool _checkIfCommonMeasureExists() {
    final hasCommonMeasure = state.edible != null &&
        state.amountUnit != null &&
        state.edible!
            .getNutritionFacts()
            .any((nf) => nf.amount.unit.measure == state.amountUnit!.measure);
    if (!hasCommonMeasure) {
      _commander.send(PortionEditCommand.showNoCommonMeasureMessage);
      return false;
    }

    return true;
  }
}

final portionEditViewModel =
    NotifierProvider<PortionEditViewModel, PortionEditUiState>(
  () => PortionEditViewModel(),
);
