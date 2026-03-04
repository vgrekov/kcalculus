import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/exceptions/localized_exception.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/domain/maintenance/models/maintenance_task.dart';
import 'package:kcalculus/l10n/app_localizations.dart';
import 'package:logging/logging.dart';

final _log = Logger('NutritionFactsPreviewsCreationTask');

class NutritionFactsPreviewsCreationTask implements MaintenanceTask {
  const NutritionFactsPreviewsCreationTask();

  @override
  String get name => 'Nutrition Facts Previews Creation';

  @override
  String localName(AppLocalizations l10n) =>
      l10n.maintenanceTaskNutritionFactsPreviewsCreationTitle;

  @override
  FutureOr<bool> shouldRun(Ref ref) async {
    try {
      return await ref
          .read(edibleRepositoryProvider.notifier)
          .isMissingNutritionFactsPreviews();
    } catch (error, stackTrace) {
      _log.severe(
        'Maintenance task failed: $name',
        error,
        stackTrace,
      );

      throw LocalizedException(
        (l10n) =>
            l10n.maintenanceTaskNutritionFactsPreviewsCreationFailedMessage,
      );
    }
  }

  @override
  FutureOr<void> run(Ref ref) async {
    final edibleRepo = ref.read(edibleRepositoryProvider.notifier);
    final foodRepo = ref.read(foodRepositoryProvider.notifier);
    final dishRepo = ref.read(dishRepositoryProvider.notifier);

    try {
      final results =
          await edibleRepo.findEdiblesWithoutNutritionFactsPreviews();
      for (final result in results) {
        switch (result.type) {
          case EdiblePreviewType.food:
            final food = await foodRepo.getById(result.id);
            if (food != null) {
              await foodRepo.save(food, skipAudit: true);
            }
            break;
          case EdiblePreviewType.dish:
            final dish = await dishRepo.getById(result.id);
            if (dish != null) {
              await dishRepo.save(dish, skipAudit: true);
            }
            break;
          default:
        }
      }
    } catch (error, stackTrace) {
      _log.severe(
        'Maintenance task failed: $name',
        error,
        stackTrace,
      );

      throw LocalizedException(
        (l10n) =>
            l10n.maintenanceTaskNutritionFactsPreviewsCreationFailedMessage,
      );
    }
  }
}
