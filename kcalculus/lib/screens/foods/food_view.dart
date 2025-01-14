import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/screens/foods/food_save.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/edible_main_info.dart';
import 'package:kcalculus/widgets/macro_split_view.dart';
import 'package:kcalculus/widgets/nutrition_facts_view/nutrition_facts_view.dart';

class ViewFoodScreen extends ConsumerStatefulWidget {
  final Food food;
  final void Function(String id)? onDeleteFood;

  const ViewFoodScreen({
    super.key,
    required this.food,
    this.onDeleteFood,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ViewFoodScreenState();
  }
}

class _ViewFoodScreenState extends ConsumerState<ViewFoodScreen>
    with ProgressiveState, StateMessenger {
  void _deleteFood() async {
    final deleteConfirmed = await showConfirmation(
          l10n(context).messageFoodDeletionConfirmation,
        ) ??
        false;

    if (deleteConfirmed == true) {
      widget.onDeleteFood?.call(widget.food.id!);

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  void _editFood() async {
    final edibleDao = await ref.read(edibleDaoProvider);
    final wasEaten = await edibleDao.wasEaten(widget.food.id!);

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
          _doEditFood();
        } else if (editConfirmed == false) {
          _copyFood();
        }
      }
    } else {
      _doEditFood();
    }
  }

  void _doEditFood() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SaveFoodScreen(food: widget.food),
      ),
    );
  }

  void _copyFood() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SaveFoodScreen(food: widget.food.copy()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nutritionFacts = widget.food.getNutritionFacts();
    final macroSplit = nutritionFacts.firstOrNull?.nutrientData.getMacroSplit();

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: _copyFood,
              icon: Icon(
                Icons.copy,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            IconButton(
              onPressed: _editFood,
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            if (widget.onDeleteFood != null)
              IconButton(
                onPressed: _deleteFood,
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
                    edible: widget.food,
                  ),
                ),
                TabBar(
                  tabs: [
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
