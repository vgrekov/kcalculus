import 'package:flutter/material.dart';
import 'package:kcalculus/ui/more/widgets/containers_grid_item.dart';

class MoreGrid extends StatelessWidget {
  const MoreGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.all(16),
      children: [
        ContainersGridItem(),
      ],
    );
  }
}
