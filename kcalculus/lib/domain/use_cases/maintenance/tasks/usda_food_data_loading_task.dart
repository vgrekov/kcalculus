import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/services/usda/usda_service.dart';
import 'package:kcalculus/domain/use_cases/maintenance/tasks/maintenance_task.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

class UsdaFoodDataLoadingTask implements MaintenanceTask {
  const UsdaFoodDataLoadingTask();

  @override
  String get name => 'USDA FoodData Loading';

  @override
  String localName(AppLocalizations l10n) =>
      l10n.maintenanceTaskUsdaFoodDataLoadingTitle;

  @override
  FutureOr<bool> shouldRun(Ref ref) => UsdaService.isDumpLoadRequired();

  @override
  FutureOr<void> run(Ref ref) => UsdaService.loadDump();
}
