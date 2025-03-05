import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class MealListItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  const MealListItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  @override
  Widget build(BuildContext context) {
    final nutrientData = meal.getNutrientData();
    return ListTile(
      onTap: () {
        onSelectMeal(meal);
      },
      key: ValueKey(meal.id),
      leading: Text(
        dt.formatTimeLocal(context, meal.eatenAt),
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
      title: Text(
        meal.edible.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: meal.edible.description.isEmpty
          ? null
          : Text(
              meal.edible.description,
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
              nb.formatDouble(context, meal.amount.value),
              meal.amount.unit.localName(context),
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
}
