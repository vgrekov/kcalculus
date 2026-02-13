import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/dish_repository.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/food_repository.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/firestore/food_container/repositories/food_container_repository.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/repositories/import_repository.dart';
import 'package:kcalculus/data/storage/firestore/user_data/repositories/app_settings_repository.dart';
import 'package:kcalculus/data/storage/firestore/user_data/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/data/storage/firestore/user_data/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/data/storage/local/app_settings/repositories/app_settings_repository.dart';
import 'package:kcalculus/data/storage/local/default_nutrient/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/data/storage/local/dish/repositories/dish_repository.dart';
import 'package:kcalculus/data/storage/local/edible/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/local/food/repositories/food_repository.dart';
import 'package:kcalculus/data/storage/local/food_container/repositories/food_container_repository.dart';
import 'package:kcalculus/data/storage/local/meal/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/domain/import/models/import_process.dart';
import 'package:kcalculus/domain/import/models/import_progress.dart';
import 'package:kcalculus/domain/import/models/import_record.dart';
import 'package:kcalculus/domain/import/models/import_report.dart';
import 'package:kcalculus/domain/import/use_cases/import_race_orchestrator.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('ImportUseCase');

class ImportUseCase extends AsyncNotifier<ImportProcess> {
  static const _kImportBatchSize = 100; // TODO: make configurable

  @override
  FutureOr<ImportProcess> build() {
    ref.watch(importRaceOrchestratorProvider);

    return ref.watch(
      firestoreImportRepositoryProvider.selectAsync((data) => data),
    );
  }

  FirestoreImportRepository get _importRepo =>
      ref.read(firestoreImportRepositoryProvider.notifier);

  Future<ImportRecord?> provisionImport() => _importRepo.provisionImport();

  Future<void> saveImport(ImportRecord model) => _importRepo.saveImport(model);

  Future<ImportReport> runImport() async {
    await _purgeFirestore();

    final (foods, dishes) = await _importEdibles();

    _log.info('Imported foods: $foods');
    _log.info('Imported dishes: $dishes');

    final meals = await _importMeals();

    _log.info('Imported meals: $meals');

    final containers = await _importContainers();

    _log.info('Imported food containers: $containers');

    final nutrientGoals = await _importNutrientGoals();

    _log.info('Imported nutrient goals: $nutrientGoals');

    final defaultNutrients = await _importDefaultNutrients();

    _log.info('Imported default nutrients: $defaultNutrients');

    final settings = await _importSettings();

    _log.info('Imported settings: $settings');

    return ImportReport(
      foods: foods,
      dishes: dishes,
      meals: meals,
      containers: containers,
      nutrientGoals: nutrientGoals,
      defaultNutrients: defaultNutrients,
      settings: settings,
    );
  }

  Future<void> _purgeFirestore() async {
    // containers
    await ref
        .read(
          firestoreFoodContainerRepositoryProvider.notifier,
        )
        .purge();

    _log.info('Purged food containers');

    // nutrient goals
    await ref
        .read(
          firestoreNutrientGoalRepositoryProvider.notifier,
        )
        .purge();

    _log.info('Purged nutrient goals');

    // meals
    await ref
        .read(
          firestoreMealRepositoryProvider.notifier,
        )
        .purge();

    _log.info('Purged meals');

    // edibles
    await ref
        .read(
          firestoreEdibleRepositoryProvider.notifier,
        )
        .purge();

    _log.info('Purged edibles');
  }

  Future<(ImportProgress, ImportProgress)> _importEdibles() async {
    int foodsImported = 0;
    int dishesImported = 0;

    final localEdibleRepo = ref.read(
      localEdibleRepositoryProvider.notifier,
    );
    final localFoodRepo = ref.read(
      localFoodRepositoryProvider.notifier,
    );
    final localDishRepo = ref.read(
      localDishRepositoryProvider.notifier,
    );

    final firestoreFoodRepo = ref.read(
      firestoreFoodRepositoryProvider.notifier,
    );
    final firestoreDishRepo = ref.read(
      firestoreDishRepositoryProvider.notifier,
    );

    final pages = _paginate<EdiblePreview>(
      (pageConfig) => localEdibleRepo.getAll(
        includeDeleted: true,
        pageConfig: pageConfig,
      ),
      pageSize: _kImportBatchSize,
    );

    await for (final page in pages) {
      for (final preview in page) {
        switch (preview.type) {
          case EdiblePreviewType.food:
            final food = await localFoodRepo.getById(preview.id);
            await firestoreFoodRepo.import(food!);
            foodsImported++;
            break;

          case EdiblePreviewType.dish:
            final dish = await localDishRepo.getById(preview.id);
            await firestoreDishRepo.import(dish!);
            dishesImported++;
            break;

          default:
        }
      }
    }

    return (
      ImportProgress(
        imported: foodsImported,
        total: foodsImported,
      ),
      ImportProgress(
        imported: dishesImported,
        total: dishesImported,
      ),
    );
  }

  Future<ImportProgress> _importMeals() async {
    int mealsImported = 0;

    final localMealRepo = ref.read(
      localMealRepositoryProvider.notifier,
    );

    final firestoreMealRepo = ref.read(
      firestoreMealRepositoryProvider.notifier,
    );

    final pages = _paginate<Meal>(
      (pageConfig) => localMealRepo.getAll(
        includeDeleted: true,
        pageConfig: pageConfig,
      ),
      pageSize: _kImportBatchSize,
    );

    await for (final page in pages) {
      for (final meal in page) {
        await firestoreMealRepo.import(meal);
        mealsImported++;
      }
    }

    return ImportProgress(
      imported: mealsImported,
      total: mealsImported,
    );
  }

  Future<ImportProgress> _importContainers() async {
    int containersImported = 0;

    final localFoodContainerRepo = ref.read(
      localFoodContainerRepositoryProvider.notifier,
    );

    final firestoreFoodContainerRepo = ref.read(
      firestoreFoodContainerRepositoryProvider.notifier,
    );

    final pages = _paginate<FoodContainer>(
      (pageConfig) => localFoodContainerRepo.getAll(
        includeDeleted: true,
        pageConfig: pageConfig,
      ),
      pageSize: _kImportBatchSize,
    );

    await for (final page in pages) {
      for (final meal in page) {
        await firestoreFoodContainerRepo.import(meal);
        containersImported++;
      }
    }

    return ImportProgress(
      imported: containersImported,
      total: containersImported,
    );
  }

  Future<ImportProgress> _importNutrientGoals() async {
    int nutrientGoalsImported = 0;

    final localNutrientGoalRepo = ref.read(
      localNutrientGoalRepositoryProvider.notifier,
    );

    final firestoreNutrientGoalRepo = ref.read(
      firestoreNutrientGoalRepositoryProvider.notifier,
    );

    final pages = _paginate<NutrientGoal>(
      (pageConfig) => localNutrientGoalRepo.getAll(
        includeDeleted: true,
        pageConfig: pageConfig,
      ),
      pageSize: _kImportBatchSize,
    );

    await for (final page in pages) {
      for (final meal in page) {
        await firestoreNutrientGoalRepo.import(meal);
        nutrientGoalsImported++;
      }
    }

    return ImportProgress(
      imported: nutrientGoalsImported,
      total: nutrientGoalsImported,
    );
  }

  Future<ImportProgress> _importDefaultNutrients() async {
    final firestoreDefaultNutrientRepo = ref.read(
      firestoreDefaultNutrientRepositoryProvider.notifier,
    );

    final nutrients = await ref.read(
      localDefaultNutrientRepositoryProvider.future,
    );

    await firestoreDefaultNutrientRepo.saveAll(nutrients);

    final progress = ImportProgress(
      imported: nutrients.length,
      total: nutrients.length,
    );

    return progress;
  }

  Future<ImportProgress> _importSettings() async {
    final firestoreAppSettingsRepo = ref.read(
      firestoreAppSettingsRepositoryProvider.notifier,
    );

    final settings = await ref.read(
      localAppSettingsRepositoryProvider.future,
    );

    await firestoreAppSettingsRepo.saveSettings(settings);

    return ImportProgress(
      imported: 1,
      total: 1,
    );
  }

  Stream<List<T>> _paginate<T>(
    Future<List<T>> Function(PageConfig<T> pageConfig) provider, {
    required int pageSize,
  }) async* {
    var offset = 0;
    List<T> page;

    do {
      page = await provider(
        PageConfig<T>(
          size: pageSize,
          offset: offset,
        ),
      );

      yield page;

      offset += pageSize;
    } while (page.isNotEmpty);
  }
}

final importUseCaseProvider =
    AsyncNotifierProvider<ImportUseCase, ImportProcess>(
      ImportUseCase.new,
    );
