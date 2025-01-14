import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/edible_main_info.dart';
import 'package:kcalculus/widgets/ingredient_list.dart';
import 'package:kcalculus/widgets/nutrient_stats.dart';
import 'package:kcalculus/widgets/nutrition_facts_view/nutrition_facts_view.dart';

class ViewDishScreen extends ConsumerStatefulWidget {
  final Dish dish;
  final void Function(String id)? onDeleteDish;

  const ViewDishScreen({
    super.key,
    required this.dish,
    this.onDeleteDish,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ViewDishScreenState();
  }
}

class _ViewDishScreenState extends ConsumerState<ViewDishScreen>
    with ProgressiveState, StateMessenger {
  void _deleteDish() async {
    final deleteConfirmed = await showConfirmation(
          l10n(context).messageDishDeletionConfirmation,
        ) ??
        false;

    if (deleteConfirmed == true) {
      widget.onDeleteDish?.call(widget.dish.id!);

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  void _editDish() async {
    final edibleDao = await ref.read(edibleDaoProvider);
    final wasEaten = await edibleDao.wasEaten(widget.dish.id!);

    if (wasEaten) {
      if (mounted) {
        final editConfirmed = await showMessageDialog<bool>(
          message: l10n(context).messageConfirmEatenEdibleEdit,
          actions: {
            l10n(context).actionEdit: () => true,
            l10n(context).actionCopy: () => false,
            l10n(context).actionCancel: () => null,
          },
          messageType: MessageType.warning,
        );

        if (editConfirmed == true) {
          _doEditDish();
        } else if (editConfirmed == false) {
          _copyDish();
        }
      }
    } else {
      _doEditDish();
    }
  }

  void _doEditDish() {
    ref.read(dishWizardProvider.notifier).load(widget.dish);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => DishWizardScreen(),
      ),
    );
  }

  void _copyDish() {
    ref.read(dishWizardProvider.notifier).load(widget.dish.copy());
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => DishWizardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nutritionFacts = widget.dish.getNutritionFacts();
    final totalNutrientData = widget.dish.ingredients
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
              onPressed: _copyDish,
              icon: Icon(
                Icons.copy,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            IconButton(
              onPressed: _editDish,
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            if (widget.onDeleteDish != null)
              IconButton(
                onPressed: _deleteDish,
                icon: Icon(
                  Icons.delete,
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
                  padding: const EdgeInsets.all(8),
                  child: EdibleMainInfo(
                    edible: widget.dish,
                  ),
                ),
                TabBar(
                  tabs: [
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
                    ingredients: widget.dish.ingredients,
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
