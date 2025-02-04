import 'package:flutter/material.dart';

class MacroNutrientsTheme extends ThemeExtension<MacroNutrientsTheme> {
  final Color? fatColor;
  final Color? carbsColor;
  final Color? fiberColor;
  final Color? proteinColor;

  const MacroNutrientsTheme({
    this.fatColor,
    this.carbsColor,
    this.fiberColor,
    this.proteinColor,
  });

  @override
  ThemeExtension<MacroNutrientsTheme> copyWith({
    Color? fatColor,
    Color? carbsColor,
    Color? fiberColor,
    Color? proteinColor,
  }) {
    return MacroNutrientsTheme(
      fatColor: fatColor ?? this.fatColor,
      carbsColor: carbsColor ?? this.carbsColor,
      fiberColor: fiberColor ?? this.fiberColor,
      proteinColor: proteinColor ?? this.proteinColor,
    );
  }

  @override
  ThemeExtension<MacroNutrientsTheme> lerp(
      covariant ThemeExtension<MacroNutrientsTheme>? other, double t) {
    if (other is! MacroNutrientsTheme) {
      return this;
    }
    return MacroNutrientsTheme(
      fatColor: Color.lerp(fatColor, other.fatColor, t),
      carbsColor: Color.lerp(carbsColor, other.carbsColor, t),
      fiberColor: Color.lerp(fiberColor, other.fiberColor, t),
      proteinColor: Color.lerp(proteinColor, other.proteinColor, t),
    );
  }
}
