import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/nutrients/defaults/widgets/nutrient_defaults_list_item.dart';

class NutrientDefaultsList extends StatelessWidget {
  const NutrientDefaultsList({
    super.key,
    required this.items,
    this.onDeleteItem,
    required this.onReorderItems,
  });

  final List<Nutrient> items;

  final void Function(Nutrient)? onDeleteItem;

  final void Function(int, int) onReorderItems;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      onReorder: onReorderItems,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return NutrientDefaultsListItem(
          key: ValueKey(item.name),
          item: item,
          index: index,
          onDeleteItem: onDeleteItem,
        );
      },
    );
  }
}
