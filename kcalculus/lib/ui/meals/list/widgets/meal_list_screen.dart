import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/ui/common/widgets/nutrient_stats.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/meals/list/view_models/meal_list_view_model.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_calendar.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list.dart';
import 'package:kcalculus/ui/portions/add/widgets/portion_add_screen.dart';
import 'package:kcalculus/ui/portions/edit/widgets/portion_edit_screen.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/progressive.dart';

class MealListScreen extends ConsumerStatefulWidget with WidgetMessenger {
  const MealListScreen({super.key});

  @override
  ConsumerState<MealListScreen> createState() {
    return _MealListScreenState();
  }
}

class _MealListScreenState extends ConsumerState<MealListScreen>
    with StateMessenger, ProgressiveState {
  late final _assignments = <MealListCommand, UiAssignment>{
    MealListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    MealListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    MealListCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
  };

  Future<void> _refresh() {
    return ref.read(mealListViewModel.notifier).refresh();
  }

  void _addMeal() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PortionAddScreen(
          title: l10n(context).screenNewMeal,
          onSavePortion: (edible, amount) {
            return _saveMeal(
              Meal(
                edible: edible,
                amount: amount,
                eatenAt: DateTime.now(),
              ),
            );
          },
        ),
      ),
    );
  }

  void _selectMeal(Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PortionEditScreen(
          title: l10n(context).screenEditMeal,
          portion: meal,
          onSavePortion: (newAmount) {
            return _saveMeal(
              meal.copyWith(
                amount: newAmount,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _saveMeal(Meal meal) {
    return wrapInProgress(
      ref.read(mealListViewModel.notifier).saveMeal(meal),
    );
  }

  void _deleteMeal(Meal meal) {
    wrapInProgress(
      ref.read(mealListViewModel.notifier).deleteMeal(meal.id!),
    );
  }

  void _restoreMeal(String id) {
    wrapInProgress(
      ref.read(mealListViewModel.notifier).restoreMeal(id),
    );
  }

  void _toggleCalendar() {
    ref.read(mealListViewModel.notifier).toggleCalendar();
  }

  void _selectDate(DateTime date) {
    ref.read(mealListViewModel.notifier).selectDate(date);
  }

  void _showDeletionSuccessNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotificationWithUndo(
      l10n(context).messageMealDeletionSuccess,
      undoAction: () {
        _restoreMeal(command.payload as String);
      },
    );
    command.complete();
  }

  void _showDeletionFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageMealDeletionFailure);
    command.complete();
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final uiState = ref.watch(mealListViewModel);

    final readonly = !dt.isSameDay(now, uiState.date);

    return UiSubordinate<MealListCommand>(
      commandProvider: ref.read(mealListViewModel.notifier).commandProvider,
      assignments: _assignments,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                l10n(context).screenMeals,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Text(
                dt.formatDateLocal(context, uiState.date),
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: _toggleCalendar,
              icon: const Icon(Icons.calendar_month_outlined),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            MealCalendar(
              initialDate: uiState.date,
              expanded: uiState.showCalendar,
              onSelectDate: _selectDate,
            ),
            Expanded(
              child: MealList(
                items: uiState.data,
                itemsLoader: uiState.dataLoader,
                onRefresh: _refresh,
                onSelectMeal: _selectMeal,
                onDeleteMeal: _deleteMeal,
                readonly: readonly,
              ),
            ),
          ],
        ),
        floatingActionButton: readonly
            ? null
            : Awaited(
                future: uiState.dataLoader,
                data: (_, __) => FloatingActionButton(
                  onPressed: _addMeal,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Awaited(
                future: uiState.dataLoader,
                data: (_, __) {
                  final totalNutrientData = uiState.data
                      .map((m) => m.getNutrientData() ?? NutrientData.empty())
                      .fold(
                        NutrientData.empty(),
                        (nd1, nd2) => nd1 + nd2,
                      );

                  return NutrientStats(
                    nutrientData: totalNutrientData,
                  );
                }),
            const ScreenTabBar(
              selectedTab: ScreenTab.meals,
            ),
          ],
        ),
      ),
    );
  }
}
