import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';

mixin DishWizardMainStepViewModel {
  DishWizardUiState get state;

  set state(DishWizardUiState state);

  void updateMainStepState({
    required String name,
    required String description,
  }) {
    state = state.copyWith.mainStepState(
      name: name,
      description: description,
    );
  }
}
