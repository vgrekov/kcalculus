import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/search_debouncer.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/edibles/search/view_models/edible_search_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('EdibleSearchViewModel');

enum EdibleSearchCommand {
  showUnknownErrorNotification,
  exit,
}

class EdibleSearchViewModel
    extends AutoDisposeFamilyNotifier<EdibleSearchUiState, String> {
  late final _searchDebouncer = SearchDebouncer(_search);

  UiCommander<EdibleSearchCommand>? _commander;

  @override
  EdibleSearchUiState build(String arg) {
    _commander = UiCommander<EdibleSearchCommand>(_commander);

    ref.onDispose(() {
      _searchDebouncer.dispose();
      _commander?.dispose();
    });

    return _doSearch(arg);
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

  Future<void> selectEdible(EdibleSearchResult searchResult) async {
    _log.finer('selectEdible() START');

    try {
      _log.finest(
        'selectEdible() Loading edible from search result: ${searchResult.toJson()}',
      );

      Edible? edible;
      switch (searchResult.type) {
        case EdibleSearchResultType.dish:
          _log.finer('selectEdible() Loading dish');

          final dishRepository = ref.read(dishRepositoryProvider);
          edible = await dishRepository.getById(searchResult.id);
          break;
        default:
          _log.finer('selectEdible() Loading food');

          final foodRepository = ref.read(foodRepositoryProvider);
          edible = await foodRepository.getById(searchResult.id);
      }

      if (edible != null) {
        _log.finest('selectEdible() Loaded edible: ${edible.toJson()}');

        _commander!.send<Edible, void>(
          EdibleSearchCommand.exit,
          payload: edible,
        );
      } else {
        _log.fine('selectEdible() Could not load edible');

        _commander!.send(EdibleSearchCommand.exit);
      }
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to load edible from search result',
        error,
        stackTrace,
      );

      _commander!.send(EdibleSearchCommand.showUnknownErrorNotification);
    }

    _log.finer('selectEdible() END');
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
