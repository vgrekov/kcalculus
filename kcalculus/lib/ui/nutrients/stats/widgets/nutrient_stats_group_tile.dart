import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_row_view.dart';

class NutrientStatsGroupTile extends StatelessWidget {
  const NutrientStatsGroupTile({
    super.key,
    required this.row,
    this.animated = true,
  });

  final NutrientStatsRow row;

  final bool animated;

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    final rows = <Widget>[];

    final stack = <(NutrientStatsRow, int)>[(row, 0)];

    while (stack.isNotEmpty) {
      final (row, level) = stack.removeLast();

      rows.add(
        Padding(
          padding: EdgeInsets.only(left: 16.0 * level, top: level > 0 ? 8 : 0),
          child: NutrientStatsRowView(
            row: row,
            isChild: level > 0,
          ),
        ),
      );

      for (final child in row.children.reversed) {
        stack.add((child, level + 1));
      }
    }

    return Material(
      borderRadius: listStyle?.itemBorderRadius,
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: rows,
        ),
      ),
    );
  }
}
