import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/ui/common/widgets/macro_split_view.dart';
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
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          if (macroSplit != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: MacroSplitView(
                macroSplit: macroSplit,
              ),
            ),
        ],
      ),
    );
  }
}
