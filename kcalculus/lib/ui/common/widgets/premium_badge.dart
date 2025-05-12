import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/access_level.dart';

class PremiumBadge extends ConsumerWidget {
  const PremiumBadge({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessLevel = ref.watch(accessLevelRepositoryProvider);

    return switch (accessLevel) {
      AsyncData(:final value) => switch (value) {
          AccessLevelFree() => Badge(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              label: Icon(
                Icons.diamond,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                size: 14,
              ),
              padding: EdgeInsets.fromLTRB(2, 4, 2, 2),
              child: child,
            ),
          _ => child,
        },
      _ => child,
    };
  }
}
