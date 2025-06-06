import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ingredients_step_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_main_step_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_measurements_step_ui_state/dish_wizard_measurements_step_ui_state.dart';

part 'dish_wizard_ui_state.freezed.dart';

enum DishWizardStep {
  main,
  ingredients,
  measurements,
  summary,
}

@freezed
class DishWizardUiState with _$DishWizardUiState {
  const DishWizardUiState._();

  const factory DishWizardUiState._default({
    String? id,
    required DishWizardMainStepUiState mainStepState,
    required DishWizardIngredientsStepUiState ingredientsStepState,
    required DishWizardMeasurementsStepUiState measurementsStepState,
  }) = _DishWizardState;

  factory DishWizardUiState() => DishWizardUiState._default(
        mainStepState: DishWizardMainStepUiState(),
        ingredientsStepState: DishWizardIngredientsStepUiState(),
        measurementsStepState: DishWizardMeasurementsStepUiState(),
      );

  factory DishWizardUiState.fromDish(Dish model) => DishWizardUiState._default(
        id: model.id,
        mainStepState: DishWizardMainStepUiState.fromDish(model),
        ingredientsStepState: DishWizardIngredientsStepUiState.fromDish(model),
        measurementsStepState:
            DishWizardMeasurementsStepUiState.fromDish(model),
      );

  Dish toDish() {
    return Dish(
      id: id,
      name: mainStepState.name,
      description: mainStepState.description,
      ingredients: ingredientsStepState.ingredients,
      nutritionRatios: measurementsStepState.toNutritionRatios(),
    );
  }

  Amount? estimateTotalAmount(Measure measure) {
    var totalAmount = Amount(unit: Unit.defaultFor(measure), value: 0);

    for (final ingredient in ingredientsStepState.ingredients) {
      final ingredientNF = ingredient.edible
          .getNutritionFacts()
          .where(
              (nf) => nf.amount.unit.measure == ingredient.amount.unit.measure)
          .firstOrNull;

      final targetNF = ingredient.edible
          .getNutritionFacts()
          .where((nf) => nf.amount.unit.measure == measure)
          .firstOrNull;

      if (ingredientNF != null && targetNF != null) {
        final convertedAmount = ingredientNF.convertAmount(ingredient.amount,
            targetNutritionFacts: targetNF);
        if (convertedAmount != null) {
          if (measure != Measure.quantity) {
            // Sum up if not quantity
            totalAmount += convertedAmount;
          } else if (totalAmount.isEmpty() || totalAmount > convertedAmount) {
            // Take min if quantity
            totalAmount = convertedAmount;
          }
        }
      }
    }

    if (measure == Measure.mass && measurementsStepState.container != null) {
      totalAmount += measurementsStepState.container!.weight;
    }

    return totalAmount.value > 0 ? totalAmount : null;
  }

  Map<DishWizardStep, bool> validate() {
    return {
      DishWizardStep.main: mainStepState.validate() == null,
      DishWizardStep.ingredients: ingredientsStepState.validate() == null,
      DishWizardStep.measurements: measurementsStepState.validate() == null,
    };
  }
}
