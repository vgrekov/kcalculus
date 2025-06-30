import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/nutrient_stats/widgets/nutrient_goal_progress.dart';
import 'package:kcalculus/ui/common/nutrient_stats/widgets/nutrient_stats_daily_trigger.dart';

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
      child: Stack(
        children: [
          NutrientGoalProgress(
            nutrient: Nutrient.energy,
            goalAmount: energyGoalAmount,
            actualAmount: energyAmount,
            actualAmountTextStyle: Theme.of(context).textTheme.titleLarge,
            goalAmountTextStyle: Theme.of(context).textTheme.titleSmall,
            diffAmountTextStyle: Theme.of(context).textTheme.titleSmall,
            percentageTextStyle: Theme.of(context).textTheme.titleSmall,
            progressBarHeight: 8,
            progressBarPadding: const EdgeInsets.symmetric(vertical: 16),
            animated: false,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: NutrientStatsDailyTrigger(
              data: nutrientData,
              date: date,
            ),
          ),
        ],
      ),
    );
  }
}
