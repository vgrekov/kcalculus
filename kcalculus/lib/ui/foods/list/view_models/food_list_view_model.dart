import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/search_debouncer.dart';
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
  late final _searchDebouncer = SearchDebouncer(_search);

  UiCommander<FoodListCommand>? _commander;

  @override
  FoodListUiState build() {
    ref.watch(foodChangesProvider);

    _commander = UiCommander<FoodListCommand>(_commander);

    ref.onDispose(() {
      _searchDebouncer.dispose();
      _commander?.dispose();
    });

    return _doSearch(stateOrNull?.searchQuery ?? '');
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void resetSearch() {
    _searchDebouncer.reset();
  }

  void setSearchQuery(String query) {
    _searchDebouncer.setQuery(query);
  }

  void updateSearchQuery(String query) {
    _searchDebouncer.updateQuery(query);
  }

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
    state = _doSearch(query);
  }

  FoodListUiState _doSearch(String query) {
    return FoodListUiState(
      searchQuery: query,
      searchResults: ref.read(edibleRepositoryProvider).search(
            query,
            type: EdibleSearchResultType.food,
          ),
    );
  }
}

final foodListViewModel = NotifierProvider<FoodListViewModel, FoodListUiState>(
  () => FoodListViewModel(),
);
