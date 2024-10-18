import 'package:flutter/material.dart';
import 'package:kcalculus/models/meal.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/widgets/meals_list_item.dart';

class MealsList extends StatelessWidget with Messenger {
  final List<Meal> meals;
  final void Function(Meal meal) onSelectMeal;
  final void Function(Meal meal) onDeleteMeal;

  const MealsList({
    super.key,
    required this.meals,
    required this.onSelectMeal,
    required this.onDeleteMeal,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            return await confirm(context, 'Delete this meal?') ?? false;
          },
          onDismissed: (direction) {
            onDeleteMeal(meal);
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
          child: MealsListItem(
            meal: meal,
            onSelectMeal: onSelectMeal,
          ),
        );
      },
    );
  }
}
