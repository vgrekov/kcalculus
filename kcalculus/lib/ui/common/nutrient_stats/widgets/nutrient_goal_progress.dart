import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/utils/nutrient_style.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientGoalProgress extends StatelessWidget {
  const NutrientGoalProgress({
    super.key,
    required this.nutrient,
    required this.goalAmount,
    required this.actualAmount,
    this.actualAmountTextStyle,
    this.goalAmountTextStyle,
    this.diffAmountTextStyle,
    this.percentageTextStyle,
    this.progressBarHeight,
    this.progressBarPadding,
    this.animated = true,
  });

  final Nutrient nutrient;

  final Amount goalAmount;

  final Amount actualAmount;

  final TextStyle? actualAmountTextStyle;

  final TextStyle? goalAmountTextStyle;

  final TextStyle? diffAmountTextStyle;

  final TextStyle? percentageTextStyle;

  final double? progressBarHeight;

  final EdgeInsets? progressBarPadding;

  final bool animated;

  @override
  Widget build(BuildContext context) {
    final convertedGoalAmount = goalAmount.convert(actualAmount.unit);

    final aboveGoal = convertedGoalAmount < actualAmount;

    final diffAmount =
        (aboveGoal
                ? actualAmount - convertedGoalAmount
                : convertedGoalAmount - actualAmount)
            .convert(actualAmount.unit);

    final progress = actualAmount.value / convertedGoalAmount.value;

    final actualAmountTextStyle =
        this.actualAmountTextStyle ?? textStyleOf(context, nutrient);

    final goalAmountTextStyle =
        this.goalAmountTextStyle ?? Theme.of(context).textTheme.bodySmall!;

    final diffAmountTextStyle =
        this.diffAmountTextStyle ?? Theme.of(context).textTheme.bodySmall!;

    final percentageTextStyle =
        this.percentageTextStyle ?? Theme.of(context).textTheme.bodySmall!;

    final progressBarHeight = this.progressBarHeight ?? 4;

    final progressBarPadding =
        this.progressBarPadding ?? const EdgeInsets.symmetric(vertical: 4);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              nb.formatDouble(context, actualAmount.value),
              style: actualAmountTextStyle.copyWith(
                color: colorOf(context, nutrient),
              ),
            ),
            Text(
              l10n(context).ofStatWithUnit(
                nb.formatDouble(context, convertedGoalAmount.value),
                convertedGoalAmount.unit.localName(l10n(context)),
              ),
              style: goalAmountTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const Spacer(),
          ],
        ),
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
              tween: Tween(begin: 0, end: min(progress, 1.0)),
              duration: animated
                  ? const Duration(milliseconds: 600)
                  : Duration.zero,
              builder: (context, value, child) => LinearProgressIndicator(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surfaceBright,
                color: colorOf(context, nutrient),
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
              aboveGoal
                  ? l10n(context).statWithUnitOver(
                      nb.formatDouble(context, diffAmount.value),
                      diffAmount.unit.localName(l10n(context)),
                    )
                  : l10n(context).statWithUnitLeft(
                      nb.formatDouble(context, diffAmount.value),
                      diffAmount.unit.localName(l10n(context)),
                    ),
              style: diffAmountTextStyle.copyWith(
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
              style: percentageTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
