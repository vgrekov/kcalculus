import 'package:flutter/material.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
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
    return ListTile(
      key: ValueKey(container.id),
      onTap: () {
        onSelectContainer(container);
      },
      title: Text(
        container.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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
          container.weight.unit.localName(context),
        ),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
