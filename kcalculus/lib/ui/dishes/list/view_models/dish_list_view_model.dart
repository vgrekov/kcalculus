import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/search_debouncer.dart';
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
  late final _searchDebouncer = SearchDebouncer(_search);

  UiCommander<DishListCommand>? _commander;

  @override
  DishListUiState build() {
    ref.watch(dishChangesProvider);

    _commander = UiCommander<DishListCommand>(_commander);

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
    state = _doSearch(query);
  }

  DishListUiState _doSearch(String query) {
    return DishListUiState(
      searchQuery: query,
      searchResults: ref.read(edibleRepositoryProvider).search(
            query,
            type: EdibleSearchResultType.dish,
          ),
    );
  }
}

final dishListViewModel = NotifierProvider<DishListViewModel, DishListUiState>(
  () => DishListViewModel(),
);
