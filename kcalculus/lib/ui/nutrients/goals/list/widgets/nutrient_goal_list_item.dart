import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutrientGoalListItem extends StatelessWidget with WidgetMessenger {
  const NutrientGoalListItem({
    super.key,
    required this.item,
    this.onSelectItem,
    this.onDeleteItem,
  });

  final NutrientGoal item;

  final void Function(NutrientGoal)? onSelectItem;

  final void Function(NutrientGoal)? onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey('${item.nutrient.name}_dismissible'),
      direction: onDeleteItem != null
          ? DismissDirection.endToStart
          : DismissDirection.none,
      confirmDismiss: (direction) async {
        return await showConfirmation(
              context,
              l10n(context).messageNutrientGoalDeletionConfirmation,
            ) ??
            false;
      },
      onDismissed: (direction) {
        onDeleteItem?.call(item);
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
        onTap: () {
          onSelectItem?.call(item);
        },
        title: Text(
          item.nutrient.localName(l10n(context)),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          l10n(context).statWithUnit(
            nb.formatDouble(context, item.amount.value),
            item.amount.unit.localName(context),
          ),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
