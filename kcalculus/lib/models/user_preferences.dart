import 'package:kcalculus/models/nutrition.dart';

class UserPreferences {
  final double? targetCalorieExpenditure;
  final MacroSplit? targetMacroSplit;
  final double? targetFiberIntakeInGrams;

  const UserPreferences({
    this.targetCalorieExpenditure,
    this.targetMacroSplit,
    this.targetFiberIntakeInGrams,
  });
}
