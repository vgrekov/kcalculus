import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';

part 'nutrient_amount_ui_state.freezed.dart';

@freezed
sealed class NutrientAmountUiState with _$NutrientAmountUiState {
  const NutrientAmountUiState._();

  const factory NutrientAmountUiState.$default({
    required Nutrient nutrient,
    required Unit unit,
    double? value,
  }) = _NutrientAmountUiState;

  factory NutrientAmountUiState({
    required Nutrient nutrient,
    Unit? unit,
    double? value,
  }) => NutrientAmountUiState.$default(
    nutrient: nutrient,
    unit: unit ?? nutrient.defaultUnit,
    value: value,
  );

  factory NutrientAmountUiState.fromModel(NutrientAmount model) =>
      NutrientAmountUiState(
        nutrient: model.nutrient,
        unit: model.amount.unit,
        value: model.amount.value,
      );

  NutrientAmount? toModel() {
    return value == null
        ? null
        : NutrientAmount(
            nutrient: nutrient,
            amount: Amount(
              unit: unit,
              value: value!,
            ),
          );
  }
}
