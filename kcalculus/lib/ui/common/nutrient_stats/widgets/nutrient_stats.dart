import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/ui/common/macro_split_view/widgets/macro_split_view.dart';
import 'package:kcalculus/ui/common/nutrient_stats/widgets/nutrient_stats_daily_trigger.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientStats extends StatelessWidget {
  const NutrientStats({
    super.key,
    required this.nutrientData,
    this.date,
  });

  final NutrientData nutrientData;

  final DateTime? date;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                l10n(context).statCalories(
                    nb.formatDouble(context, nutrientData.calories)),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.left,
              ),
              const Spacer(),
              if (date == null)
                Text(
                  l10n(context).statFiber(
                      nb.formatDouble(context, nutrientData.fiberInGrams)),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                  textAlign: TextAlign.center,
                ),
              if (date != null)
                NutrientStatsDailyTrigger(
                  data: nutrientData,
                  date: date!,
                ),
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
