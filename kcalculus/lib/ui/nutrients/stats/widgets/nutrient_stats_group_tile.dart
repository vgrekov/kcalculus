import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_row_view.dart';

class NutrientStatsGroupTile extends StatelessWidget {
  const NutrientStatsGroupTile({
    super.key,
    required this.group,
    this.animated = true,
  });

  final List<NutrientStatsRow> group;

  final bool animated;

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    final rootLevel = group.firstOrNull?.level;

    return Material(
      borderRadius: listStyle?.itemBorderRadius,
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: group.map(
            (row) {
              final level = row.level - rootLevel!;

              return Padding(
                padding: EdgeInsets.only(
                  left: 16.0 * level,
                  top: level > 0 ? 8 : 0,
                ),
                child: NutrientStatsRowView(
                  row: row,
                  isChild: level > 0,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
