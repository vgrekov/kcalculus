import 'dart:async';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/local/db.dart';

enum InitStatus {
  notStarted,
  inProgress,
  complete,
  error,
}

class InitTaskInfo {
  final String title;

  const InitTaskInfo({
    required this.title,
  });
}

abstract interface class InitTask {
  InitTaskInfo getInfo(AppLocalizations localizations);

  FutureOr<void> run();
}

final _tasks = <InitTask>[
  DbInitTask(),
];

final initStatusProvider =
    StateProvider<InitStatus>((ref) => InitStatus.notStarted);

final initTasksProvider =
    StreamProvider<InitTaskInfo Function(AppLocalizations)>(
  (ref) async* {
    ref.read(initStatusProvider.notifier).state = InitStatus.inProgress;

    try {
      for (final task in _tasks) {
        yield task.getInfo;
        await task.run();
      }

      ref.read(initStatusProvider.notifier).state = InitStatus.complete;
    } catch (error) {
      ref.read(initStatusProvider.notifier).state = InitStatus.error;
      rethrow;
    }
  },
);
