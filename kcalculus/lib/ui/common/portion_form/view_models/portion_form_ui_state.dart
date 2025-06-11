import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/nutrition/portion.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'portion_form_ui_state.freezed.dart';

@freezed
sealed class PortionFormUiState with _$PortionFormUiState {
  const PortionFormUiState._();

  const factory PortionFormUiState({
    Edible? selectedEdible,
    @Default('') String name,
    @Default('') String description,
    @Default(Unit.gram) Unit? amountUnit,
    double? amountValue,
    List<NutritionFacts>? nutritionFacts,
  }) = _PortionFormUiState;

  factory PortionFormUiState.fromPortion(Portion portion) {
    return PortionFormUiState(
      selectedEdible: portion.edible,
      name: portion.edible.name,
      description: portion.edible.description,
      amountUnit: portion.amount.unit,
      amountValue: portion.amount.value,
      nutritionFacts: portion.edible.getNutritionFacts(),
    );
  }

  Amount? getAmount() {
    if (amountUnit != null && amountValue != null) {
      return Amount(
        unit: amountUnit!,
        value: amountValue!,
      );
    }

    return null;
  }
}
