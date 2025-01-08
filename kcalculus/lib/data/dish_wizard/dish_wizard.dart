import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard_ingredients.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard_main.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard_measurements.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/utils/state_wrap.dart';

enum DishWizardStep {
  main,
  ingredients,
  measurements,
  summary,
}

class DishWizardState with ChangeNotifier {
  String? id;
  DishWizardMainStepState mainStepState;
  DishWizardIngredientsStepState ingredientsStepState;
  DishWizardMeasurementsStepState measurementsStepState;

  DishWizardState({
    this.id,
    DishWizardMainStepState? mainStepState,
    DishWizardIngredientsStepState? ingredientsStepState,
    DishWizardMeasurementsStepState? measurementsStepState,
  })  : mainStepState = mainStepState ?? DishWizardMainStepState(),
        ingredientsStepState =
            ingredientsStepState ?? DishWizardIngredientsStepState(),
        measurementsStepState =
            measurementsStepState ?? DishWizardMeasurementsStepState() {
    this.mainStepState.addListener(notifyListeners);
    this.ingredientsStepState.addListener(notifyListeners);
    this.measurementsStepState.addListener(notifyListeners);
  }

  factory DishWizardState.fromDish(Dish cleanCopy) {
    return DishWizardState(
      id: cleanCopy.id,
      mainStepState: DishWizardMainStepState.fromDish(cleanCopy),
      ingredientsStepState: DishWizardIngredientsStepState.fromDish(cleanCopy),
      measurementsStepState:
          DishWizardMeasurementsStepState.fromDish(cleanCopy),
    );
  }

  Dish toDish() {
    return Dish(
      id: id,
      name: mainStepState.name!,
      description: mainStepState.description!,
      ingredients: ingredientsStepState.ingredients,
      nutritionRatios: {
        for (final rs in measurementsStepState.nutritionRatioStates
            .where((rs) => rs.enabled))
          rs.measure: rs.toCleanCopy()
      },
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
        totalAmount += ingredientNF.convertAmount(ingredient.amount,
            targetNutritionFacts: targetNF);
      }
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

  bool get hasChanges =>
      mainStepState.hasChanges ||
      ingredientsStepState.hasChanges ||
      measurementsStepState.hasChanges;

  @override
  void dispose() {
    mainStepState.removeListener(notifyListeners);
    ingredientsStepState.removeListener(notifyListeners);
    measurementsStepState.removeListener(notifyListeners);

    super.dispose();
  }
}

class DishWizardNotifier extends Notifier<StateWrap<DishWizardState>> {
  @override
  StateWrap<DishWizardState> build() {
    final data = DishWizardState();
    data.addListener(_triggerStateChange);

    return StateWrap(data);
  }

  void load(Dish dish) {
    state.data.removeListener(_triggerStateChange);

    final data = DishWizardState.fromDish(dish);
    data.addListener(_triggerStateChange);

    state = StateWrap(data);
  }

  void reset() {
    state.data.removeListener(_triggerStateChange);

    state = build();
  }

  void _triggerStateChange() {
    state = StateWrap(state.data);
  }
}

final dishWizardProvider =
    NotifierProvider<DishWizardNotifier, StateWrap<DishWizardState>>(
  DishWizardNotifier.new,
);
