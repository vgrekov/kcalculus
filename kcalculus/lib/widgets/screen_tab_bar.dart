import 'package:flutter/material.dart';
import 'package:kcalculus/screens/daily_log.dart';
import 'package:kcalculus/screens/foods.dart';

enum ScreenTab {
  dailyLog,
  foods,
}

class ScreenTabBar extends StatelessWidget {
  final ScreenTab selectedTab;

  const ScreenTabBar({
    super.key,
    required this.selectedTab,
  });

  void _navigateTo(BuildContext context, ScreenTab tab) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return switch (tab) {
          ScreenTab.dailyLog => const DailyLogScreen(),
          ScreenTab.foods => const FoodsScreen()
        };
      },
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ));
  }

  Widget _buildDestination(BuildContext context, ScreenTab tab) {
    final Widget icon;
    final String label;
    switch (tab) {
      case ScreenTab.dailyLog:
        icon = const Icon(Icons.schedule);
        label = 'Daily Log';
        break;
      case ScreenTab.foods:
        icon = const Icon(Icons.fastfood);
        label = 'Food';
        break;
    }

    return NavigationDestination(
      icon: icon,
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: ScreenTab.values
          .map((tab) => _buildDestination(context, tab))
          .toList(),
      selectedIndex: ScreenTab.values.indexOf(selectedTab),
      onDestinationSelected: (index) {
        final destination = ScreenTab.values[index];
        if (destination != selectedTab) {
          _navigateTo(context, destination);
        }
      },
    );
  }
}
