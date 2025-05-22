import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_measurements_step_ui_state/nutrition_ratio_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';

mixin DishWizardMeasurementsStepViewModel {
  DishWizardUiState get state;

  set state(DishWizardUiState state);

  void onUserInteractionChange();

  void toggleMeasure(Measure measure) {
    state = state.copyWith.measurementsStepState(
      nutritionRatioStates:
          state.measurementsStepState.nutritionRatioStates.map((ratioState) {
        if (ratioState.measure == measure) {
          return ratioState.copyWith(enabled: !ratioState.enabled);
        }

        return ratioState;
      }).toList(),
    );

    onUserInteractionChange();
  }

  void updateMeasurementsStepData(List<NutritionRatioUiState> newRatioStates) {
    final newRatioStatesByMeasure = {
      for (final ratioState in newRatioStates) ratioState.measure: ratioState
    };

    state = state.copyWith.measurementsStepState(
      nutritionRatioStates:
          state.measurementsStepState.nutritionRatioStates.map((ratioState) {
        final newRatioState = newRatioStatesByMeasure[ratioState.measure];
        if (newRatioState != null) {
          return ratioState.copyWith(
            totalAmountUnit: newRatioState.totalAmountUnit,
            totalAmountValue: newRatioState.totalAmountValue,
            perAmountUnit: newRatioState.perAmountUnit,
            perAmountValue: newRatioState.perAmountValue,
          );
        }

        return ratioState;
      }).toList(),
    );
  }

  void selectFoodContainer(FoodContainer? container) {
    state = state.copyWith.measurementsStepState(container: container);

    onUserInteractionChange();
  }
}
