import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_runner.dart';
import 'package:kcalculus/screens/meals/meal_list.dart';
import 'package:kcalculus/utils/exceptions.dart';
import 'package:kcalculus/utils/l10n.dart';

class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MaintenanceScreenState();
  }
}

class _MaintenanceScreenState extends ConsumerState<MaintenanceScreen> {
  @override
  void initState() {
    ref.listenManual(maintenanceStatusRepository, _onMaintenanceStatusChange);

    super.initState();
  }

  void _onMaintenanceStatusChange(
    MaintenanceStatus? previous,
    MaintenanceStatus next,
  ) {
    if (next == MaintenanceStatus.complete) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MealListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskTitle = ref.watch(maintenanceRunner);

    final Widget content;
    switch (taskTitle) {
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
              value(l10n(context)),
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
