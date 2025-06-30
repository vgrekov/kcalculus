import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/more/widgets/more_grid.dart';
import 'package:kcalculus/utils/l10n.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n(context).screenMore,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      body: MoreGrid(),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        padding: EdgeInsets.only(top: 8),
        child: const ScreenTabBar(
          selectedTab: ScreenTab.more,
        ),
      ),
    );
  }
}
