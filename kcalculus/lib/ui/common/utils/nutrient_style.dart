import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/ui/common/themes/macro_nutrients.dart';

TextStyle textStyleOf(
  BuildContext context,
  Nutrient nutrient, {
  Color? baseColor,
}) {
  final textTheme = Theme.of(context).textTheme;

  return switch (nutrient.displayPriority) {
    0 => textTheme.titleMedium!,
    1 => textTheme.bodyLarge!,
    2 => textTheme.bodyMedium!,
    _ => textTheme.bodySmall!,
  }
      .copyWith(
    color: colorOf(context, nutrient, baseColor: baseColor),
  );
}

Color? colorOf(
  BuildContext context,
  Nutrient nutrient, {
  Color? baseColor,
}) {
  final root = _rootOf(nutrient);

  final colorScheme = Theme.of(context).colorScheme;
  final macroTheme = Theme.of(context).extension<MacroNutrientsTheme>();

  final color = (baseColor ??
      switch (root) {
        Nutrient.energy => colorScheme.primary,
        Nutrient.fat => macroTheme?.fatColor,
        Nutrient.totalCarbs => macroTheme?.carbsColor,
        Nutrient.protein => macroTheme?.proteinColor,
        _ => colorScheme.onSurface,
      });
  return nutrient.displayPriority <= 1
      ? color
      : color?.withValues(alpha: 1 - 0.1 * nutrient.displayPriority);
}

Nutrient _rootOf(Nutrient nutrient) {
  while (nutrient.partOf != null) {
    nutrient = nutrient.partOf!;
  }

  return nutrient;
}
