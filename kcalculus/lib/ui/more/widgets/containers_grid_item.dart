import 'package:flutter/material.dart';
import 'package:kcalculus/ui/food_containers/list/widgets/food_container_list_screen.dart';
import 'package:kcalculus/ui/more/widgets/more_grid_item.dart';
import 'package:kcalculus/utils/l10n.dart';

class ContainersGridItem extends StatelessWidget {
  const ContainersGridItem({super.key});

  void _showContainers(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodContainerListScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MoreGridItem(
      onTap: () {
        _showContainers(context);
      },
      title: l10n(context).moreItemContainersTitle,
      subtitle: l10n(context).moreItemContainersSubtitle,
      image: Image.asset(
        'assets/images/pots.png',
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
