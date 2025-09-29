import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/view_models/edible_search_helper.dart';
import 'package:kcalculus/ui/common/view_models/search/search_ui_state.dart';
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

class EdibleListViewModel extends Notifier<SearchUiState<EdibleSearchResult>> {
  static const _kPageSize = 25;

  UiCommander<EdibleListCommand>? _commander;

  late final EdibleSearchHelper searchHelper = EdibleSearchHelper(
    pageSize: _kPageSize,
    getRef: () => ref,
    getState: () => state,
    setState: (value) => state = value,
  );

  @override
  SearchUiState<EdibleSearchResult> build() {
    ref.watch(foodRepositoryProvider);
    ref.watch(dishRepositoryProvider);
    ref.watch(mealRepositoryProvider);

    _commander = UiCommander<EdibleListCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    String query = stateOrNull?.searchQuery ?? '';

    return searchHelper.initState(query);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<bool> deleteEdible(EdibleSearchResult searchResult) async {
    _log.finer('deleteEdible() START');

    bool deleted = false;

    try {
      _log.finest(
        'deleteEdible() Deleting ${searchResult.type.name} with ID: ${searchResult.id}',
      );

      switch (searchResult.type) {
        case EdibleSearchResultType.food:
          deleted = await ref
              .read(foodRepositoryProvider.notifier)
              .delete(searchResult.id);

          _log.eventFoodDelete();

          break;
        case EdibleSearchResultType.dish:
          deleted = await ref
              .read(dishRepositoryProvider.notifier)
              .delete(searchResult.id);

          _log.eventDishDelete();

          break;
        default:
          break;
      }

      if (deleted) {
        _log.finest(
          'deleteEdible() Deleted ${searchResult.type.name} with ID: ${searchResult.id}',
        );

        _commander!.send<EdibleSearchResult, void>(
          EdibleListCommand.showDeletionSuccessNotification,
          payload: searchResult,
        );
      } else {
        _commander!.send(EdibleListCommand.showDeletionFailureNotification);
      }
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to delete ${searchResult.type.name}',
        error,
        stackTrace,
      );

      _commander!.send(EdibleListCommand.showUnknownErrorNotification);
    }

    _log.finer('deleteEdible() END');

    return deleted;
  }

  Future<bool> restoreEdible(EdibleSearchResult searchResult) async {
    _log.finer('restoreEdible() START');

    bool restored = false;

    try {
      _log.finest(
        'restoreEdible() Restoring ${searchResult.type.name} with ID: ${searchResult.id}',
      );

      switch (searchResult.type) {
        case EdibleSearchResultType.food:
          restored = await ref
              .read(foodRepositoryProvider.notifier)
              .restore(searchResult.id);

          _log.eventFoodRestore();

          break;
        case EdibleSearchResultType.dish:
          restored = await ref
              .read(dishRepositoryProvider.notifier)
              .restore(searchResult.id);

          _log.eventDishRestore();

          break;
        default:
          break;
      }

      if (restored) {
        _log.finest(
          'restoreEdible() Restored ${searchResult.type.name} with ID: ${searchResult.id}',
        );
      }
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to restore ${searchResult.type.name}',
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
    NotifierProvider<EdibleListViewModel, SearchUiState<EdibleSearchResult>>(
  () => EdibleListViewModel(),
);
