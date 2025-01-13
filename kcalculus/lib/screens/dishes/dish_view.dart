import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/widgets/ingredient_list.dart';
import 'package:kcalculus/widgets/nutrient_stats.dart';
import 'package:kcalculus/widgets/nutrition_facts_view/nutrition_facts_view.dart';

class ViewDishScreen extends ConsumerWidget {
  final Dish dish;

  const ViewDishScreen({
    super.key,
    required this.dish,
  });

  void _editDish(BuildContext context, WidgetRef ref) {
    ref.read(dishWizardProvider.notifier).load(dish);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => DishWizardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutritionFacts = dish.getNutritionFacts();
    final totalNutrientData = dish.ingredients
        .map((m) => m.getNutrientData() ?? NutrientData.empty())
        .fold(
          NutrientData.empty(),
          (nd1, nd2) => nd1 + nd2,
        );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _editDish(context, ref);
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        dish.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dish.description,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: l10n(context).titleNutritionFacts,
                    ),
                    Tab(
                      text: l10n(context).titleIngredients,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: NutritionFactsView(
                      nutritionFacts: nutritionFacts,
                    ),
                  ),
                  IngredientList(
                    ingredients: dish.ingredients,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.surfaceContainer,
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          width: double.infinity,
          child: NutrientStats(
            nutrientData: totalNutrientData,
          ),
        ),
      ),
    );
  }
}
