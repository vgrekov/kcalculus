import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'nutrition_facts_ui_state.freezed.dart';

@freezed
class NutritionFactsUiState with _$NutritionFactsUiState {
  const NutritionFactsUiState._();

  const factory NutritionFactsUiState({
    @Default(Unit.gram) Unit amountUnit,
    double? amountValue,
    double? calories,
    double? fatInGrams,
    double? carbsInGrams,
    double? fiberInGrams,
    double? proteinInGrams,
  }) = _NutritionFactsUiState;

  factory NutritionFactsUiState.fromModel(NutritionFacts model) =>
      NutritionFactsUiState(
        amountUnit: model.amount.unit,
        amountValue: model.amount.value,
        calories: model.nutrientData.calories,
        fatInGrams: model.nutrientData.fatInGrams,
        carbsInGrams: model.nutrientData.carbsInGrams,
        fiberInGrams: model.nutrientData.fiberInGrams,
        proteinInGrams: model.nutrientData.proteinInGrams,
      );

  NutritionFacts toModel() {
    return NutritionFacts(
      amount: Amount(
        unit: amountUnit,
        value: amountValue!,
      ),
      nutrientData: NutrientData(
        calories: calories!,
        fatInGrams: fatInGrams!,
        carbsInGrams: carbsInGrams!,
        fiberInGrams: fiberInGrams!,
        proteinInGrams: proteinInGrams!,
      ),
    );
  }
}
