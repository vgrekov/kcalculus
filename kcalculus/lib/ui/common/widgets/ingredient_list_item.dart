import 'package:flutter/material.dart';
import 'package:kcalculus/domain/dish/models/ingredient.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/widgets/deletable.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class IngredientListItem extends StatelessWidget with WidgetMessenger {
  const IngredientListItem({
    super.key,
    required this.ingredient,
    this.onSelectIngredient,
    this.onDeleteIngredient,
  });

  final Ingredient ingredient;

  final void Function(Ingredient ingredient)? onSelectIngredient;

  final void Function(Ingredient ingredient)? onDeleteIngredient;

  Widget _buildTile(BuildContext context) {
    final nutrientData = ingredient.getNutritionFacts()?.nutrientData;

    return ListTile(
      tileColor: Theme.of(context).colorScheme.surfaceContainerLow,
      onTap: onSelectIngredient == null
          ? null
          : () {
              onSelectIngredient!(ingredient);
            },
      key: UniqueKey(),
      title: Text(
        ingredient.edible.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: ingredient.edible.description.isEmpty
          ? null
          : Text(
              ingredient.edible.description,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            l10n(context).statWithUnit(
              nb.formatDouble(context, ingredient.amount.value),
              ingredient.amount.unit.localName(l10n(context)),
            ),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          if (nutrientData != null)
            Text(
              l10n(context).statCalories(
                  nb.formatDouble(context, nutrientData.calories)),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    final tile = _buildTile(context);

    return Container(
      margin: (listStyle?.horizontalGap ?? 0) > 0
          ? EdgeInsets.symmetric(
              horizontal: listStyle!.horizontalGap,
            )
          : null,
      child: Material(
        borderRadius: listStyle?.itemBorderRadius,
        clipBehavior: Clip.antiAlias,
        child: onDeleteIngredient == null
            ? tile
            : Deletable(
                key: UniqueKey(),
                confirmMessage:
                    l10n(context).messageIngredientDeletionConfirmation,
                onDeleted: () {
                  onDeleteIngredient!(ingredient);
                },
                child: tile,
              ),
      ),
    );
  }
}
