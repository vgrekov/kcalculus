import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_ui_state.dart';

part 'nutrition_facts_input_ui_state.freezed.dart';

@freezed
sealed class NutritionFactsInputUiState with _$NutritionFactsInputUiState {
  const NutritionFactsInputUiState._();

  const factory NutritionFactsInputUiState({
    required List<Nutrient> nutrients,
    required List<NutritionFactsUiState> recordStates,
    required int selectedRecordIndex,
  }) = _NutritionFactsInputUiState;

  factory NutritionFactsInputUiState.fromDefaults(List<Nutrient> defaults) =>
      NutritionFactsInputUiState(
        nutrients: defaults,
        recordStates: [
          NutritionFactsUiState.fromDefaults(defaults),
        ],
        selectedRecordIndex: 0,
      );

  factory NutritionFactsInputUiState.fromModels(
    List<NutritionFacts> models,
    List<Nutrient> defaults,
  ) {
    if (models.isEmpty) {
      return NutritionFactsInputUiState.fromDefaults(defaults);
    }

    final nutrients = [...defaults];

    final processedNutrients = Set.from(defaults);

    for (final model in models) {
      for (final na in model.nutrientData.nutrientAmounts) {
        if (!processedNutrients.contains(na.nutrient)) {
          nutrients.add(na.nutrient);
          processedNutrients.add(na.nutrient);
        }
      }
    }

    return NutritionFactsInputUiState(
      nutrients: nutrients,
      recordStates: models
          .map(
            (model) => NutritionFactsUiState.fromModel(model, nutrients),
          )
          .toList(),
      selectedRecordIndex: 0,
    );
  }

  List<NutritionFacts> toModels() {
    return recordStates
        .map(
          (rs) => NutritionFacts(
            amount: Amount(unit: rs.perAmountUnit, value: rs.perAmountValue!),
            nutrientData: NutrientData(
                nutrientAmounts: rs.nutrientAmounts
                    .where((na) => na.value != null)
                    .map(
                      (na) => NutrientAmount(
                        nutrient: na.nutrient,
                        amount: Amount(unit: na.unit, value: na.value!),
                      ),
                    )
                    .toList()),
          ),
        )
        .toList();
  }

  NutritionFactsUiState get selectedRecordState =>
      recordStates[selectedRecordIndex];
}
