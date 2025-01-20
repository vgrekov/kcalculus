import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/maintenance_status.dart';

final maintenanceStatusRepository = StateProvider<MaintenanceStatus>(
  (ref) => MaintenanceStatus.notStarted,
);
