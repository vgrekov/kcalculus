import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
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
    final listStyle = Theme.of(context).extension<ListStyle>();

    return ListView.separated(
      padding: listStyle == null
          ? null
          : EdgeInsets.symmetric(
              vertical: listStyle.verticalGap,
              horizontal: listStyle.horizontalGap,
            ),
      separatorBuilder: (_, _) => (listStyle?.verticalGap ?? 0) > 0
          ? SizedBox(height: listStyle!.verticalGap)
          : const SizedBox.shrink(),
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
