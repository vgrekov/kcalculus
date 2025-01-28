import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/search_debouncer.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/edibles/search/view_models/edible_search_ui_state.dart';

enum EdibleSearchCommand {
  showUnknownErrorNotification,
  exit,
}

class EdibleSearchViewModel extends Notifier<EdibleSearchUiState>
    with UiCommander<EdibleSearchCommand> {
  late final SearchDebouncer _searchDebouncer = SearchDebouncer(_search);

  @override
  EdibleSearchUiState build() {
    ref.onDispose(() {
      _searchDebouncer.dispose();
    });

    return _doSearch('');
  }

  void resetSearch() {
    _searchDebouncer.reset();
  }

  void setSearchQuery(String query) {
    _searchDebouncer.setQuery(query);
  }

  void updateSearchQuery(String query) {
    _searchDebouncer.updateQuery(query);
  }

  Future<void> selectEdible(EdibleSearchResult searchResult) async {
    try {
      Edible? edible;
      switch (searchResult.type) {
        case EdibleSearchResultType.dish:
          final dishRepository = ref.read(dishRepositoryProvider);
          edible = await dishRepository.getById(searchResult.id);
          break;
        default:
          final foodRepository = ref.read(foodRepositoryProvider);
          edible = await foodRepository.getById(searchResult.id);
      }

      if (edible != null) {
        sendCommand<Edible, void>(
          EdibleSearchCommand.exit,
          payload: edible,
        );
      } else {
        sendCommand(EdibleSearchCommand.exit);
      }
    } catch (error) {
      print(error);
      sendCommand(EdibleSearchCommand.showUnknownErrorNotification);
    }
  }

  void _search(String query) {
    state = _doSearch(query);
  }

  EdibleSearchUiState _doSearch(String query) {
    return EdibleSearchUiState(
      searchQuery: query,
      searchResults: ref.read(edibleRepositoryProvider).search(query),
    );
  }
}

final edibleSearchViewModel =
    NotifierProvider<EdibleSearchViewModel, EdibleSearchUiState>(
  () => EdibleSearchViewModel(),
);
