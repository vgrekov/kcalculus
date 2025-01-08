import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard_ingredients.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/screens/common/portion_add.dart';
import 'package:kcalculus/screens/common/portion_edit.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/widgets/ingredient_list.dart';
import 'package:kcalculus/widgets/nutrient_stats.dart';

class DishWizardIngredientsPage extends ConsumerWidget
    with Messenger
    implements DishWizardPage {
  const DishWizardIngredientsPage({super.key});

  void _addIngredient(BuildContext context, WidgetRef ref) {
    final wizardState = ref.read(dishWizardProvider).data;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPortionScreen(
          title: l10n(context).screenAddIngredient,
          onSavePortion: (edible, amount) {
            ref
                .read(dishWizardProvider)
                .data
                .ingredientsStepState
                .addIngredient(
                  Ingredient(
                    edible: edible,
                    amount: amount,
                  ),
                );
          },
          edibleSearchFilter:
              wizardState.id == null ? null : (r) => r.id != wizardState.id,
        ),
      ),
    );
  }

  void _selectIngredient(
    BuildContext context,
    WidgetRef ref,
    Ingredient ingredient,
    int index,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditPortionScreen(
          title: l10n(context).screenEditIngredient,
          portion: ingredient,
          onSavePortion: (newAmount) {
            ref
                .read(dishWizardProvider)
                .data
                .ingredientsStepState
                .replaceIngredientAt(
                  index,
                  ingredient.copyWith(
                    amount: newAmount,
                  ),
                );
          },
        ),
      ),
    );
  }

  void _deleteIngredient(
    BuildContext context,
    WidgetRef ref,
    Ingredient ingredient,
    int index,
  ) {
    try {
      final isDeleted = ref
          .read(dishWizardProvider)
          .data
          .ingredientsStepState
          .deleteIngredientAt(index);

      if (isDeleted) {
        showNotification(
            context, l10n(context).messageIngredientDeletionSuccess);
      } else {
        showNotification(
            context, l10n(context).messageIngredientDeletionFailure);
      }
    } catch (error) {
      showNotification(context, error.toString());
    }
  }

  @override
  bool validate(BuildContext context, WidgetRef ref) {
    final stepState = ref.read(dishWizardProvider).data.ingredientsStepState;
    if (stepState.validate() ==
        IngredientsStepStateValidationResult.ingredientsMissing) {
      showNotification(context, l10n(context).messageDishNoIngredientsError);
      return false;
    }

    return true;
  }

  @override
  void save(BuildContext context, WidgetRef ref) {}

  @override
  ScaffoldConfig? buildScaffoldConfig(BuildContext context, WidgetRef ref) {
    final totalNutrientData = ref
        .read(dishWizardProvider)
        .data
        .ingredientsStepState
        .ingredients
        .map((m) => m.getNutrientData() ?? NutrientData.empty())
        .fold(
          NutrientData.empty(),
          (nd1, nd2) => nd1 + nd2,
        );

    return ScaffoldConfig(
      subtitle: l10n(context).dishWizardPageIngredients,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addIngredient(context, ref);
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: NutrientStats(
          nutrientData: totalNutrientData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredients =
        ref.watch(dishWizardProvider).data.ingredientsStepState.ingredients;

    final Widget body;
    if (ingredients.isEmpty) {
      body = Center(
        child: Text(
          l10n(context).messageNoIngredients,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      );
    } else {
      body = IngredientList(
        ingredients: ingredients,
        onSelectIngredient: (ingredient, index) {
          _selectIngredient(context, ref, ingredient, index);
        },
        onDeleteIngredient: (ingredient, index) {
          _deleteIngredient(context, ref, ingredient, index);
        },
      );
    }

    return body;
  }
}
