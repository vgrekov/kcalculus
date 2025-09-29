import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/access.dart';
import 'package:kcalculus/domain/_common/models/access_level.dart';

class PremiumBadge extends ConsumerWidget {
  const PremiumBadge({
    super.key,
    required this.child,
  });

  final Widget child;

  Widget _buildBadge(
    BuildContext context, {
    required Color bgColor,
    required Color fgColor,
  }) {
    return Badge(
      backgroundColor: bgColor,
      label: Icon(
        Icons.diamond,
        color: fgColor,
        size: 14,
      ),
      padding: EdgeInsets.fromLTRB(2, 4, 2, 2),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessLevel = ref.watch(accessLevelRepositoryProvider);

    return switch (accessLevel) {
      AsyncData(:final value) => switch (value) {
          AccessLevelFree() => _buildBadge(
              context,
              bgColor: Theme.of(context).colorScheme.tertiaryContainer,
              fgColor: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
          AccessLevelFreeNoAds() => _buildBadge(
              context,
              bgColor: Theme.of(context).colorScheme.errorContainer,
              fgColor: Theme.of(context).colorScheme.onErrorContainer,
            ),
          _ => child,
        },
      _ => child,
    };
  }
}
