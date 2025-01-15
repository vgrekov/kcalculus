import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/maintenance/init.dart';
import 'package:kcalculus/screens/meals/meal_list.dart';
import 'package:kcalculus/utils/exceptions.dart';
import 'package:kcalculus/utils/l10n.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    ref.listenManual(initStatusProvider, _onInitStatusChange);

    super.initState();
  }

  void _onInitStatusChange(InitStatus? previous, InitStatus next) {
    if (next == InitStatus.complete) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MealListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskInfo = ref.watch(initTasksProvider);

    final Widget content;
    switch (taskInfo) {
      case AsyncData(:final value):
        content = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              color: Theme.of(context).colorScheme.secondary,
              minHeight: 8,
            ),
            const SizedBox(height: 16),
            Text(
              value(l10n(context)).title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ],
        );
        break;
      case AsyncError(:final error):
        content = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              color: Theme.of(context).colorScheme.error,
              minHeight: 8,
              value: 1,
            ),
            const SizedBox(height: 16),
            Text(
              error is LocalizedException
                  ? error.localizedMessage(l10n(context))
                  : error.toString(),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
            ),
          ],
        );
        break;
      default:
        content = const SizedBox.shrink();
    }

    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 300, 32, 32),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                l10n(context).appName,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 32),
              content,
            ]),
      ),
    );
  }
}
