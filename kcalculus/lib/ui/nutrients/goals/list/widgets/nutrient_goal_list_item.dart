import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/widgets/deletable.dart';
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

  Widget _buildTile(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surfaceContainerHigh,
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
          item.amount.unit.localName(l10n(context)),
        ),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    return Material(
      borderRadius: listStyle?.itemBorderRadius,
      clipBehavior: Clip.antiAlias,
      child: Deletable(
        key: ValueKey('${item.nutrient.name}_deletable'),
        confirmMessage: l10n(context).messageNutrientGoalDeletionConfirmation,
        onDeleted: () {
          onDeleteItem?.call(item);
        },
        child: _buildTile(context),
      ),
    );
  }
}
