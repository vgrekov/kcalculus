import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_status_repository.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_task_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/domain/models/maintenance_status.dart';

class AppUiState {
  const AppUiState({
    required this.settings,
    required this.maintenanceRequired,
  });

  final AppSettings settings;

  final bool maintenanceRequired;
}

final appViewModel = FutureProvider<AppUiState>(
  (ref) async {
    final settings = await ref.watch(appSettingsRepository.future);

    final bool maintenanceRequired;
    final maintenanceStatus = ref.read(maintenanceStatusRepository);
    if (maintenanceStatus == MaintenanceStatus.notStarted) {
      final maintenanceTasks = await ref.read(maintenanceTaskRepository.future);
      maintenanceRequired = maintenanceTasks.isNotEmpty;
    } else {
      maintenanceRequired = false;
    }

    return AppUiState(
      settings: settings,
      maintenanceRequired: maintenanceRequired,
    );
  },
);
