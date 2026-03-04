import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/dish/models/ingredient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/ui/common/nutrient_stats/widgets/nutrient_stats.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/widgets/ingredient_list.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ingredients_step_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ingredients_step_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/ingredient_save_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class DishWizardIngredientsPage extends ConsumerWidget
    with WidgetMessenger
    implements DishWizardPage {
  const DishWizardIngredientsPage({
    super.key,
    this.dish,
    required this.nutrientDefaults,
  });

  final Dish? dish;

  final List<Nutrient> nutrientDefaults;

  void _addIngredient(BuildContext context, WidgetRef ref) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => IngredientSaveScreen(
          nutrientDefaults: nutrientDefaults,
          onSaveIngredient: (ingredient) {
            _doAddIngredient(context, ref, ingredient);
          },
        ),
      ),
    );
  }

  void _doAddIngredient(
    BuildContext context,
    WidgetRef ref,
    Ingredient ingredient,
  ) {
    final amountChange = ref
        .read(dishWizardViewModel(dish).notifier)
        .addIngredient(ingredient);

    if (amountChange != null) {
      _showIngredientChangeNotification(context, ref, amountChange);
    }
  }

  void _selectIngredient(
    BuildContext context,
    WidgetRef ref,
    Ingredient ingredient,
    int index,
  ) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => IngredientSaveScreen(
          ingredient: ingredient,
          nutrientDefaults: nutrientDefaults,
          onSaveIngredient: (newIngredient) {
            _replaceIngredient(context, ref, newIngredient, index);
          },
        ),
      ),
    );
  }

  void _replaceIngredient(
    BuildContext context,
    WidgetRef ref,
    Ingredient newIngredient,
    int index,
  ) {
    final amountChange = ref
        .read(dishWizardViewModel(dish).notifier)
        .replaceIngredientAt(
          index,
          newIngredient,
        );

    if (amountChange != null) {
      _showIngredientChangeNotification(context, ref, amountChange);
    }
  }

  void _showIngredientChangeNotification(
    BuildContext context,
    WidgetRef ref,
    IngredientAmountChange amountChange,
  ) {
    showNotificationWithUndo(
      context,
      l10n(context).messageIngredientChanged(
        amountChange.edible.name,
        amountChange.edible.description,
        amountChange.edible.description.isNotEmpty.toString(),
        nb.formatDouble(context, amountChange.from.value),
        amountChange.from.unit.localName(l10n(context)),
        nb.formatDouble(context, amountChange.to.value),
        amountChange.to.unit.localName(l10n(context)),
      ),
      undoAction: () {
        ref.read(dishWizardViewModel(dish).notifier).undoPreviousAction();
      },
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
          .read(dishWizardViewModel(dish).notifier)
          .deleteIngredientAt(index);

      if (isDeleted) {
        showNotificationWithUndo(
          context,
          l10n(context).messageIngredientDeletionSuccess,
          undoAction: () {
            ref.read(dishWizardViewModel(dish).notifier).undoPreviousAction();
          },
        );
      } else {
        showNotification(
          context,
          l10n(context).messageIngredientDeletionFailure,
        );
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
        .map((m) => m.getNutritionFacts()?.nutrientData ?? NutrientData.empty())
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
