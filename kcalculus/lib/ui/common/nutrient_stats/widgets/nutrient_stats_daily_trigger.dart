import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_screen.dart';

class NutrientStatsDailyTrigger extends StatelessWidget {
  const NutrientStatsDailyTrigger({
    super.key,
    required this.data,
    required this.date,
  });

  final NutrientData data;

  final DateTime date;

  void _showDailyStats(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NutrientStatsScreen(
          date: date,
          data: data,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(32),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          _showDailyStats(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(
            Icons.read_more,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
