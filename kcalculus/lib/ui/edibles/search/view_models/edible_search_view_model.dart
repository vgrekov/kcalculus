import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/search_debouncer.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/edibles/search/view_models/edible_search_ui_state.dart';

enum EdibleSearchCommand {
  showUnknownErrorNotification,
  exit,
}

class EdibleSearchViewModel
    extends AutoDisposeFamilyNotifier<EdibleSearchUiState, String> {
  late final SearchDebouncer _searchDebouncer = SearchDebouncer(_search);

  final _commander = UiCommander<EdibleSearchCommand>();

  @override
  EdibleSearchUiState build(String arg) {
    ref.onDispose(() {
      _searchDebouncer.dispose();
      _commander.dispose();
    });

    return _doSearch(arg);
  }

  StreamProvider<UiCommand> get commandProvider => _commander.provider;

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
        _commander.send<Edible, void>(
          EdibleSearchCommand.exit,
          payload: edible,
        );
      } else {
        _commander.send(EdibleSearchCommand.exit);
      }
    } catch (error) {
      print(error);
      _commander.send(EdibleSearchCommand.showUnknownErrorNotification);
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

final edibleSearchViewModel = NotifierProvider.autoDispose
    .family<EdibleSearchViewModel, EdibleSearchUiState, String>(
  () => EdibleSearchViewModel(),
);
