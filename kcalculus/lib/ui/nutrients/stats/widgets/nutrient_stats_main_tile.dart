import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/utils/nutrient_style.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientStatsMainTile extends StatelessWidget {
  const NutrientStatsMainTile({
    super.key,
    required this.row,
    this.animated = true,
  });

  final NutrientStatsRow row;

  final bool animated;

  @override
  Widget build(BuildContext context) {
    final convertedGoalAmount = row.goalAmount?.tryConvert(row.amount.unit);

    final listStyle = Theme.of(context).extension<ListStyle>();

    return Material(
      borderRadius: listStyle?.itemBorderRadius,
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: convertedGoalAmount == null
            ? _buildWithoutGoal(context)
            : _buildWithGoal(
                context,
                convertedGoalAmount: convertedGoalAmount,
              ),
      ),
    );
  }

  Widget _buildWithoutGoal(BuildContext context) {
    return Center(
      child: Text(
        l10n(context).statWithUnit(
          nb.formatDouble(context, row.amount.value),
          row.amount.unit.localName(l10n(context)),
        ),
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildWithGoal(
    BuildContext context, {
    required Amount convertedGoalAmount,
  }) {
    final aboveGoal = convertedGoalAmount < row.amount;

    final diffAmount =
        (aboveGoal
                ? row.amount - convertedGoalAmount
                : convertedGoalAmount - row.amount)
            .convert(row.amount.unit);

    final progress = row.amount.value / convertedGoalAmount.value;

    final tweenEnd = min(progress, 1.0);

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: tweenEnd),
          duration: animated
              ? const Duration(milliseconds: 600)
              : Duration.zero,
          builder: (context, value, child) => Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 96,
                height: 96,
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceBright,
                  color: colorOf(context, row.nutrient),
                  strokeWidth: 8,
                  strokeCap: StrokeCap.round,
                  value: value,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (value / tweenEnd * progress * 100).floor().toString(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    '%',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 32),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  nb.formatDouble(context, row.amount.value),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorOf(context, row.nutrient),
                  ),
                ),
                Text(
                  l10n(context).ofStatWithUnit(
                    nb.formatDouble(context, convertedGoalAmount.value),
                    convertedGoalAmount.unit.localName(l10n(context)),
                  ),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              aboveGoal
                  ? l10n(context).statWithUnitOver(
                      nb.formatDouble(context, diffAmount.value),
                      diffAmount.unit.localName(l10n(context)),
                    )
                  : l10n(context).statWithUnitLeft(
                      nb.formatDouble(context, diffAmount.value),
                      diffAmount.unit.localName(l10n(context)),
                    ),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: aboveGoal
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
