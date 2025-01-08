import 'package:flutter/material.dart';
import 'package:kcalculus/models/dish.dart';

enum MainStepStateValidationResult {
  nameMissing,
}

class DishWizardMainStepState with ChangeNotifier {
  String? name;
  String? description;

  DishWizardMainStepState({
    this.name,
    this.description,
  });

  factory DishWizardMainStepState.fromDish(Dish cleanCopy) {
    return DishWizardMainStepState(
      name: cleanCopy.name,
      description: cleanCopy.description,
    );
  }

  MainStepStateValidationResult? validate() {
    if (name == null || name!.trim().isEmpty) {
      return MainStepStateValidationResult.nameMissing;
    }

    return null;
  }
}
