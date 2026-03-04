import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/macro_split.dart';
import 'package:kcalculus/ui/common/themes/macro_nutrients.dart';

class MacroSplitChart extends StatelessWidget {
  const MacroSplitChart({
    super.key,
    required this.macroSplit,
  });

  final MacroSplit macroSplit;

  @override
  Widget build(BuildContext context) {
    final macroTheme = Theme.of(context).extension<MacroNutrientsTheme>()!;

    return Container(
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
    );
  }
}
