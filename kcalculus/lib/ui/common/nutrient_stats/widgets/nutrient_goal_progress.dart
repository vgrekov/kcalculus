import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/ui/common/utils/nutrient_style.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientGoalProgress extends StatelessWidget {
  const NutrientGoalProgress({
    super.key,
    required this.nutrient,
    required this.goalAmount,
    required this.actualAmount,
  });

  final Nutrient nutrient;

  final Amount goalAmount;

  final Amount actualAmount;

  @override
  Widget build(BuildContext context) {
    final convertedGoalAmount = goalAmount.convert(actualAmount.unit);

    final leftAmount = convertedGoalAmount > actualAmount
        ? (convertedGoalAmount - actualAmount).convert(actualAmount.unit)
        : null;

    final progress = actualAmount.value / convertedGoalAmount.value;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              nb.formatDouble(context, actualAmount.value),
              style: textStyleOf(context, nutrient),
            ),
            Text(
              l10n(context).ofStatWithUnit(
                nb.formatDouble(context, convertedGoalAmount.value),
                convertedGoalAmount.unit.localName(context),
              ),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          height: 4,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: min(progress, 1.0)),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) => LinearProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
              color: colorOf(context, nutrient),
              value: value,
            ),
          ),
        ),
        const SizedBox(height: 4),
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
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            const SizedBox(width: 16),
            const Spacer(),
            const SizedBox(width: 16),
            Text(
              l10n(context).percentage((progress * 100).floor().toString()),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
