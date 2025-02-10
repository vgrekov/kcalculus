import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_status_repository.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_task_repository.dart';
import 'package:kcalculus/domain/models/maintenance_status.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('MaintenanceViewModel');

final maintenanceViewModel = StreamProvider<String Function(BuildContext)>(
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
    } catch (error, stackTrace) {
      _log.severe('Maintenance failed', error, stackTrace);
      ref.read(maintenanceStatusRepository.notifier).state =
          MaintenanceStatus.error;
      rethrow;
    }
  },
);
