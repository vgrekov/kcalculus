import 'package:flutter/material.dart';
import 'package:kcalculus/models/meal.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class MealsListItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  const MealsListItem({
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
        dt.formatTime(meal.eatenAt),
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
      ),
      title: Text(
        meal.edible.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${meal.amount.value.toStringAsFixed(2)} ${meal.amount.unit.displayName}',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
          if (nutrientData != null)
            Text(
              '${nutrientData.calories.toStringAsFixed(2)} kcal',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
        ],
      ),
    );
  }
}
