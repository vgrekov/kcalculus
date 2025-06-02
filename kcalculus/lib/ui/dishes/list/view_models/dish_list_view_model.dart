import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/ui/common/view_models/edible_search_helper.dart';
import 'package:kcalculus/ui/common/view_models/search/search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('DishListViewModel');

enum DishListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class DishListViewModel extends Notifier<SearchUiState<EdibleSearchResult>> {
  static const _kPageSize = 10;

  UiCommander<DishListCommand>? _commander;

  late final EdibleSearchHelper searchHelper = EdibleSearchHelper(
    searchResultType: EdibleSearchResultType.dish,
    pageSize: _kPageSize,
    getRef: () => ref,
    getState: () => state,
    setState: (value) => state = value,
  );

  @override
  SearchUiState<EdibleSearchResult> build() {
    ref.watch(dishRepositoryProvider);

    ref.watch(dishChangesProvider);

    _commander = UiCommander<DishListCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    String query = stateOrNull?.searchQuery ?? '';

    return searchHelper.initState(query);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> deleteDish(String id) async {
    _log.finer('deleteDish() START');

    try {
      _log.finest('deleteDish() Deleting dish with ID: $id');

      final deleted = await ref.read(dishRepositoryProvider).delete(id);

      _log.info('Dish deleted: $deleted');
      _log.eventDishDelete();

      if (deleted) {
        _commander!.send<String, void>(
          DishListCommand.showDeletionSuccessNotification,
          payload: id,
        );
      } else {
        _commander!.send(DishListCommand.showDeletionFailureNotification);
      }
    } catch (error, stackTrace) {
      _log.severe('Failed to delete dish', error, stackTrace);

      _commander!.send(DishListCommand.showUnknownErrorNotification);
    }

    _log.finer('deleteDish() END');
  }

  Future<void> restoreDish(String id) async {
    _log.finer('restoreDish() START');

    try {
      _log.finest('restoreDish() Restoring dish with ID: $id');

      final restored = await ref.read(dishRepositoryProvider).restore(id);

      _log.info('Dish restored: $restored');
      _log.eventDishRestore();
    } catch (error, stackTrace) {
      _log.severe('Failed to restore dish', error, stackTrace);

      _commander!.send(DishListCommand.showUnknownErrorNotification);
    }

    _log.finer('restoreDish() END');
  }

  Future<List<Nutrient>> getNutrientDefaults() {
    return ref.read(nutrientRepositoryProvider).getDefaults();
  }
}

final dishListViewModel =
    NotifierProvider<DishListViewModel, SearchUiState<EdibleSearchResult>>(
  () => DishListViewModel(),
);
