import 'package:flutter/material.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_amount_cell.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_nutrient_cell.dart';

class NutrientStatsTable extends StatelessWidget {
  const NutrientStatsTable({
    super.key,
    required this.rows,
  });

  final List<NutrientStatsRow> rows;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(),
        1: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        for (final row in rows)
          TableRow(
            children: [
              NutrientStatsNutrientCell(row: row),
              NutrientStatsAmountCell(row: row),
            ],
          ),
      ],
    );
  }
}
