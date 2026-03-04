import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';

part 'dish_wizard_main_step_ui_state.freezed.dart';

enum MainStepValidationResult {
  nameMissing,
}

@freezed
sealed class DishWizardMainStepUiState with _$DishWizardMainStepUiState {
  const DishWizardMainStepUiState._();

  const factory DishWizardMainStepUiState({
    @Default('') String name,
    @Default('') String description,
  }) = _DishWizardMainStepUiState;

  factory DishWizardMainStepUiState.fromDish(Dish dish) {
    return DishWizardMainStepUiState(
      name: dish.name,
      description: dish.description,
    );
  }

  MainStepValidationResult? validate() {
    if (name.trim().isEmpty) {
      return MainStepValidationResult.nameMissing;
    }

    return null;
  }
}
