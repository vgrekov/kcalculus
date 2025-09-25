import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/providers.dart';
import 'package:kcalculus/domain/utils/page_config.dart';
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
    PageConfig<EdibleSearchResult>? pageConfig,
  }) {
    return getRef().read(edibleSearchUseCaseProvider).search(
          query,
          type: _searchResultType,
          limit: pageConfig?.size,
          offset: pageConfig?.offset,
        );
  }
}
