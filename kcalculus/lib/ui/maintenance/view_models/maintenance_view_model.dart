import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_status_repository.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_task_repository.dart';
import 'package:kcalculus/domain/models/maintenance_status.dart';

final maintenanceViewModel = StreamProvider<String Function(AppLocalizations)>(
  (ref) async* {
    ref.read(maintenanceStatusRepository.notifier).state =
        MaintenanceStatus.inProgress;

    final tasks = await ref.watch(maintenanceTaskRepository.future);

    try {
      for (final task in tasks) {
        yield task.title;
        await task.run(ref);
      }

      ref.read(maintenanceStatusRepository.notifier).state =
          MaintenanceStatus.complete;
    } catch (error) {
      ref.read(maintenanceStatusRepository.notifier).state =
          MaintenanceStatus.error;
      rethrow;
    }
  },
);
