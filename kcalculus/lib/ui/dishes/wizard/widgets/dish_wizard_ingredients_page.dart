import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/dish/ingredient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/widgets/ingredient_list.dart';
import 'package:kcalculus/ui/common/widgets/nutrient_stats.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ingredients_step_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/ingredient_save_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class DishWizardIngredientsPage extends ConsumerWidget
    with WidgetMessenger
    implements DishWizardPage {
  const DishWizardIngredientsPage({
    super.key,
    this.dish,
  });

  final Dish? dish;

  void _addIngredient(BuildContext context, WidgetRef ref) async {
    final nutrientDefaults = await ref
        .read(dishWizardViewModel(dish).notifier)
        .getNutrientDefaults();

    if (context.mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => IngredientSaveScreen(
            nutrientDefaults: nutrientDefaults,
            onSaveIngredient: (ingredient) {
              ref
                  .read(dishWizardViewModel(dish).notifier)
                  .addIngredient(ingredient);
            },
          ),
        ),
      );
    }
  }

  void _selectIngredient(
    BuildContext context,
    WidgetRef ref,
    Ingredient ingredient,
    int index,
  ) async {
    final nutrientDefaults = await ref
        .read(dishWizardViewModel(dish).notifier)
        .getNutrientDefaults();

    if (context.mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => IngredientSaveScreen(
            ingredient: ingredient,
            nutrientDefaults: nutrientDefaults,
            onSaveIngredient: (newIngredient) {
              ref.read(dishWizardViewModel(dish).notifier).replaceIngredientAt(
                    index,
                    newIngredient,
                  );
            },
          ),
        ),
      );
    }
  }

  void _deleteIngredient(
    BuildContext context,
    WidgetRef ref,
    Ingredient ingredient,
    int index,
  ) {
    try {
      final isDeleted = ref
          .read(dishWizardViewModel(dish).notifier)
          .deleteIngredientAt(index);

      if (isDeleted) {
        showNotificationWithUndo(
          context,
          l10n(context).messageIngredientDeletionSuccess,
          undoAction: () {
            ref
                .read(dishWizardViewModel(dish).notifier)
                .restoreIngredientAt(index, ingredient);
          },
        );
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
    final stepState = ref.read(dishWizardViewModel(dish)).ingredientsStepState;
    if (stepState.validate() ==
        IngredientsStepValidationResult.ingredientsMissing) {
      showNotification(context, l10n(context).messageDishNoIngredientsError);
      return false;
    }

    return true;
  }

  @override
  void save(BuildContext context, WidgetRef ref) {}

  @override
  ScaffoldConfig? buildScaffoldConfig(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(dishWizardViewModel(dish));

    final totalNutrientData = uiState.ingredientsStepState.ingredients
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
    final uiState = ref.watch(dishWizardViewModel(dish));

    final ingredients = uiState.ingredientsStepState.ingredients;

    final Widget body;
    if (ingredients.isEmpty) {
      body = Center(
        child: Text(
          l10n(context).messageNoIngredients,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
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
