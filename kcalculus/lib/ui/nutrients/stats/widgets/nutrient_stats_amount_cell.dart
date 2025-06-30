import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/nutrient_stats/widgets/nutrient_goal_progress.dart';
import 'package:kcalculus/ui/common/utils/nutrient_style.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientStatsAmountCell extends StatelessWidget {
  const NutrientStatsAmountCell({
    super.key,
    required this.row,
  });

  final NutrientStatsRow row;

  @override
  Widget build(BuildContext context) {
    if (row.goalAmount != null &&
        row.goalAmount!.unit.measure == row.amount.unit.measure) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: NutrientGoalProgress(
          nutrient: row.nutrient,
          goalAmount: row.goalAmount!,
          actualAmount: row.amount,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        l10n(context).statWithUnit(
          nb.formatDouble(context, row.amount.value),
          row.amount.unit.localName(context),
        ),
        style: textStyleOf(context, row.nutrient),
      ),
    );
  }
}
