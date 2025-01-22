import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';

enum MainStepStateValidationResult {
  nameMissing,
}

class DishWizardMainStepState with ChangeNotifier {
  String? _name;
  String? _description;

  bool _hasChanges;

  DishWizardMainStepState({
    String? name,
    String? description,
  })  : _name = name,
        _description = description,
        _hasChanges = false;

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

  String? get name => _name;

  set name(String? value) {
    if ((_name ?? '') != (value ?? '')) {
      _hasChanges = true;
    }

    _name = value;
  }

  String? get description => _description;

  set description(String? value) {
    if ((_description ?? '') != (value ?? '')) {
      _hasChanges = true;
    }

    _description = value;
  }

  bool get hasChanges => _hasChanges;
}
