import 'package:flutter/material.dart';
import 'package:kcalculus/ui/more/widgets/more_grid_item.dart';
import 'package:kcalculus/utils/l10n.dart';

class ContainersGridItem extends StatelessWidget {
  const ContainersGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MoreGridItem(
      onTap: () {},
      title: l10n(context).moreItemContainersTitle,
      subtitle: l10n(context).moreItemContainersSubtitle,
      image: Image.asset(
        'assets/images/pots.png',
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
