import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/widgets/deletable.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutrientDefaultsListItem extends StatelessWidget with WidgetMessenger {
  const NutrientDefaultsListItem({
    super.key,
    required this.item,
    required this.index,
    this.onDeleteItem,
  });

  final Nutrient item;

  final int index;

  final void Function(Nutrient)? onDeleteItem;

  Widget _buildTile(BuildContext context) {
    return ListTile(
      tileColor: item.required
          ? Theme.of(context).colorScheme.surfaceContainerHigh
          : Theme.of(context).colorScheme.surfaceContainerLow,
      title: Text(
        item.localName(l10n(context)),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: !item.required
          ? null
          : Text(
              l10n(context).labelDefaultNutrientRequired,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.defaultUnit.localName(l10n(context)),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(width: 16),
          ReorderableDragStartListener(
            index: index,
            child: Icon(
              Icons.drag_indicator,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    final listItem = Material(
      borderRadius: listStyle?.itemBorderRadius,
      clipBehavior: Clip.antiAlias,
      child: Deletable(
        key: ValueKey('${item.name}_deletable'),
        enabled: !item.required,
        confirmMessage:
            l10n(context).messageDefaultNutrientDeletionConfirmation,
        onDeleted: () {
          onDeleteItem?.call(item);
        },
        child: _buildTile(context),
      ),
    );

    if ((listStyle?.verticalGap ?? 0) == 0) {
      return listItem;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        listItem,
        SizedBox(height: listStyle?.verticalGap),
      ],
    );
  }
}
