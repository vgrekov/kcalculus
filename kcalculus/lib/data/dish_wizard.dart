import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/utils/state_wrap.dart';

enum DishWizardStep {
  main,
  ingredients,
  weight,
  summary,
}

enum DishWeightType {
  calculated,
  entered,
}

class DishWizardState {
  String? id;
  String? name;
  String? description;
  List<Ingredient> ingredients;
  DishWeightType? weightType;
  double? weightInGrams;

  DishWizardState({
    this.id,
    this.name,
    this.description,
    List<Ingredient>? ingredients,
    this.weightType,
    this.weightInGrams,
  }) : ingredients = ingredients ?? [];

  factory DishWizardState.fromDish(Dish cleanCopy) {
    return DishWizardState(
      id: cleanCopy.id,
      name: cleanCopy.name,
      description: cleanCopy.description,
      ingredients: cleanCopy.ingredients,
      weightType: DishWeightType.entered,
      weightInGrams: cleanCopy.weightInGrams,
    );
  }

  Dish toDish() {
    return Dish(
      id: id,
      name: name!,
      description: description!,
      ingredients: ingredients,
      weightInGrams: switch (weightType!) {
        DishWeightType.calculated => calculateWeightInGrams(),
        DishWeightType.entered => weightInGrams,
      }!,
    );
  }

  double calculateWeightInGrams() {
    return ingredients.map((i) => i.getWeightInGrams() ?? 0).fold(
          0,
          (w1, w2) => w1 + w2,
        );
  }

  Map<DishWizardStep, bool> validate() {
    return {
      DishWizardStep.main:
          name != null && name!.isNotEmpty && description != null,
      DishWizardStep.ingredients: ingredients.isNotEmpty,
      DishWizardStep.weight: weightType != null &&
          ((weightType == DishWeightType.calculated &&
                  calculateWeightInGrams() > 0) ||
              (weightType == DishWeightType.entered &&
                  weightInGrams != null &&
                  weightInGrams! > 0)),
    };
  }
}

class DishWizardNotifier extends Notifier<StateWrap<DishWizardState>> {
  @override
  StateWrap<DishWizardState> build() {
    return StateWrap(DishWizardState());
  }

  void load(Dish dish) {
    state = StateWrap(DishWizardState.fromDish(dish));
  }

  void setName(String name) {
    state.data.name = name;
    _triggerStateChange();
  }

  void setDescription(String description) {
    state.data.description = description;
    _triggerStateChange();
  }

  void addIngredient(Ingredient ingredient) {
    state.data.ingredients.add(ingredient);
    state.data.weightType = null;
    _triggerStateChange();
  }

  void replaceIngredientAt(int index, Ingredient ingredient) {
    state.data.ingredients[index] = ingredient;
    state.data.weightType = null;
    _triggerStateChange();
  }

  bool deleteIngredientAt(int index) {
    state.data.ingredients.removeAt(index);
    state.data.weightType = null;
    _triggerStateChange();
    return true;
  }

  void setWeightType(DishWeightType? weightType) {
    state.data.weightType = weightType;
    _triggerStateChange();
  }

  void setWeightInGrams(double? weightInGrams) {
    state.data.weightInGrams = weightInGrams;
    _triggerStateChange();
  }

  void reset() {
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
