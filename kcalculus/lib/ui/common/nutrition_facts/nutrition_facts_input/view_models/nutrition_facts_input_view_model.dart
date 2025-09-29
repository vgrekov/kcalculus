import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrient_amount_ui_state.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_ui_state.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_view_model_arg.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';

enum NutritionFactsInputCommand {
  showRequiredMissingErrorMessage,
  showInconsistenceAcrossRecordsErrorMessage,
  showPartExceedsWholeErrorMessage,
}

class NutritionFactsInputViewModel extends AutoDisposeFamilyNotifier<
    NutritionFactsInputUiState, NutritionFactsInputViewModelArg> {
  UiCommander<NutritionFactsInputCommand>? _commander;

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  @override
  NutritionFactsInputUiState build(
    NutritionFactsInputViewModelArg arg,
  ) {
    _commander = UiCommander<NutritionFactsInputCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return _loadState(
      arg.nutritionFacts,
      arg.defaultNutrients,
    );
  }

  NutritionFactsInputUiState _loadState(
    List<NutritionFacts>? nutritionFacts,
    List<Nutrient> defaultNutrients,
  ) {
    if (nutritionFacts != null) {
      return NutritionFactsInputUiState.fromModels(
        nutritionFacts,
        defaultNutrients,
      );
    } else {
      return NutritionFactsInputUiState.fromDefaults(
        defaultNutrients,
      );
    }
  }

  NutritionFactsInputUiState load(
    List<NutritionFacts>? nutritionFacts,
    List<Nutrient> defaultNutrients,
  ) {
    state = _loadState(
      nutritionFacts,
      defaultNutrients,
    );

    return state;
  }

  void saveRecordState(
    NutritionFactsUiState Function(NutritionFactsUiState) update,
  ) {
    state = state.copyWith(
      recordStates: [
        ...state.recordStates.sublist(0, state.selectedRecordIndex),
        update(state.selectedRecordState),
        ...state.recordStates.sublist(state.selectedRecordIndex + 1),
      ],
    );
  }

  bool addRecord() {
    if (!_validateSelectedRecord()) return false;

    final usedMeasures = state.recordStates
        .map(
          (rs) => rs.perAmountUnit.measure,
        )
        .toSet();

    final nextMeasure = Measure.pickableValues.firstWhere(
      (m) => !usedMeasures.contains(m),
      orElse: () => Measure.mass,
    );

    final selectedRecordState = state.selectedRecordState;

    state = state.copyWith(
      recordStates: [
        ...state.recordStates,
        selectedRecordState.copyWith(
          perAmountUnit: Unit.defaultFor(nextMeasure),
          perAmountValue: null,
        ),
      ],
      selectedRecordIndex: state.recordStates.length,
    );

    return true;
  }

  bool deleteRecord() {
    if (state.recordStates.length > 1) {
      state = state.copyWith(
        recordStates: [
          ...state.recordStates.sublist(0, state.selectedRecordIndex),
          ...state.recordStates.sublist(state.selectedRecordIndex + 1),
        ],
        selectedRecordIndex:
            state.selectedRecordIndex < state.recordStates.length - 1
                ? state.selectedRecordIndex
                : state.selectedRecordIndex - 1,
      );

      return true;
    }

    return false;
  }

  bool selectPrevRecord() {
    if (!_validateSelectedRecord()) return false;

    if (state.selectedRecordIndex > 0) {
      state = state.copyWith(
        selectedRecordIndex: state.selectedRecordIndex - 1,
      );
    }

    return true;
  }

  bool selectNextRecord() {
    if (!_validateSelectedRecord()) return false;

    if (state.selectedRecordIndex < state.recordStates.length - 1) {
      state = state.copyWith(
        selectedRecordIndex: state.selectedRecordIndex + 1,
      );
    }

    return true;
  }

  bool addNutrient(Nutrient nutrient) {
    if (!state.nutrients.contains(nutrient)) {
      state = state.copyWith(
        nutrients: [
          ...state.nutrients,
          nutrient,
        ],
        recordStates: state.recordStates
            .map(
              (rs) => rs.copyWith(
                nutrientAmounts: [
                  ...rs.nutrientAmounts,
                  NutrientAmountUiState(nutrient: nutrient),
                ],
              ),
            )
            .toList(),
      );

      return true;
    }

    return false;
  }

  bool deleteNutrient(Nutrient nutrient) {
    if (state.nutrients.contains(nutrient)) {
      state = state.copyWith(
        nutrients: state.nutrients.where((n) => n != nutrient).toList(),
        recordStates: state.recordStates
            .map(
              (rs) => rs.copyWith(
                nutrientAmounts: rs.nutrientAmounts
                    .where((na) => na.nutrient != nutrient)
                    .toList(),
              ),
            )
            .toList(),
      );

      return true;
    }

    return false;
  }

  bool validate() {
    return _validateSelectedRecord() && !_hasInconsistentNutrients();
  }

  bool _validateSelectedRecord() {
    return !_hasMissingRequiredNutrients() && !_hasPartsExceedingWhole();
  }

  bool _hasMissingRequiredNutrients() {
    final missingRequiredNutrients = state.selectedRecordState.nutrientAmounts
        .where(
          (na) => na.nutrient.required && na.value == null,
        )
        .map(
          (na) => na.nutrient,
        )
        .toList();

    if (missingRequiredNutrients.isNotEmpty) {
      _commander?.send<List<Nutrient>, void>(
        NutritionFactsInputCommand.showRequiredMissingErrorMessage,
        payload: missingRequiredNutrients,
      );

      return true;
    }

    return false;
  }

  bool _hasPartsExceedingWhole() {
    final amountOf = {
      for (final na in state.selectedRecordState.nutrientAmounts)
        na.nutrient: na.value == null
            ? null
            : Amount(
                unit: na.unit,
                value: na.value!,
              ),
    };

    final partsExceedingWhole = <(NutrientAmount, NutrientAmount)>[];
    for (final part in state.nutrients) {
      final partAmount = amountOf[part];

      final whole = part.partOf;
      final wholeAmount = amountOf[whole];

      if (partAmount != null &&
          wholeAmount != null &&
          partAmount > wholeAmount) {
        partsExceedingWhole.add((
          NutrientAmount(nutrient: part, amount: partAmount),
          NutrientAmount(nutrient: whole!, amount: wholeAmount),
        ));
      }
    }

    if (partsExceedingWhole.isNotEmpty) {
      _commander?.send<List<(NutrientAmount, NutrientAmount)>, void>(
        NutritionFactsInputCommand.showPartExceedsWholeErrorMessage,
        payload: partsExceedingWhole,
      );

      return true;
    }

    return false;
  }

  bool _hasInconsistentNutrients() {
    final inconsistentNutrients = state.nutrients.indexed
        .where(
          (pair) {
            final recordsWithNutrientFilled = state.recordStates
                .map(
                  (rs) => rs.nutrientAmounts[pair.$1].value == null ? 0 : 1,
                )
                .reduce(
                  (s1, s2) => s1 + s2,
                );

            // Either all or none of the records should have the nutrient amount
            return recordsWithNutrientFilled != 0 &&
                recordsWithNutrientFilled != state.recordStates.length;
          },
        )
        .map((pair) => pair.$2)
        .toList();

    if (inconsistentNutrients.isNotEmpty) {
      _commander?.send<List<Nutrient>, void>(
        NutritionFactsInputCommand.showInconsistenceAcrossRecordsErrorMessage,
        payload: inconsistentNutrients,
      );

      return true;
    }

    return false;
  }
}

final nutritionFactsInputViewModel = NotifierProvider.family.autoDispose<
    NutritionFactsInputViewModel,
    NutritionFactsInputUiState,
    NutritionFactsInputViewModelArg>(
  NutritionFactsInputViewModel.new,
);
