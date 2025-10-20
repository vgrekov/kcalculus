import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/domain/edible/use_cases/edible_use_case.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/view_models/paginator_view_model.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('EdibleListViewModel');

enum EdibleListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class EdibleListViewModel extends Notifier<FutureOr<List<EdiblePreview>>>
    with PaginatorViewModel<EdiblePreview> {
  UiCommander<EdibleListCommand>? _commander;

  @override
  Future<List<EdiblePreview>> build() {
    ref.watch(foodRepositoryProvider);
    ref.watch(dishRepositoryProvider);
    ref.watch(mealRepositoryProvider);

    _commander = UiCommander<EdibleListCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return loadPage(firstPageConfig());
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  @override
  int get pageSize => 25;

  @override
  FutureOr<List<EdiblePreview>> getData() => state;

  @override
  void setData(FutureOr<List<EdiblePreview>> data) {
    state = data;
  }

  @override
  Future<List<EdiblePreview>> loadPage([
    PageConfig<EdiblePreview>? pageConfig,
  ]) {
    final edibleUseCase = ref.read(edibleUseCaseProvider.notifier);

    return edibleUseCase.getAll(pageConfig: pageConfig);
  }

  Future<bool> deleteEdible(EdiblePreview preview) async {
    _log.finer('deleteEdible() START');

    bool deleted = false;

    try {
      _log.finest(
        'deleteEdible() Deleting ${preview.type.name} with ID: ${preview.id}',
      );

      switch (preview.type) {
        case EdiblePreviewType.food:
          deleted = await ref
              .read(foodRepositoryProvider.notifier)
              .delete(preview.id);

          _log.eventFoodDelete();

          break;
        case EdiblePreviewType.dish:
          deleted = await ref
              .read(dishRepositoryProvider.notifier)
              .delete(preview.id);

          _log.eventDishDelete();

          break;
        default:
          break;
      }

      if (deleted) {
        _log.finest(
          'deleteEdible() Deleted ${preview.type.name} with ID: ${preview.id}',
        );

        _commander!.send<EdiblePreview, void>(
          EdibleListCommand.showDeletionSuccessNotification,
          payload: preview,
        );
      } else {
        _commander!.send(EdibleListCommand.showDeletionFailureNotification);
      }
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to delete ${preview.type.name}',
        error,
        stackTrace,
      );

      _commander!.send(EdibleListCommand.showUnknownErrorNotification);
    }

    _log.finer('deleteEdible() END');

    return deleted;
  }

  Future<bool> restoreEdible(EdiblePreview preview) async {
    _log.finer('restoreEdible() START');

    bool restored = false;

    try {
      _log.finest(
        'restoreEdible() Restoring ${preview.type.name} with ID: ${preview.id}',
      );

      switch (preview.type) {
        case EdiblePreviewType.food:
          restored = await ref
              .read(foodRepositoryProvider.notifier)
              .restore(preview.id);

          _log.eventFoodRestore();

          break;
        case EdiblePreviewType.dish:
          restored = await ref
              .read(dishRepositoryProvider.notifier)
              .restore(preview.id);

          _log.eventDishRestore();

          break;
        default:
          break;
      }

      if (restored) {
        _log.finest(
          'restoreEdible() Restored ${preview.type.name} with ID: ${preview.id}',
        );
      }
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to restore ${preview.type.name}',
        error,
        stackTrace,
      );

      _commander!.send(EdibleListCommand.showUnknownErrorNotification);
    }

    _log.finer('restoreEdible() END');

    return restored;
  }

  Future<List<Nutrient>> getNutrientDefaults() {
    return ref.read(defaultNutrientRepositoryProvider.future);
  }

  Future<bool> isScannerDisclaimerEnabled() async {
    final settings = await ref.read(appSettingsRepositoryProvider.future);
    return settings.scannerDisclaimerEnabled;
  }

  Future<void> disableScannerDisclaimer() async {
    final settingsRepository = ref.read(appSettingsRepositoryProvider.notifier);
    final settings = await ref.read(appSettingsRepositoryProvider.future);
    await settingsRepository.saveSettings(
      settings.copyWith(
        scannerDisclaimerEnabled: false,
      ),
    );
  }
}

final edibleListViewModel =
    NotifierProvider<EdibleListViewModel, FutureOr<List<EdiblePreview>>>(
  () => EdibleListViewModel(),
);
