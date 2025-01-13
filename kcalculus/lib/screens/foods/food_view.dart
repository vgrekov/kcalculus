import 'package:flutter/material.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/screens/foods/food_save.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/widgets/macro_split_view.dart';
import 'package:kcalculus/widgets/nutrition_facts_view/nutrition_facts_view.dart';

class ViewFoodScreen extends StatelessWidget {
  final Food food;

  const ViewFoodScreen({
    super.key,
    required this.food,
  });

  void _editFood(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SaveFoodScreen(food: food),
      ),
    );
  }

  void _copyFood(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SaveFoodScreen(food: food.copy()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nutritionFacts = food.getNutritionFacts();
    final macroSplit = nutritionFacts.firstOrNull?.nutrientData.getMacroSplit();

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _copyFood(context);
              },
              icon: Icon(
                Icons.copy,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            IconButton(
              onPressed: () {
                _editFood(context);
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
                        food.name,
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
                        food.description,
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
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(
            top: 24,
            left: 20,
            right: 20,
            bottom: 32,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          width: double.infinity,
          child: macroSplit == null
              ? null
              : MacroSplitView(
                  macroSplit: macroSplit,
                ),
        ),
      ),
    );
  }
}
