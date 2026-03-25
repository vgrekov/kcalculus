import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutrientSearchListItem extends StatelessWidget {
  const NutrientSearchListItem({
    super.key,
    required this.item,
    this.onSelectItem,
  });

  final Nutrient item;

  final void Function(Nutrient)? onSelectItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(item.name),
      tileColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      onTap: () {
        onSelectItem?.call(item);
      },
      title: Text(
        item.localName(l10n(context)),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        item.defaultUnit.localName(l10n(context)),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
