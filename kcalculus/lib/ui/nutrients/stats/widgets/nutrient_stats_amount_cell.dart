import 'package:flutter/material.dart';
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
