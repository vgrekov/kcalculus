import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
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
    final listStyle = Theme.of(context).extension<ListStyle>();

    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      padding: listStyle == null
          ? null
          : EdgeInsets.only(
              left: listStyle.horizontalGap,
              right: listStyle.horizontalGap,
              top: listStyle.verticalGap,
            ),
      onReorderItem: onReorderItems,
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
      proxyDecorator: (child, _, _) {
        return Material(
          color: Colors.transparent,
          child: child,
        );
      },
    );
  }
}
