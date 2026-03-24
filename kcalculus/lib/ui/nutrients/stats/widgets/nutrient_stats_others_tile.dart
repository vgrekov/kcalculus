import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_row_view.dart';

class NutrientStatsOthersTile extends StatelessWidget {
  const NutrientStatsOthersTile({
    super.key,
    required this.rows,
    this.animated = true,
  });

  final List<NutrientStatsRow> rows;

  final bool animated;

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    final widgets = <Widget>[];
    for (var i = 0; i < rows.length; i++) {
      if (i > 0) {
        widgets.add(const SizedBox(height: 8));
      }

      widgets.add(
        NutrientStatsRowView(
          row: rows[i],
          isChild: true,
        ),
      );
    }

    return Material(
      borderRadius: listStyle?.itemBorderRadius,
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        ),
      ),
    );
  }
}
