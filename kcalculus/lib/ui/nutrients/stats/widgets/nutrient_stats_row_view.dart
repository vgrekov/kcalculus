import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/ui/common/utils/nutrient_style.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientStatsRowView extends StatelessWidget {
  const NutrientStatsRowView({
    super.key,
    required this.row,
    this.isChild = false,
    this.animated = true,
  });

  final NutrientStatsRow row;

  final bool isChild;

  final bool animated;

  @override
  Widget build(BuildContext context) {
    bool? aboveGoal;
    Amount? diffAmount;
    double? progress;

    final convertedGoalAmount = row.goalAmount?.tryConvert(row.amount.unit);

    if (convertedGoalAmount != null) {
      aboveGoal = convertedGoalAmount < row.amount;

      diffAmount =
          (aboveGoal
                  ? row.amount - convertedGoalAmount
                  : convertedGoalAmount - row.amount)
              .convert(row.amount.unit);

      progress = row.amount.value / convertedGoalAmount.value;
    }

    final nutrientTextStyle = isChild
        ? Theme.of(context).textTheme.bodyLarge
        : Theme.of(context).textTheme.titleMedium;

    final actualAmountTextStyle = isChild
        ? Theme.of(context).textTheme.bodyLarge
        : Theme.of(context).textTheme.titleMedium;

    final goalAmountTextStyle = isChild
        ? Theme.of(context).textTheme.bodySmall
        : Theme.of(context).textTheme.bodyMedium;

    final diffAmountTextStyle = isChild
        ? Theme.of(context).textTheme.bodySmall
        : Theme.of(context).textTheme.bodyMedium;

    final percentageTextStyle = isChild
        ? Theme.of(context).textTheme.bodySmall
        : Theme.of(context).textTheme.bodyMedium;

    final progressBarHeight = isChild ? 4.0 : 6.0;

    final progressBarPadding = EdgeInsets.symmetric(vertical: isChild ? 4 : 6);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              row.nutrient.localName(l10n(context)),
              style: nutrientTextStyle?.copyWith(
                color: colorOf(
                  context,
                  row.nutrient,
                  baseColor: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            const Spacer(),
            Text(
              l10n(context).statWithUnit(
                nb.formatDouble(context, row.amount.value),
                row.amount.unit.localName(l10n(context)),
              ),
              style: actualAmountTextStyle?.copyWith(
                color: colorOf(context, row.nutrient),
              ),
            ),
            if (convertedGoalAmount != null)
              Text(
                l10n(context).ofStatWithUnit(
                  nb.formatDouble(context, convertedGoalAmount.value),
                  convertedGoalAmount.unit.localName(l10n(context)),
                ),
                style: goalAmountTextStyle?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
          ],
        ),
        if (convertedGoalAmount != null) ...[
          Padding(
            padding: progressBarPadding,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(progressBarHeight / 2),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              height: progressBarHeight,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: min(progress!, 1.0)),
                duration: animated
                    ? const Duration(milliseconds: 600)
                    : Duration.zero,
                builder: (context, value, child) => LinearProgressIndicator(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.onInverseSurface,
                  color: colorOf(context, row.nutrient),
                  value: value,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                aboveGoal!
                    ? l10n(context).statWithUnitOver(
                        nb.formatDouble(context, diffAmount!.value),
                        diffAmount.unit.localName(l10n(context)),
                      )
                    : l10n(context).statWithUnitLeft(
                        nb.formatDouble(context, diffAmount!.value),
                        diffAmount.unit.localName(l10n(context)),
                      ),
                style: diffAmountTextStyle?.copyWith(
                  color: aboveGoal
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 16),
              const Spacer(),
              const SizedBox(width: 16),
              Text(
                l10n(context).percentage((progress * 100).floor().toString()),
                style: percentageTextStyle?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
