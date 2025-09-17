import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/providers.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_state.dart';

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
