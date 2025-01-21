import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/meals.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/nutrition.dart';
import 'package:kcalculus/screens/common/portion_add.dart';
import 'package:kcalculus/screens/common/portion_edit.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/log_calendar.dart';
import 'package:kcalculus/widgets/meals_list.dart';
import 'package:kcalculus/widgets/nutrient_stats.dart';
import 'package:kcalculus/widgets/screen_tab_bar.dart';

class MealListScreen extends ConsumerStatefulWidget {
  const MealListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MealListScreenState();
  }
}

class _MealListScreenState extends ConsumerState
    with StateMessenger, ProgressiveState {
  bool _showCalendar = false;

  void _addMeal() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPortionScreen(
          title: l10n(context).screenNewMeal,
          onSavePortion: (edible, amount) {
            ref.read(mealsProvider.notifier).addMeal(
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
        builder: (context) => EditPortionScreen(
          title: l10n(context).screenEditMeal,
          portion: meal,
          onSavePortion: (newAmount) {
            ref.read(mealsProvider.notifier).updateMeal(
                  meal.copyWith(
                    amount: newAmount,
                  ),
                );
          },
        ),
      ),
    );
  }

  void _deleteMeal(Meal meal) async {
    showProgress();

    try {
      final isDeleted = await ref.read(mealsProvider.notifier).deleteMeal(meal);

      if (mounted) {
        if (isDeleted) {
          showNotificationWithUndo(
            l10n(context).messageMealDeletionSuccess,
            undoAction: () async {
              await ref.read(mealsProvider.notifier).restoreMeal(meal.id!);
            },
          );
        } else {
          showNotification(l10n(context).messageMealDeletionFailure);
        }
      }
    } catch (error) {
      showNotification(error.toString());
    }

    hideProgress();
  }

  void _toggleCalendar() {
    setState(() {
      _showCalendar = !_showCalendar;
    });
  }

  void _selectDate(DateTime date) {
    ref.read(logDateProvider.notifier).selectDate(date);
    setState(() {
      _showCalendar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final logDate = ref.watch(logDateProvider);
    final dailyLog = ref.watch(mealsProvider);
    return FutureBuilder(
      future: dailyLog,
      builder: (context, snapshot) {
        var totalNutrientData = NutrientData.empty();

        final Widget body;
        final isLoading = snapshot.connectionState == ConnectionState.waiting;
        final readonly =
            isLoading || snapshot.hasError || !dt.isSameDay(now, logDate);
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

          body = MealsList(
            meals: meals,
            onSelectMeal: _selectMeal,
            onDeleteMeal: _deleteMeal,
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
                  dt.formatDateLocal(context, logDate),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: _toggleCalendar,
                icon: const Icon(Icons.calendar_month_outlined),
              ),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              LogCalendar(
                initialDate: logDate,
                expanded: _showCalendar,
                onSelectDate: _selectDate,
              ),
              Expanded(
                child: body,
              ),
            ],
          ),
          floatingActionButton: readonly
              ? null
              : FloatingActionButton(
                  onPressed: _addMeal,
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
