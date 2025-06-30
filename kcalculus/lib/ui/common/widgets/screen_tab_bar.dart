import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/dishes/list/widgets/dish_list_screen.dart';
import 'package:kcalculus/ui/foods/list/widgets/food_list_screen.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list_screen.dart';
import 'package:kcalculus/ui/more/widgets/more_screen.dart';
import 'package:kcalculus/ui/settings/widgets/settings_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

enum ScreenTab {
  foods,
  dishes,
  meals,
  settings,
  more,
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
      case ScreenTab.foods:
        icon = const Icon(Icons.fastfood);
        label = l10n(context).screenFoods;
        break;
      case ScreenTab.dishes:
        icon = const Icon(Icons.set_meal);
        label = l10n(context).screenDishes;
        break;
      case ScreenTab.meals:
        icon = const Icon(Icons.schedule);
        label = l10n(context).screenMeals;
        break;
      case ScreenTab.settings:
        icon = const Icon(Icons.settings);
        label = l10n(context).screenSettings;
        break;
      case ScreenTab.more:
        icon = const Icon(Icons.grid_view);
        label = l10n(context).screenMore;
        break;
    }

    return NavigationDestination(
      icon: icon,
      label: label,
    );
  }

  void _navigateTo(BuildContext context, WidgetRef ref, ScreenTab tab) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return switch (tab) {
          ScreenTab.foods => const FoodListScreen(),
          ScreenTab.dishes => const DishListScreen(),
          ScreenTab.meals => const MealListScreen(),
          ScreenTab.settings => const SettingsScreen(),
          ScreenTab.more => const MoreScreen(),
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
