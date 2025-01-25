import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/screens/common/portion_add.dart';
import 'package:kcalculus/screens/common/portion_edit.dart';
import 'package:kcalculus/ui/meals/list/view_models/meal_list_view_model.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_calendar.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/widgets/nutrient_stats.dart';
import 'package:kcalculus/widgets/screen_tab_bar.dart';

class MealListScreen extends ConsumerWidget with Messenger {
  const MealListScreen({super.key});

  void _addMeal(BuildContext context, WidgetRef ref) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPortionScreen(
          title: l10n(context).screenNewMeal,
          onSavePortion: (edible, amount) {
            ref.read(mealListViewModel.notifier).saveMeal(
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

  void _selectMeal(BuildContext context, WidgetRef ref, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditPortionScreen(
          title: l10n(context).screenEditMeal,
          portion: meal,
          onSavePortion: (newAmount) {
            ref.read(mealListViewModel.notifier).saveMeal(
                  meal.copyWith(
                    amount: newAmount,
                  ),
                );
          },
        ),
      ),
    );
  }

  void _deleteMeal(BuildContext context, WidgetRef ref, Meal meal) async {
    // showProgress();

    try {
      final isDeleted =
          await ref.read(mealListViewModel.notifier).deleteMeal(meal.id!);

      if (context.mounted) {
        if (isDeleted) {
          showNotificationWithUndo(
            context,
            l10n(context).messageMealDeletionSuccess,
            undoAction: () async {
              await ref.read(mealListViewModel.notifier).restoreMeal(meal.id!);
            },
          );
        } else {
          showNotification(context, l10n(context).messageMealDeletionFailure);
        }
      }
    } catch (error) {
      if (context.mounted) {
        showNotification(context, error.toString());
      }
    }

    // hideProgress();
  }

  void _toggleCalendar(WidgetRef ref) {
    ref.read(mealListViewModel.notifier).toggleCalendar();
  }

  void _selectDate(WidgetRef ref, DateTime date) {
    ref.read(mealListViewModel.notifier).selectDate(date);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();

    final uiState = ref.watch(mealListViewModel);

    return FutureBuilder(
      future: uiState.meals,
      builder: (context, snapshot) {
        var totalNutrientData = NutrientData.empty();

        final Widget body;
        final isLoading = snapshot.connectionState == ConnectionState.waiting;
        final readonly =
            isLoading || snapshot.hasError || !dt.isSameDay(now, uiState.date);
        if (isLoading) {
          body = const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          body = Center(
            child: Text(
              l10n(context).messageUnknownError,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          body = Center(
            child: Text(
              l10n(context).messageNoMeals,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          );
        } else {
          final meals = snapshot.data!;
          totalNutrientData = meals
              .map((m) => m.getNutrientData() ?? NutrientData.empty())
              .fold(
                NutrientData.empty(),
                (nd1, nd2) => nd1 + nd2,
              );

          body = MealList(
            meals: meals,
            onSelectMeal: (meal) {
              _selectMeal(context, ref, meal);
            },
            onDeleteMeal: (meal) {
              _deleteMeal(context, ref, meal);
            },
            readonly: readonly,
          );
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  l10n(context).screenMeals,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                Text(
                  dt.formatDateLocal(context, uiState.date),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _toggleCalendar(ref);
                },
                icon: const Icon(Icons.calendar_month_outlined),
              ),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              MealCalendar(
                initialDate: uiState.date,
                expanded: uiState.showCalendar,
                onSelectDate: (date) {
                  _selectDate(ref, date);
                },
              ),
              Expanded(
                child: body,
              ),
            ],
          ),
          floatingActionButton: readonly
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    _addMeal(context, ref);
                  },
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isLoading && !snapshot.hasError)
                NutrientStats(
                  nutrientData: totalNutrientData,
                ),
              const ScreenTabBar(
                selectedTab: ScreenTab.meals,
              ),
            ],
          ),
        );
      },
    );
  }
}
