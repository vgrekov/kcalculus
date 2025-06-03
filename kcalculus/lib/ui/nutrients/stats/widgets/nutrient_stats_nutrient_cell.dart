import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/utils/nutrient_style.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutrientStatsNutrientCell extends StatelessWidget {
  const NutrientStatsNutrientCell({
    super.key,
    required this.row,
  });

  final NutrientStatsRow row;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16.0 * row.level,
        8,
        8,
        8,
      ),
      child: Text(
        row.nutrient.localName(l10n(context)),
        style: textStyleOf(
          context,
          row.nutrient,
          baseColor: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
