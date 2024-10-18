import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/models/meal.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/providers/meals.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/daily_total.dart';
import 'package:kcalculus/widgets/meals_list.dart';

class DailyLogScreen extends ConsumerStatefulWidget {
  const DailyLogScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DailyLogScreenState();
  }
}

class _DailyLogScreenState extends ConsumerState
    with StateMessenger, ProgressiveState {
  void _addMeal() {}

  void _selectMeal(Meal meal) {}

  void _deleteMeal(Meal meal) async {
    showProgress();

    try {
      final isDeleted =
          await ref.read(dailyLogProvider.notifier).deleteMeal(meal);
      if (isDeleted) {
        showMessage('Meal deleted');
      } else {
        showMessage('Failed to delete the meal');
      }
    } catch (error) {
      showMessage(error.toString());
    }

    hideProgress();
  }

  @override
  Widget build(BuildContext context) {
    final dailyLog = ref.watch(dailyLogProvider);
    return FutureBuilder(
      future: dailyLog,
      builder: (context, snapshot) {
        var totalNutrientData = NutrientData.empty();

        final Widget body;
        final isLoading = snapshot.connectionState == ConnectionState.waiting;
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
              'Oops.. Something went wrong...',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          body = Center(
            child: Text(
              'No meals logged so far...',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          );
        } else {
          final meals = snapshot.data!;
          totalNutrientData = meals
              .map((m) => m.getNutrientData() ?? NutrientData.empty())
              .reduce((nd1, nd2) => nd1 + nd2);
          body = MealsList(
            meals: meals,
            onSelectMeal: _selectMeal,
            onDeleteMeal: _deleteMeal,
          );
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  'Daily Log',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                Text(
                  dt.formatDate(DateTime.now()),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          body: body,
          floatingActionButton: (isLoading || snapshot.hasError)
              ? null
              : FloatingActionButton(
                  onPressed: _addMeal,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: (isLoading || snapshot.hasError)
              ? null
              : DailyTotal(
                  nutrientData: totalNutrientData,
                ),
        );
      },
    );
  }
}
