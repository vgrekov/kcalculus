import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/nutrient_stats/widgets/nutrient_stats_daily_trigger.dart';
import 'package:kcalculus/ui/common/utils/nutrient_style.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientStatsWithGoal extends StatelessWidget {
  const NutrientStatsWithGoal({
    super.key,
    required this.nutrientData,
    required this.date,
    required this.energyGoalAmount,
  });

  final NutrientData nutrientData;

  final DateTime date;

  final Amount energyGoalAmount;

  @override
  Widget build(BuildContext context) {
    final energyAmount = nutrientData.nutrientAmountsMap[Nutrient.energy] ??
        Amount(
          unit: Unit.calorie,
          value: 0,
        );

    final convertedGoalAmount = energyGoalAmount.convert(energyAmount.unit);

    final leftAmount = convertedGoalAmount > energyAmount
        ? (convertedGoalAmount - energyAmount).convert(energyAmount.unit)
        : null;

    final progress = energyAmount.value / convertedGoalAmount.value;

    final energyColor = colorOf(context, Nutrient.energy);

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
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    nb.formatDouble(context, energyAmount.value),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: energyColor,
                        ),
                  ),
                  Text(
                    l10n(context).ofStatWithUnit(
                      nb.formatDouble(context, convertedGoalAmount.value),
                      convertedGoalAmount.unit.localName(context),
                    ),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              NutrientStatsDailyTrigger(
                data: nutrientData,
                date: date,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            height: 8,
            child: LinearProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
              color: energyColor,
              value: min(progress, 1),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (leftAmount != null)
                Text(
                  l10n(context).statWithUnitLeft(
                    nb.formatDouble(context, leftAmount.value),
                    leftAmount.unit.localName(context),
                  ),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              const Spacer(),
              Text(
                l10n(context).percentage((progress * 100).floor().toString()),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
