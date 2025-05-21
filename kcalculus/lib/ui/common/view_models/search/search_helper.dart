import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/view_models/paginator.dart';
import 'package:kcalculus/ui/common/view_models/search/search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/search_controller.dart';

abstract class SearchHelper<Model> {
  SearchHelper({
    required int pageSize,
    required this.getRef,
    required SearchUiState<Model> Function() getState,
    required void Function(SearchUiState<Model>) setState,
  })  : _pageSize = pageSize,
        _getState = getState,
        _setState = setState;

  final int _pageSize;

  final Ref Function() getRef;

  final SearchUiState<Model> Function() _getState;

  final void Function(SearchUiState<Model>) _setState;

  late final paginator = Paginator<Model>(
    currentData: () => _getState().data,
    loadPage: (offset) => loadData(
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

  SearchUiState<Model> initState(String query) {
    getRef().onDispose(() {
      searchController.dispose();
    });

    return SearchUiState<Model>(
      searchQuery: query,
      dataLoader: _doSearch(query),
    );
  }

  void _search(String query) {
    _setState(
      SearchUiState<Model>(
        searchQuery: query,
        dataLoader: _doSearch(query),
      ),
    );
  }

  Future<List<Model>> _doSearch(String query) async {
    final data = await loadData(
      query,
      limit: _pageSize,
      offset: 0,
    );

    _setState(
      _getState().copyWith(data: data),
    );

    return data;
  }

  Future<List<Model>> loadData(
    String query, {
    required int limit,
    required int offset,
  });
}
