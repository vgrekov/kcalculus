import 'package:flutter/material.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/themes/macro_nutrients.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientStats extends StatelessWidget {
  final NutrientData nutrientData;

  const NutrientStats({
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
        bottom: 16,
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
                l10n(context).statCalories(
                    nb.formatDouble(context, nutrientData.calories)),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.left,
              ),
              Text(
                l10n(context).statFiber(
                    nb.formatDouble(context, nutrientData.fiberInGrams)),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: macroTheme.fiberColor,
                    ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          if (macroSplit != null) ...[
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              height: 8,
              child: Row(
                children: [
                  Expanded(
                    flex: macroSplit.fatPercentage.round(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: macroTheme.fatColor,
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
                    l10n(context).statFatPercentage(
                        nb.formatDouble(context, macroSplit.fatPercentage)),
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
                    l10n(context).statCarbsPercentage(
                        nb.formatDouble(context, macroSplit.carbsPercentage)),
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
                    l10n(context).statProteinPercentage(
                        nb.formatDouble(context, macroSplit.proteinPercentage)),
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
