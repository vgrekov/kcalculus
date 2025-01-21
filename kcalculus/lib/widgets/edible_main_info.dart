import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/food.dart';

class EdibleMainInfo extends StatelessWidget {
  final Edible edible;

  const EdibleMainInfo({
    super.key,
    required this.edible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          edible.name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
        const SizedBox(height: 8),
        Text(
          edible.description,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    );
  }
}
