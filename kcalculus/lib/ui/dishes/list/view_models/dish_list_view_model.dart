import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/paginator.dart';
import 'package:kcalculus/ui/common/view_models/search_controller.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/dishes/list/view_models/dish_list_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('DishListViewModel');

enum DishListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class DishListViewModel extends Notifier<DishListUiState> {
  static const _kPageSize = 10;

  late final paginator = Paginator(
    currentData: () => state.data,
    loadPage: (offset) => _loadData(
      state.searchQuery,
      limit: _kPageSize,
      offset: offset,
    ),
    updateState: (data) {
      state = state.copyWith(data: data);
    },
  );

  late final searchController = SearchController(_search);

  UiCommander<DishListCommand>? _commander;

  @override
  DishListUiState build() {
    ref.watch(dishChangesProvider);

    _commander = UiCommander<DishListCommand>(_commander);

    ref.onDispose(() {
      searchController.dispose();
      _commander?.dispose();
    });

    String query = stateOrNull?.searchQuery ?? '';

    return DishListUiState(
      searchQuery: query,
      dataLoader: _doSearch(query),
    );
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> deleteDish(String id) async {
    _log.finer('deleteDish() START');

    try {
      _log.finest('deleteDish() Deleting dish with ID: $id');

      final deleted = await ref.read(dishRepositoryProvider).delete(id);

      _log.info('Dish deleted: $deleted');

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
    } catch (error, stackTrace) {
      _log.severe('Failed to restore dish', error, stackTrace);

      _commander!.send(DishListCommand.showUnknownErrorNotification);
    }

    _log.finer('restoreDish() END');
  }

  void _search(String query) {
    state = DishListUiState(
      searchQuery: query,
      dataLoader: _doSearch(query),
    );
  }

  Future<List<EdibleSearchResult>> _doSearch(String query) async {
    final data = await _loadData(
      query,
      limit: _kPageSize,
      offset: 0,
    );

    state = state.copyWith(data: data);

    return data;
  }

  Future<List<EdibleSearchResult>> _loadData(
    String query, {
    required int limit,
    required int offset,
  }) async {
    return ref.read(edibleRepositoryProvider).search(
          query,
          type: EdibleSearchResultType.dish,
          limit: limit,
          offset: offset,
        );
  }
}

final dishListViewModel = NotifierProvider<DishListViewModel, DishListUiState>(
  () => DishListViewModel(),
);
