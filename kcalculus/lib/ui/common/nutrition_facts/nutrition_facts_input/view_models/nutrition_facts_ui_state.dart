import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrient_amount_ui_state.dart';

part 'nutrition_facts_ui_state.freezed.dart';

@freezed
class NutritionFactsUiState with _$NutritionFactsUiState {
  const NutritionFactsUiState._();

  const factory NutritionFactsUiState._default({
    required Unit perAmountUnit,
    double? perAmountValue,
    required List<NutrientAmountUiState> nutrientAmounts,
  }) = _NutritionFactsUiState;

  factory NutritionFactsUiState({
    Unit? perAmountUnit,
    double? perAmountValue,
    List<NutrientAmountUiState>? nutrientAmounts,
  }) =>
      NutritionFactsUiState._default(
        perAmountUnit: perAmountUnit ?? Unit.gram,
        perAmountValue: perAmountValue,
        nutrientAmounts: nutrientAmounts ?? [],
      );

  factory NutritionFactsUiState.fromDefaults(List<Nutrient> defaults) =>
      NutritionFactsUiState(
        nutrientAmounts: defaults
            .map(
              (n) => NutrientAmountUiState(nutrient: n),
            )
            .toList(),
      );

  factory NutritionFactsUiState.fromModel(
    NutritionFacts model,
    List<Nutrient> defaults,
  ) {
    final processedNutrients = Set.from(defaults);

    return NutritionFactsUiState(
      perAmountUnit: model.amount.unit,
      perAmountValue: model.amount.value,
      nutrientAmounts: [
        // Defaults
        ...defaults.map(
          (n) {
            final amount = model.nutrientData.nutrientAmountsMap[n];

            return NutrientAmountUiState(
              nutrient: n,
              unit: amount?.unit ?? n.defaultUnit,
              value: amount?.value,
            );
          },
        ),
        // Non-defaults
        ...model.nutrientData.nutrientAmounts
            .where(
          (na) => !processedNutrients.contains(na.nutrient),
        )
            .map(
          (na) {
            processedNutrients.add(na.nutrient);

            return NutrientAmountUiState.fromModel(na);
          },
        ),
      ],
    );
  }

  NutritionFacts toModel() {
    return NutritionFacts(
      amount: Amount(
        unit: perAmountUnit,
        value: perAmountValue!,
      ),
      nutrientData: NutrientData(
        nutrientAmounts: nutrientAmounts
            .where((na) => na.value != null)
            .map(
              (na) => NutrientAmount(
                nutrient: na.nutrient,
                amount: Amount(
                  unit: na.unit,
                  value: na.value!,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
