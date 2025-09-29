import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/_common/repositories/dish_repository.dart';
import 'package:kcalculus/_data/storage/_common/repositories/edible_repository.dart';
import 'package:kcalculus/_data/storage/_common/repositories/food_repository.dart';
import 'package:kcalculus/domain/exceptions/localized_exception.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_task.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

class NutritionFactsPreviewsCreationTask implements MaintenanceTask {
  const NutritionFactsPreviewsCreationTask();

  @override
  String get name => 'Nutrition Facts Previews Creation';

  @override
  String localName(AppLocalizations l10n) =>
      l10n.maintenanceTaskNutritionFactsPreviewsCreationTitle;

  @override
  FutureOr<bool> shouldRun(Ref ref) => ref
      .read(edibleRepositoryProvider.notifier)
      .isMissingNutritionFactsPreviews();

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
          case EdibleSearchResultType.food:
            final food = await foodRepo.getById(result.id);
            if (food != null) {
              await foodRepo.save(food, skipAudit: true);
            }
            break;
          case EdibleSearchResultType.dish:
            final dish = await dishRepo.getById(result.id);
            if (dish != null) {
              await dishRepo.save(dish, skipAudit: true);
            }
            break;
          default:
        }
      }
    } catch (error) {
      throw LocalizedException(
        (l10n) =>
            l10n.maintenanceTaskNutritionFactsPreviewsCreationFailedMessage,
      );
    }
  }
}
