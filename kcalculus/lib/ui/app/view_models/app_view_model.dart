import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_status_repository.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_task_repository.dart';
import 'package:kcalculus/domain/models/maintenance_status.dart';
import 'package:kcalculus/ui/app/view_models/app_ui_state.dart';

final appViewModel = FutureProvider<AppUiState>(
  (ref) async {
    final theme = await ref.watch(
      appSettingsRepositoryProvider.selectAsync(
        (settings) => settings.theme,
      ),
    );

    final bool maintenanceRequired;
    final maintenanceStatus = ref.read(maintenanceStatusRepository);
    if (maintenanceStatus == MaintenanceStatus.notStarted) {
      final maintenanceTasks = await ref.read(maintenanceTaskRepository.future);
      maintenanceRequired = maintenanceTasks.isNotEmpty;
    } else {
      maintenanceRequired = false;
    }

    return AppUiState(
      theme: theme,
      maintenanceRequired: maintenanceRequired,
    );
  },
);
