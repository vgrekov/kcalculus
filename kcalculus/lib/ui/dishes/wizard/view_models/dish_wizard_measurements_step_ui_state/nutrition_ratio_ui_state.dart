import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_ratio.dart';

part 'nutrition_ratio_ui_state.freezed.dart';

enum NutritionRatioValidationResult {
  bothAmountsMissing,
  perAmountMissing,
  totalAmountMissing,
  totalNotHeavierThanContainer,
  bothAmountsHaveWrongMeasure,
  perAmountHasWrongMeasure,
  totalAmountHasWrongMeasure,
}

@freezed
sealed class NutritionRatioUiState with _$NutritionRatioUiState {
  const NutritionRatioUiState._();

  const factory NutritionRatioUiState.$default({
    required Measure measure,
    required Unit perAmountUnit,
    double? perAmountValue,
    required Unit totalAmountUnit,
    double? totalAmountValue,
    required bool enabled,
  }) = _NutritionRatioUiState;

  factory NutritionRatioUiState({
    required Measure measure,
    Unit? perAmountUnit,
    double? perAmountValue,
    Unit? totalAmountUnit,
    double? totalAmountValue,
    bool enabled = false,
  }) => NutritionRatioUiState.$default(
    measure: measure,
    perAmountUnit: perAmountUnit ?? Unit.defaultFor(measure),
    perAmountValue: perAmountValue,
    totalAmountUnit: totalAmountUnit ?? Unit.defaultFor(measure),
    totalAmountValue: totalAmountValue,
    enabled: enabled,
  );

  factory NutritionRatioUiState.fromModel(NutritionRatio cleanCopy) {
    return NutritionRatioUiState(
      measure: cleanCopy.perAmount.unit.measure,
      perAmountUnit: cleanCopy.perAmount.unit,
      perAmountValue: cleanCopy.perAmount.value,
      totalAmountUnit: cleanCopy.totalAmount.unit,
      totalAmountValue: cleanCopy.totalAmount.value,
      enabled: true,
    );
  }

  NutritionRatio toModel([FoodContainer? container]) {
    var totalAmount = Amount(
      unit: totalAmountUnit,
      value: totalAmountValue!,
    );

    if (totalAmountUnit.measure == Measure.mass && container != null) {
      totalAmount -= container.weight;
    }

    return NutritionRatio(
      perAmount: Amount(
        unit: perAmountUnit,
        value: perAmountValue!,
      ),
      totalAmount: totalAmount,
    );
  }
}
