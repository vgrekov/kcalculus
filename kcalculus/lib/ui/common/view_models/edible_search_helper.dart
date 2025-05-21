import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/search/search_helper.dart';

class EdibleSearchHelper extends SearchHelper<EdibleSearchResult> {
  EdibleSearchHelper({
    required super.pageSize,
    required super.getRef,
    required super.getState,
    required super.setState,
    EdibleSearchResultType? searchResultType,
  }) : _searchResultType = searchResultType;

  final EdibleSearchResultType? _searchResultType;

  @override
  Future<List<EdibleSearchResult>> loadData(
    String query, {
    required int limit,
    required int offset,
  }) {
    return getRef().read(edibleRepositoryProvider).search(
          query,
          type: _searchResultType,
          limit: limit,
          offset: offset,
        );
  }
}
