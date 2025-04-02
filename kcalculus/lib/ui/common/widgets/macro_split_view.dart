import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/macro_split.dart';
import 'package:kcalculus/ui/common/themes/macro_nutrients.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class MacroSplitView extends StatelessWidget {
  final MacroSplit macroSplit;

  const MacroSplitView({
    super.key,
    required this.macroSplit,
  });

  @override
  Widget build(BuildContext context) {
    final macroTheme = Theme.of(context).extension<MacroNutrientsTheme>()!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
        SizedBox(
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
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
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
