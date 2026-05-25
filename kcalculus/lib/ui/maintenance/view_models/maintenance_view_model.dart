import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/maintenance/models/maintenance_state.dart';
import 'package:kcalculus/domain/maintenance/use_cases/maintenance_use_case.dart';

class MaintenanceViewModel extends Notifier<MaintenanceState> {
  @override
  MaintenanceState build() {
    final maintenanceState = ref.watch(maintenanceUseCaseProvider);

    return maintenanceState;
  }

  Future<void> runMaintenance() {
    return ref.read(maintenanceUseCaseProvider.notifier).run();
  }
}

final maintenanceViewModel =
    NotifierProvider<MaintenanceViewModel, MaintenanceState>(
  MaintenanceViewModel.new,
);
