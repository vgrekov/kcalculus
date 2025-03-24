import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/access_guard/utils/premium_feature.dart';
import 'package:kcalculus/ui/access_guard/widgets/access_guard.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/edible_main_info.dart';
import 'package:kcalculus/ui/common/widgets/macro_split_view.dart';
import 'package:kcalculus/ui/common/widgets/nutrition_facts_view/nutrition_facts_view.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/foods/save/widgets/food_save_screen.dart';
import 'package:kcalculus/ui/foods/share/widgets/food_share_screen.dart';
import 'package:kcalculus/ui/foods/view/view_models/food_view_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('FoodViewScreen');

class FoodViewScreen extends ConsumerWidget with WidgetMessenger {
  FoodViewScreen({
    super.key,
    required this.foodId,
    this.onDeleteFood,
  });

  final String foodId;

  final void Function(String id)? onDeleteFood;

  late final _assignments = <FoodViewCommand, UiAssignment>{
    FoodViewCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
    FoodViewCommand.confirmEditEaten: _confirmEditEaten,
    FoodViewCommand.editFood: _doEditFood,
  };

  final _accessGuardKey = UniqueKey();

  void _shareFood(BuildContext context, WidgetRef ref, Food food) {
    premiumFeature(ref, _accessGuardKey, () async {
      _log.eventFoodShare();

      showModalBottomSheet(
        context: context,
        scrollControlDisabledMaxHeightRatio: 0.9,
        builder: (context) => FoodShareScreen(food: food),
      );
    });
  }

  void _copyFood(WidgetRef ref) {
    ref.read(foodViewViewModel(foodId).notifier).copyFood();
  }

  void _editFood(WidgetRef ref) async {
    ref.read(foodViewViewModel(foodId).notifier).editFood();
  }

  void _deleteFood(BuildContext context) async {
    final deleteConfirmed = await showConfirmation(
          context,
          l10n(context).messageFoodDeletionConfirmation,
        ) ??
        false;

    if (deleteConfirmed == true) {
      onDeleteFood?.call(foodId);

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

  void _doEditFood(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => FoodSaveScreen(
          food: command.payload as Food,
        ),
      ),
    );
    command.complete();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodAsync = ref.watch(foodViewViewModel(foodId));

    final (
      List<Widget>? appBarActions,
      Widget? body,
      Widget? bottomNavigationBar,
    ) = foodAsync.when(
      data: (food) {
        final nutritionFacts = food.getNutritionFacts();
        final macroSplit =
            nutritionFacts.firstOrNull?.nutrientData.getMacroSplit();

        return (
          [
            IconButton(
              onPressed: () {
                _shareFood(context, ref, food);
              },
              icon: Icon(
                Icons.share,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            IconButton(
              onPressed: () {
                _copyFood(ref);
              },
              icon: Icon(
                Icons.copy,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            IconButton(
              onPressed: () {
                _editFood(ref);
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if (onDeleteFood != null)
              IconButton(
                onPressed: () {
                  _deleteFood(context);
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
                      edible: food,
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
          macroSplit == null
              ? null
              : Container(
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
                  child: MacroSplitView(
                    macroSplit: macroSplit,
                  ),
                ),
        );
      },
      error: (error, stackTrace) {
        _log.severe('Failed to load food', error, stackTrace);
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

    return AccessGuard(
      key: _accessGuardKey,
      child: UiSubordinate<FoodViewCommand>(
        commandProvider:
            ref.read(foodViewViewModel(foodId).notifier).commandProvider,
        assignments: _assignments,
        child: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              actions: appBarActions,
            ),
            body: body,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      ),
    );
  }
}
