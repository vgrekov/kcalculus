import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/nutrition/portion.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/portion_form/view_models/edible_already_exists_exception.dart';
import 'package:kcalculus/ui/common/portion_form/view_models/modified_edible_option.dart';
import 'package:kcalculus/ui/common/portion_form/view_models/no_common_measure_exception.dart';
import 'package:kcalculus/ui/common/portion_form/view_models/portion_form_ui_state.dart';
import 'package:kcalculus/ui/common/portion_form/view_models/selected_edible_modified_already_exists_exception.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:logging/logging.dart';

final _log = Logger('PortionFormViewModel');

final _kMeasuresInOrder = [
  Measure.quantity,
  Measure.mass,
  Measure.volume,
];

enum PortionFormCommand {
  showUnknownErrorNotification,
  showNoCommonMeasureMessage,
  showEdibleAlreadyExistsDialog,
  showSelectedEdibleModifiedAlreadyExistsDialog,
  showSelectedEdibleModifiedCreatesNewDialog,
}

class PortionFormViewModel
    extends AutoDisposeFamilyNotifier<PortionFormUiState, Portion?> {
  UiCommander<PortionFormCommand>? _commander;

  @override
  PortionFormUiState build(Portion? arg) {
    _commander = UiCommander<PortionFormCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return arg != null
        ? PortionFormUiState.fromPortion(arg)
        : PortionFormUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void selectEdible(
    Edible edible, [
    Unit? amountUnit,
    double? amountValue,
  ]) {
    final nutritionFacts = edible.getNutritionFacts();

    if (amountValue == null) {
      amountUnit = ([
        ...nutritionFacts.map((nf) => nf.amount.unit),
      ]..sort(
              (u1, u2) {
                int index1 = _kMeasuresInOrder.indexOf(u1.measure);
                int index2 = _kMeasuresInOrder.indexOf(u2.measure);

                if (index1 != -1 && index2 == -1) {
                  return -1;
                } else if (index1 == -1 && index2 != -1) {
                  return 1;
                } else {
                  return index1 - index2;
                }
              },
            ))
          .firstOrNull;
    }

    state = state.copyWith(
      // If selected edible has no ID (i.e. USDA Food)
      // then it's more of a 'template'
      selectedEdible: edible.id == null ? null : edible,
      name: edible.name,
      description: edible.description,
      amountUnit: amountUnit,
      amountValue: amountValue,
      nutritionFacts: nutritionFacts,
    );
  }

  void updateState(
    PortionFormUiState Function(PortionFormUiState state) update,
  ) {
    state = update(state);
  }

  Future<Portion?> buildPortion() async {
    _log.finer('buildPortion() START');

    Portion? result;

    try {
      _log.finer('buildPortion() Getting edible');

      final edible = await _getEdible();
      if (edible == null) {
        _log.finer('buildPortion() No edible');
      } else {
        _log.finest('buildPortion() Using edible: ${edible.toJson()}');

        result = _PortionImpl(
          edible: edible,
          amount: state.getAmount()!,
        );
      }
    } on NoCommonMeasureException {
      _commander!.send(PortionFormCommand.showNoCommonMeasureMessage);
    } on EdibleAlreadyExistsException {
      _commander!.send(PortionFormCommand.showEdibleAlreadyExistsDialog);
    } on SelectedEdibleModifiedAlreadyExistsException {
      _commander!.send(
          PortionFormCommand.showSelectedEdibleModifiedAlreadyExistsDialog);
    } catch (error, stackTrace) {
      _log.severe('Failed to build a portion', error, stackTrace);

      _commander!.send(PortionFormCommand.showUnknownErrorNotification);
    }

    _log.finer('buildPortion() END');

    return result;
  }

  FutureOr<Edible?> _getEdible() async {
    _checkIfCommonMeasureExists();

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

      throw EdibleAlreadyExistsException();
    }

    if (selectedEdibleModified == true && alreadyExists) {
      _log.finer(
        '_getEdible() Selected modified, but such edible already exists',
      );

      throw SelectedEdibleModifiedAlreadyExistsException();
    }

    if (selectedEdibleModified == true && !alreadyExists) {
      _log.finer('_getEdible() Selected modified, asking for instructions');

      final edibleOption = await _commander!.send<void, ModifiedEdibleOption?>(
        PortionFormCommand.showSelectedEdibleModifiedCreatesNewDialog,
      );

      if (edibleOption != null) {
        switch (edibleOption) {
          case ModifiedEdibleOption.useSelected:
            selectEdible(
              state.selectedEdible!,
              state.amountUnit,
              state.amountValue,
            );

            _checkIfCommonMeasureExists();

            _log.finer('_getEdible() Using selected (as instructed)');

            return state.selectedEdible;
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

  void _checkIfCommonMeasureExists() {
    final hasCommonMeasure = state.amountUnit != null &&
        state.nutritionFacts != null &&
        state.nutritionFacts!
            .any((nf) => nf.amount.unit.measure == state.amountUnit!.measure);
    if (!hasCommonMeasure) {
      throw NoCommonMeasureException();
    }
  }

  bool? _isSelectedEdibleModified() {
    if (state.selectedEdible != null) {
      if (state.selectedEdible!.name != state.name ||
          state.selectedEdible!.description != state.description) {
        return true;
      }

      final nutritionFactsEntered = state.nutritionFacts!;
      final nutritionFactsSelected = state.selectedEdible!.getNutritionFacts();

      return !NutritionFacts.areSame(
        nutritionFactsEntered,
        nutritionFactsSelected,
      );
    }

    return null;
  }

  Edible _buildFood() {
    return Food(
      name: state.name,
      description: state.description,
      nutritionFacts: state.nutritionFacts!,
    );
  }
}

class _PortionImpl with Portion {
  const _PortionImpl({
    required this.edible,
    required this.amount,
  });

  @override
  final Edible edible;

  @override
  final Amount amount;
}

final portionFormViewModel = NotifierProvider.family
    .autoDispose<PortionFormViewModel, PortionFormUiState, Portion?>(
  PortionFormViewModel.new,
);
