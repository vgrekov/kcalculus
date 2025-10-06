import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/usda/_common/services/usda_service.dart';
import 'package:kcalculus/domain/_common/exceptions/localized_exception.dart';
import 'package:kcalculus/domain/maintenance/models/maintenance_task.dart';
import 'package:kcalculus/l10n/app_localizations.dart';
import 'package:logging/logging.dart';

final _log = Logger('UsdaFoodDataLoadingTask');

class UsdaFoodDataLoadingTask implements MaintenanceTask {
  const UsdaFoodDataLoadingTask();

  @override
  String get name => 'USDA FoodData Loading';

  @override
  String localName(AppLocalizations l10n) =>
      l10n.maintenanceTaskUsdaFoodDataLoadingTitle;

  @override
  FutureOr<bool> shouldRun(Ref ref) async {
    try {
      // Waiting for DB to open to avoid StateError
      await ref.read(usdaServiceProvider.future);

      final usdaService = ref.read(usdaServiceProvider.notifier);

      return usdaService.isDumpLoadRequired();
    } catch (error, stackTrace) {
      _log.severe(
        'Maintenance task failed: $name',
        error,
        stackTrace,
      );

      throw LocalizedException(
        (loc) => loc.maintenanceTaskUsdaFoodDataLoadingFailedMessage,
        cause: error,
      );
    }
  }

  @override
  FutureOr<void> run(Ref ref) async {
    try {
      // Waiting for DB to open to avoid StateError
      await ref.read(usdaServiceProvider.future);

      final usdaService = ref.read(usdaServiceProvider.notifier);

      return usdaService.loadDump();
    } catch (error, stackTrace) {
      _log.severe(
        'Maintenance task failed: $name',
        error,
        stackTrace,
      );

      throw LocalizedException(
        (loc) => loc.maintenanceTaskUsdaFoodDataLoadingFailedMessage,
        cause: error,
      );
    }
  }
}
