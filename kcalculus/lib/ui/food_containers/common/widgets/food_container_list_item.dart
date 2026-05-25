import 'package:flutter/material.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/ui/common/tags/deleted_tag.dart';
import 'package:kcalculus/ui/common/tags/recent_tag.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class FoodContainerListItem extends StatelessWidget {
  const FoodContainerListItem({
    super.key,
    required this.container,
    required this.onSelectContainer,
  });

  final FoodContainer container;

  final void Function(FoodContainer) onSelectContainer;

  @override
  Widget build(BuildContext context) {
    final Color bgColor;
    Widget? tag;

    if (container.deletedAt != null) {
      bgColor = Theme.of(context).colorScheme.surface;
      tag = const DeletedTag();
    } else if (container.isRecent) {
      bgColor = Theme.of(context).colorScheme.surfaceContainerHighest;
      tag = const RecentTag();
    } else {
      bgColor = Theme.of(context).colorScheme.surfaceContainerHigh;
    }

    final title = Text(
      container.name,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return ListTile(
      key: ValueKey(container.id),
      tileColor: bgColor,
      onTap: container.deletedAt != null
          ? null
          : () {
              onSelectContainer(container);
            },
      title: tag == null
          ? title
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tag,
                title,
              ],
            ),
      subtitle: container.description.isEmpty
          ? null
          : Text(
              container.description,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      trailing: Text(
        l10n(context).statWithUnit(
          nb.formatDouble(context, container.weight.value),
          container.weight.unit.localName(l10n(context)),
        ),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
