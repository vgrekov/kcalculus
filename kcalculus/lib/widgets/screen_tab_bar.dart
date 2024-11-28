import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/foods.dart';
import 'package:kcalculus/data/meals.dart';
import 'package:kcalculus/screens/foods/food_list.dart';
import 'package:kcalculus/screens/meals/meal_list.dart';
import 'package:kcalculus/utils/l10n.dart';

enum ScreenTab {
  meals,
  foods,
}

class ScreenTabBar extends ConsumerWidget {
  final ScreenTab selectedTab;

  const ScreenTabBar({
    super.key,
    required this.selectedTab,
  });

  Widget _buildDestination(BuildContext context, ScreenTab tab) {
    final Widget icon;
    final String label;
    switch (tab) {
      case ScreenTab.meals:
        icon = const Icon(Icons.schedule);
        label = l10n(context).screenMeals;
        break;
      case ScreenTab.foods:
        icon = const Icon(Icons.fastfood);
        label = l10n(context).screenFoods;
        break;
    }

    return NavigationDestination(
      icon: icon,
      label: label,
    );
  }

  void _prepareFor(BuildContext context, WidgetRef ref, ScreenTab tab) {
    switch (tab) {
      case ScreenTab.meals:
        ref.read(mealsProvider.notifier).refresh();
        break;
      case ScreenTab.foods:
        ref.read(foodSearchQueryProvider.notifier).reset();
        break;
      default:
        break;
    }
  }

  void _navigateTo(BuildContext context, WidgetRef ref, ScreenTab tab) {
    _prepareFor(context, ref, tab);

    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return switch (tab) {
          ScreenTab.meals => const MealListScreen(),
          ScreenTab.foods => const FoodListScreen(),
        };
      },
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationBar(
      destinations: ScreenTab.values
          .map((tab) => _buildDestination(context, tab))
          .toList(),
      selectedIndex: ScreenTab.values.indexOf(selectedTab),
      onDestinationSelected: (index) {
        final destination = ScreenTab.values[index];
        if (destination != selectedTab) {
          _navigateTo(context, ref, destination);
        }
      },
    );
  }
}
