import 'package:flutter/material.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/models/units.dart';

enum NutritionRatioStateValidationResult {
  bothAmountsMissing,
  perAmountMissing,
  totalAmountMissing,
  bothAmountsHaveWrongMeasure,
  perAmountHasWrongMeasure,
  totalAmountHasWrongMeasure,
}

class NutritionRatioState {
  Measure measure;
  Unit? perAmountUnit;
  double? perAmountValue;
  Unit? totalAmountUnit;
  double? totalAmountValue;
  bool enabled;

  NutritionRatioState({
    required this.measure,
    Unit? perAmountUnit,
    this.perAmountValue,
    Unit? totalAmountUnit,
    this.totalAmountValue,
    this.enabled = false,
  })  : perAmountUnit = perAmountUnit ?? Unit.defaultFor(measure),
        totalAmountUnit = totalAmountUnit ?? Unit.defaultFor(measure);

  factory NutritionRatioState.fromCleanCopy(NutritionRatio cleanCopy) {
    return NutritionRatioState(
      measure: cleanCopy.perAmount.unit.measure,
      perAmountUnit: cleanCopy.perAmount.unit,
      perAmountValue: cleanCopy.perAmount.value,
      totalAmountUnit: cleanCopy.totalAmount.unit,
      totalAmountValue: cleanCopy.totalAmount.value,
      enabled: true,
    );
  }

  NutritionRatio toCleanCopy() {
    return NutritionRatio(
      perAmount: Amount(
        unit: perAmountUnit!,
        value: perAmountValue!,
      ),
      totalAmount: Amount(
        unit: totalAmountUnit!,
        value: totalAmountValue!,
      ),
    );
  }
}

class MeasurementsStepStateValidationResult {
  final bool measurementsMissing;
  final Map<Measure, NutritionRatioStateValidationResult?>
      ratioStateValidationResults;

  MeasurementsStepStateValidationResult({
    required this.measurementsMissing,
    required this.ratioStateValidationResults,
  });
}

class DishWizardMeasurementsStepState with ChangeNotifier {
  List<NutritionRatioState> nutritionRatioStates;
  late Map<Measure, NutritionRatioState> _nutritionRatioStatesByMeasure;

  DishWizardMeasurementsStepState({
    List<NutritionRatioState>? nutritionRatioStates,
  }) : nutritionRatioStates = nutritionRatioStates ??
            Measure.pickableValues
                .map((m) => NutritionRatioState(measure: m))
                .toList() {
    _nutritionRatioStatesByMeasure = {
      for (final ratioState in this.nutritionRatioStates)
        ratioState.measure: ratioState
    };
  }

  factory DishWizardMeasurementsStepState.fromDish(Dish cleanCopy) {
    return DishWizardMeasurementsStepState(
      nutritionRatioStates: Measure.pickableValues.map((measure) {
        final ratio = cleanCopy.nutritionRatios[measure];
        return ratio != null
            ? NutritionRatioState.fromCleanCopy(ratio)
            : NutritionRatioState(measure: measure);
      }).toList(),
    );
  }

  void toggleMeasure(Measure measure) {
    NutritionRatioState? ratioState = _nutritionRatioStatesByMeasure[measure];
    if (ratioState != null) {
      ratioState.enabled = !ratioState.enabled;
      notifyListeners();
    }
  }

  MeasurementsStepStateValidationResult? validate() {
    final enabledRatioStates =
        nutritionRatioStates.where((ratioState) => ratioState.enabled);

    final measurementsMissing = enabledRatioStates.isEmpty;

    final ratioStateValidationResults = enabledRatioStates.map((ratioState) {
      final perAmount = (ratioState.perAmountValue == null ||
              ratioState.perAmountUnit == null)
          ? null
          : Amount(
              unit: ratioState.perAmountUnit!,
              value: ratioState.perAmountValue!,
            );

      final totalAmount = (ratioState.totalAmountValue == null ||
              ratioState.totalAmountUnit == null)
          ? null
          : Amount(
              unit: ratioState.totalAmountUnit!,
              value: ratioState.totalAmountValue!,
            );

      NutritionRatioStateValidationResult? validationResult;
      if (perAmount == null && totalAmount == null) {
        validationResult =
            NutritionRatioStateValidationResult.bothAmountsMissing;
      } else if (perAmount == null) {
        validationResult = NutritionRatioStateValidationResult.perAmountMissing;
      } else if (totalAmount == null) {
        validationResult =
            NutritionRatioStateValidationResult.totalAmountMissing;
      } else if (perAmount.unit.measure != ratioState.measure &&
          totalAmount.unit.measure != ratioState.measure) {
        validationResult =
            NutritionRatioStateValidationResult.bothAmountsHaveWrongMeasure;
      } else if (perAmount.unit.measure != ratioState.measure) {
        validationResult =
            NutritionRatioStateValidationResult.perAmountHasWrongMeasure;
      } else if (totalAmount.unit.measure != ratioState.measure) {
        validationResult =
            NutritionRatioStateValidationResult.totalAmountHasWrongMeasure;
      }

      return (ratioState.measure, validationResult);
    });

    if (measurementsMissing ||
        ratioStateValidationResults.where((p) => p.$2 != null).isNotEmpty) {
      return MeasurementsStepStateValidationResult(
        measurementsMissing: measurementsMissing,
        ratioStateValidationResults: {
          for (final p in ratioStateValidationResults) p.$1: p.$2
        },
      );
    }

    return null;
  }
}
