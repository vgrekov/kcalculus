import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/paginator.dart';
import 'package:kcalculus/ui/common/view_models/search_controller.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/foods/list/view_models/food_list_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('FoodListViewModel');

enum FoodListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class FoodListViewModel extends Notifier<FoodListUiState> {
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

  UiCommander<FoodListCommand>? _commander;

  @override
  FoodListUiState build() {
    ref.watch(foodChangesProvider);

    _commander = UiCommander<FoodListCommand>(_commander);

    ref.onDispose(() {
      searchController.dispose();
      _commander?.dispose();
    });

    String query = stateOrNull?.searchQuery ?? '';

    return FoodListUiState(
      searchQuery: query,
      dataLoader: _doSearch(query),
    );
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> deleteFood(String id) async {
    _log.finer('deleteFood() START');

    try {
      _log.finest('deleteFood() Deleting food with ID: $id');

      final deleted = await ref.read(foodRepositoryProvider).delete(id);

      _log.info('Food deleted: $deleted');

      if (deleted) {
        _commander!.send<String, void>(
          FoodListCommand.showDeletionSuccessNotification,
          payload: id,
        );
      } else {
        _commander!.send(FoodListCommand.showDeletionFailureNotification);
      }
    } catch (error, stackTrace) {
      _log.severe('Failed to delete food', error, stackTrace);

      _commander!.send(FoodListCommand.showUnknownErrorNotification);
    }

    _log.finer('deleteFood() END');
  }

  Future<void> restoreFood(String id) async {
    _log.finer('restoreFood() START');

    try {
      _log.finest('restoreFood() Restoring food with ID: $id');

      final restored = await ref.read(foodRepositoryProvider).restore(id);

      _log.info('Food restored: $restored');
    } catch (error, stackTrace) {
      _log.severe('Failed to restore food', error, stackTrace);

      _commander!.send(FoodListCommand.showUnknownErrorNotification);
    }

    _log.finer('restoreFood() END');
  }

  void _search(String query) {
    state = FoodListUiState(
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
          type: EdibleSearchResultType.food,
          limit: limit,
          offset: offset,
        );
  }
}

final foodListViewModel = NotifierProvider<FoodListViewModel, FoodListUiState>(
  () => FoodListViewModel(),
);
