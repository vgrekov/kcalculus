import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
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

  @override
  Widget build(BuildContext context) {
    final deletable = !item.required && onDeleteItem != null;

    return Dismissible(
      key: ValueKey('${item.name}_dismissible'),
      direction:
          deletable ? DismissDirection.endToStart : DismissDirection.none,
      confirmDismiss: (direction) async {
        return await showConfirmation(
              context,
              l10n(context).messageDefaultNutrientDeletionConfirmation,
            ) ??
            false;
      },
      onDismissed: (direction) {
        onDeleteItem!(item);
      },
      background: Container(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
          ),
        ),
      ),
      child: ListTile(
        tileColor: item.required
            ? Theme.of(context).colorScheme.surfaceContainerHigh
            : Theme.of(context).colorScheme.surface,
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
              item.defaultUnit.localName(context),
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
      ),
    );
  }
}
