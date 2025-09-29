import 'package:flutter/material.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts_preview.dart';
import 'package:kcalculus/ui/edibles/common/edible_stats.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list_item_calorie_content.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;

  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    final nutrientData = meal.getNutrientData();

    NutritionFactsPreview? nutritionFactsPreview;
    if (nutrientData != null) {
      nutritionFactsPreview = NutritionFactsPreview(
        per: meal.amount,
        calories: Amount(
          unit: Unit.calorie,
          value: nutrientData.calories,
        ),
        fat: Amount(
          unit: Unit.gram,
          value: nutrientData.fatInGrams,
        ),
        carbs: Amount(
          unit: Unit.gram,
          value: nutrientData.carbsInGrams,
        ),
        protein: Amount(
          unit: Unit.gram,
          value: nutrientData.proteinInGrams,
        ),
        fiber: Amount(
          unit: Unit.gram,
          value: nutrientData.fiberInGrams,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        onSelectMeal(meal);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n(context).mealEatenAt(
                          dt.formatTimeLocal(context, meal.eatenAt),
                        ),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        meal.edible.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (nutritionFactsPreview != null)
                  MealListItemCalorieContent(
                    nutritionFactsPreview: nutritionFactsPreview,
                  ),
              ],
            ),
            if (meal.edible.description.isNotEmpty)
              Text(
                meal.edible.description,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            if (nutritionFactsPreview != null)
              EdibleStats(
                nutritionFactsPreview: nutritionFactsPreview,
              ),
          ],
        ),
      ),
    );
  }
}
