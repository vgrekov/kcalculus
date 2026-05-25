import 'package:kcalculus/domain/maintenance/models/maintenance_task.dart';

sealed class MaintenanceState {
  const MaintenanceState();
}

class MaintenanceNotStarted extends MaintenanceState {
  const MaintenanceNotStarted();
}

class MaintenanceInProgress extends MaintenanceState {
  const MaintenanceInProgress({
    required this.task,
  });

  final MaintenanceTask task;
}

class MaintenanceComplete extends MaintenanceState {
  const MaintenanceComplete();
}

class MaintenanceError extends MaintenanceState {
  const MaintenanceError({
    required this.error,
  });

  final Object error;
}
