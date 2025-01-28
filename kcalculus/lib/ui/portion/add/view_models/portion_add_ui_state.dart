import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'portion_add_ui_state.freezed.dart';

@freezed
class PortionAddUiState with _$PortionAddUiState {
  const PortionAddUiState._();

  const factory PortionAddUiState({
    Edible? selectedEdible,
    @Default('') String name,
    @Default('') String description,
    Unit? amountUnit,
    double? amountValue,
    List<NutritionFacts>? nutritionFacts,
  }) = _PortionAddUiState;

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
