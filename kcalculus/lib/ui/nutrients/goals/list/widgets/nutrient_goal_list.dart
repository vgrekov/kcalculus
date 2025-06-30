import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';
import 'package:kcalculus/ui/nutrients/goals/list/widgets/nutrient_goal_list_item.dart';

class NutrientGoalList extends StatelessWidget {
  const NutrientGoalList({
    super.key,
    required this.items,
    this.onSelectItem,
    this.onDeleteItem,
  });

  final List<NutrientGoal> items;

  final void Function(NutrientGoal)? onSelectItem;

  final void Function(NutrientGoal)? onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return NutrientGoalListItem(
          key: ValueKey(item.nutrient.name),
          item: item,
          onSelectItem: onSelectItem,
          onDeleteItem: onDeleteItem,
        );
      },
    );
  }
}
