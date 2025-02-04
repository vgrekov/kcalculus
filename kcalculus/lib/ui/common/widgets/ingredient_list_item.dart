import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/dish/ingredient.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class IngredientListItem extends StatelessWidget {
  final Ingredient ingredient;
  final void Function(Ingredient ingredient)? onSelectIngredient;

  const IngredientListItem({
    super.key,
    required this.ingredient,
    this.onSelectIngredient,
  });

  @override
  Widget build(BuildContext context) {
    final nutrientData = ingredient.getNutrientData();
    return ListTile(
      onTap: onSelectIngredient == null
          ? null
          : () {
              onSelectIngredient!(ingredient);
            },
      key: UniqueKey(),
      title: Text(
        ingredient.edible.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: ingredient.edible.description.isEmpty
          ? null
          : Text(
              ingredient.edible.description,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
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
              ingredient.amount.unit.localName(context),
            ),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
          if (nutrientData != null)
            Text(
              l10n(context).statCalories(
                  nb.formatDouble(context, nutrientData.calories)),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
        ],
      ),
    );
  }
}
