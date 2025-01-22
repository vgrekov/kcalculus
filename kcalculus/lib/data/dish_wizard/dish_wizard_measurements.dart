import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_ratio.dart';
import 'package:kcalculus/domain/models/units.dart';

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
  Unit? _perAmountUnit;
  double? _perAmountValue;
  Unit? _totalAmountUnit;
  double? _totalAmountValue;
  bool _enabled;

  bool _hasChanges;

  NutritionRatioState({
    required this.measure,
    Unit? perAmountUnit,
    double? perAmountValue,
    Unit? totalAmountUnit,
    double? totalAmountValue,
    bool enabled = false,
  })  : _perAmountUnit = perAmountUnit ?? Unit.defaultFor(measure),
        _perAmountValue = perAmountValue,
        _totalAmountUnit = totalAmountUnit ?? Unit.defaultFor(measure),
        _totalAmountValue = totalAmountValue,
        _enabled = enabled,
        _hasChanges = false;

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
        unit: _perAmountUnit!,
        value: _perAmountValue!,
      ),
      totalAmount: Amount(
        unit: _totalAmountUnit!,
        value: _totalAmountValue!,
      ),
    );
  }

  Unit? get perAmountUnit => _perAmountUnit;

  set perAmountUnit(Unit? value) {
    if (_perAmountUnit != value) {
      _hasChanges = true;
    }

    _perAmountUnit = value;
  }

  double? get perAmountValue => _perAmountValue;

  set perAmountValue(double? value) {
    if (_perAmountValue != value) {
      _hasChanges = true;
    }

    _perAmountValue = value;
  }

  Unit? get totalAmountUnit => _totalAmountUnit;

  set totalAmountUnit(Unit? value) {
    if (_totalAmountUnit != value) {
      _hasChanges = true;
    }

    _totalAmountUnit = value;
  }

  double? get totalAmountValue => _totalAmountValue;

  set totalAmountValue(double? value) {
    if (_totalAmountValue != value) {
      _hasChanges = true;
    }

    _totalAmountValue = value;
  }

  bool get enabled => _enabled;

  set enabled(bool value) {
    if (_enabled != value) {
      _hasChanges = true;
    }

    _enabled = value;
  }

  bool get hasChanges => _hasChanges;
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

  bool get hasChanges => nutritionRatioStates.any((rs) => rs.hasChanges);
}
