import 'package:flutter/material.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/themes/macro_nutrients.dart';

class DailyTotal extends StatelessWidget {
  final NutrientData nutrientData;

  const DailyTotal({
    super.key,
    required this.nutrientData,
  });

  @override
  Widget build(BuildContext context) {
    final macroTheme = Theme.of(context).extension<MacroNutrientsTheme>()!;
    final macroSplit = nutrientData.getMacroSplit();
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 20,
        right: 20,
        bottom: 32,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${nutrientData.calories.toStringAsFixed(2)} kcal',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Fiber: ${nutrientData.fiberInGrams.toStringAsFixed(2)} g',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: macroTheme.fiberColor,
                    ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          if (macroSplit != null) ...[
            const SizedBox(height: 16),
            SizedBox(
              height: 8,
              child: Row(
                children: [
                  Expanded(
                    flex: macroSplit.fatPercentage.round(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: macroTheme.fatColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: macroSplit.carbsPercentage.round(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: macroTheme.carbsColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: macroSplit.proteinPercentage.round(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: macroTheme.proteinColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: macroTheme.fatColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  width: 8,
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 16,
                  ),
                  child: Text(
                    'Fat: ${macroSplit.fatPercentage.toStringAsFixed(2)}%',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: macroTheme.carbsColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  width: 8,
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 16,
                  ),
                  child: Text(
                    'Carbs: ${macroSplit.carbsPercentage.toStringAsFixed(2)}%',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: macroTheme.proteinColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  width: 8,
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                  ),
                  child: Text(
                    'Protein: ${macroSplit.proteinPercentage.toStringAsFixed(2)}%',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
