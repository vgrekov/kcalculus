import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/paginator.dart';
import 'package:kcalculus/ui/common/view_models/search_controller.dart';
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

  UiCommander<EdibleSearchCommand>? _commander;

  @override
  EdibleSearchUiState build(String arg) {
    _commander = UiCommander<EdibleSearchCommand>(_commander);

    ref.onDispose(() {
      searchController.dispose();
      _commander?.dispose();
    });

    return EdibleSearchUiState(
      searchQuery: arg,
      dataLoader: _doSearch(arg),
    );
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

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
    state = EdibleSearchUiState(
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
          limit: limit,
          offset: offset,
        );
  }
}

final edibleSearchViewModel = NotifierProvider.autoDispose
    .family<EdibleSearchViewModel, EdibleSearchUiState, String>(
  () => EdibleSearchViewModel(),
);
