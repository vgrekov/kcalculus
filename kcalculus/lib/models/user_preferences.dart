class MacroSplit {
  final double carbsPercentage;
  final double proteinPercentage;
  final double fatPercentage;

  MacroSplit({
    required this.carbsPercentage,
    required this.proteinPercentage,
    required this.fatPercentage,
  }) {
    if (carbsPercentage < 0 || proteinPercentage < 0 || fatPercentage < 0) {
      throw 'Macronutrient percentage can not be a negative number.';
    }

    if (carbsPercentage + proteinPercentage + fatPercentage != 1) {
      throw 'The split total must be equal to 1 (100%).';
    }
  }
}

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
