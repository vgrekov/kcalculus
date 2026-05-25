import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class RecentTag extends StatelessWidget {
  const RecentTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      l10n(context).tagRecent,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
    );
  }
}
