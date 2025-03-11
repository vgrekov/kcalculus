import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/edible_main_info.dart';
import 'package:kcalculus/ui/common/widgets/ingredient_list.dart';
import 'package:kcalculus/ui/common/widgets/nutrient_stats.dart';
import 'package:kcalculus/ui/common/widgets/nutrition_facts_view/nutrition_facts_view.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/dishes/view/view_models/dish_view_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/ui/foods/share/widgets/food_share_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('DishViewScreen');

class DishViewScreen extends ConsumerWidget with WidgetMessenger {
  DishViewScreen({
    super.key,
    required this.dishId,
    this.onDeleteDish,
  });

  final String dishId;

  final void Function(String id)? onDeleteDish;

  late final _assignments = <DishViewCommand, UiAssignment>{
    DishViewCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
    DishViewCommand.confirmEditEaten: _confirmEditEaten,
    DishViewCommand.editDish: _doEditDish,
  };

  void _shareDish(BuildContext context, Dish dish) {
    showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.9,
      builder: (context) => FoodShareScreen(food: dish.toFood()),
    );
  }

  void _copyDish(WidgetRef ref) {
    ref.read(dishViewViewModel(dishId).notifier).copyDish();
  }

  void _editDish(WidgetRef ref) {
    ref.read(dishViewViewModel(dishId).notifier).editDish();
  }

  void _deleteDish(BuildContext context) async {
    final deleteConfirmed = await showConfirmation(
          context,
          l10n(context).messageDishDeletionConfirmation,
        ) ??
        false;

    if (deleteConfirmed == true) {
      onDeleteDish?.call(dishId);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(context, l10n(context).messageUnknownError);
    command.complete();
  }

  void _confirmEditEaten(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final confirmed = await showMessageDialog<bool>(
      context: context,
      message: l10n(context).messageConfirmEatenEdibleEdit,
      actions: {
        l10n(context).actionEdit: () => true,
        l10n(context).actionCopy: () => false,
        l10n(context).actionCancel: () => null,
      },
      messageType: MessageType.warning,
    );
    command.complete(confirmed);
  }

  void _doEditDish(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => DishWizardScreen(
          dish: command.payload as Dish,
        ),
      ),
    );
    command.complete();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishAsync = ref.watch(dishViewViewModel(dishId));

    final (
      List<Widget>? appBarActions,
      Widget? body,
      Widget? bottomNavigationBar,
    ) = dishAsync.when(
      data: (dish) {
        final nutritionFacts = dish.getNutritionFacts();
        final totalNutrientData = dish.ingredients
            .map((m) => m.getNutrientData() ?? NutrientData.empty())
            .fold(
              NutrientData.empty(),
              (nd1, nd2) => nd1 + nd2,
            );

        return (
          [
            IconButton(
              onPressed: () {
                _shareDish(context, dish);
              },
              icon: Icon(
                Icons.share,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            IconButton(
              onPressed: () {
                _copyDish(ref);
              },
              icon: Icon(
                Icons.copy,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            IconButton(
              onPressed: () {
                _editDish(ref);
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if (onDeleteDish != null)
              IconButton(
                onPressed: () {
                  _deleteDish(context);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
          ],
          Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: EdibleMainInfo(
                      edible: dish,
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
                      ingredients: dish.ingredients,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Theme.of(context).colorScheme.surfaceContainer,
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            width: double.infinity,
            child: NutrientStats(
              nutrientData: totalNutrientData,
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        _log.severe('Failed to load dish', error, stackTrace);
        return (
          null,
          Center(
            child: Text(
              l10n(context).messageUnknownError,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
          null,
        );
      },
      loading: () => (
        null,
        const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        ),
        null,
      ),
    );

    return UiSubordinate<DishViewCommand>(
      commandProvider:
          ref.read(dishViewViewModel(dishId).notifier).commandProvider,
      assignments: _assignments,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: appBarActions,
          ),
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
