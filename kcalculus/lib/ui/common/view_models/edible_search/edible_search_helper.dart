import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/edible_search/edible_search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/paginator.dart';
import 'package:kcalculus/ui/common/view_models/search_controller.dart';

class EdibleSearchHelper {
  EdibleSearchHelper({
    EdibleSearchResultType? searchResultType,
    required int pageSize,
    required Ref<EdibleSearchUiState> Function() getRef,
    required EdibleSearchUiState Function() getState,
    required void Function(EdibleSearchUiState) setState,
  })  : _searchResultType = searchResultType,
        _pageSize = pageSize,
        _getRef = getRef,
        _getState = getState,
        _setState = setState;

  final EdibleSearchResultType? _searchResultType;

  final int _pageSize;

  final Ref Function() _getRef;

  final EdibleSearchUiState Function() _getState;

  final void Function(EdibleSearchUiState) _setState;

  late final paginator = Paginator(
    currentData: () => _getState().data,
    loadPage: (offset) => _loadData(
      _getState().searchQuery,
      limit: _pageSize,
      offset: offset,
    ),
    updateState: (data) {
      _setState(
        _getState().copyWith(data: data),
      );
    },
  );

  late final searchController = SearchController(_search);

  EdibleSearchUiState initState(String query) {
    _getRef().onDispose(() {
      searchController.dispose();
    });

    return EdibleSearchUiState(
      searchQuery: query,
      dataLoader: _doSearch(query),
    );
  }

  void _search(String query) {
    _setState(
      EdibleSearchUiState(
        searchQuery: query,
        dataLoader: _doSearch(query),
      ),
    );
  }

  Future<List<EdibleSearchResult>> _doSearch(String query) async {
    final data = await _loadData(
      query,
      limit: _pageSize,
      offset: 0,
    );

    _setState(
      _getState().copyWith(data: data),
    );

    return data;
  }

  Future<List<EdibleSearchResult>> _loadData(
    String query, {
    required int limit,
    required int offset,
  }) async {
    return _getRef().read(edibleRepositoryProvider).search(
          query,
          type: _searchResultType,
          limit: limit,
          offset: offset,
        );
  }
}
