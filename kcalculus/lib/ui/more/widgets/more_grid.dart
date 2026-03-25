import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/more/widgets/containers_grid_item.dart';

class MoreGrid extends StatelessWidget {
  const MoreGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: listStyle?.verticalGap ?? 0,
      crossAxisSpacing: listStyle?.horizontalGap ?? 0,
      padding: listStyle == null
          ? null
          : EdgeInsets.symmetric(
              horizontal: listStyle.horizontalGap,
              vertical: listStyle.verticalGap,
            ),
      children: [
        ContainersGridItem(),
      ],
    );
  }
}
