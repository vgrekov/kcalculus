import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_ratio.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_measurements_step_ui_state/nutrition_ratio_ui_state.dart';

part 'dish_wizard_measurements_step_ui_state.freezed.dart';

@freezed
sealed class MeasurementsStepValidationResult
    with _$MeasurementsStepValidationResult {
  const factory MeasurementsStepValidationResult({
    required bool measurementsMissing,
    required Map<Measure, NutritionRatioValidationResult?>
    ratioStateValidationResults,
  }) = _MeasurementsStepValidationResult;
}

@freezed
sealed class DishWizardMeasurementsStepUiState
    with _$DishWizardMeasurementsStepUiState {
  const DishWizardMeasurementsStepUiState._();

  const factory DishWizardMeasurementsStepUiState.$default({
    FoodContainer? container,
    required List<NutritionRatioUiState> nutritionRatioStates,
  }) = _DishWizardMeasurementsStepUiState;

  factory DishWizardMeasurementsStepUiState({
    FoodContainer? container,
    List<NutritionRatioUiState>? nutritionRatioStates,
  }) => DishWizardMeasurementsStepUiState.$default(
    container: container,
    nutritionRatioStates:
        nutritionRatioStates ??
        Measure.pickableValues
            .map((m) => NutritionRatioUiState(measure: m))
            .toList(),
  );

  factory DishWizardMeasurementsStepUiState.fromDish(Dish model) {
    return DishWizardMeasurementsStepUiState(
      nutritionRatioStates: Measure.pickableValues.map((measure) {
        final ratio = model.nutritionRatios[measure];
        return ratio != null
            ? NutritionRatioUiState.fromModel(ratio)
            : NutritionRatioUiState(measure: measure);
      }).toList(),
    );
  }

  MeasurementsStepValidationResult? validate() {
    final enabledRatioStates = nutritionRatioStates.where(
      (ratioState) => ratioState.enabled,
    );

    final measurementsMissing = enabledRatioStates.isEmpty;

    final ratioStateValidationResults = enabledRatioStates.map((ratioState) {
      final perAmount = ratioState.perAmountValue == null
          ? null
          : Amount(
              unit: ratioState.perAmountUnit,
              value: ratioState.perAmountValue!,
            );

      final totalAmount = ratioState.totalAmountValue == null
          ? null
          : Amount(
              unit: ratioState.totalAmountUnit,
              value: ratioState.totalAmountValue!,
            );

      NutritionRatioValidationResult? validationResult;
      if (perAmount == null && totalAmount == null) {
        validationResult = NutritionRatioValidationResult.bothAmountsMissing;
      } else if (perAmount == null) {
        validationResult = NutritionRatioValidationResult.perAmountMissing;
      } else if (totalAmount == null) {
        validationResult = NutritionRatioValidationResult.totalAmountMissing;
      } else if (perAmount.unit.measure != ratioState.measure &&
          totalAmount.unit.measure != ratioState.measure) {
        validationResult =
            NutritionRatioValidationResult.bothAmountsHaveWrongMeasure;
      } else if (perAmount.unit.measure != ratioState.measure) {
        validationResult =
            NutritionRatioValidationResult.perAmountHasWrongMeasure;
      } else if (totalAmount.unit.measure != ratioState.measure) {
        validationResult =
            NutritionRatioValidationResult.totalAmountHasWrongMeasure;
      } else if (ratioState.measure == Measure.mass &&
          container != null &&
          container!.weight >= totalAmount) {
        validationResult =
            NutritionRatioValidationResult.totalNotHeavierThanContainer;
      }

      return (ratioState.measure, validationResult);
    });

    if (measurementsMissing ||
        ratioStateValidationResults.where((p) => p.$2 != null).isNotEmpty) {
      return MeasurementsStepValidationResult(
        measurementsMissing: measurementsMissing,
        ratioStateValidationResults: {
          for (final p in ratioStateValidationResults) p.$1: p.$2,
        },
      );
    }

    return null;
  }

  Map<Measure, NutritionRatio> toNutritionRatios() {
    return {
      for (final rs in nutritionRatioStates.where((rs) => rs.enabled))
        rs.measure: rs.toModel(container),
    };
  }
}
