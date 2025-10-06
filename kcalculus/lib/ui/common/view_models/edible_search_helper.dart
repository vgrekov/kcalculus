import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';
import 'package:kcalculus/domain/edible/use_cases/edible_search_use_case.dart';
import 'package:kcalculus/ui/common/view_models/search/search_helper.dart';

class EdibleSearchHelper extends SearchHelper<EdibleSearchResult> {
  EdibleSearchHelper({
    required super.pageSize,
    required super.getRef,
    required super.getState,
    required super.setState,
  });

  @override
  Future<List<EdibleSearchResult>> loadData(
    String query, {
    PageConfig<EdibleSearchResult>? pageConfig,
  }) {
    return getRef().read(edibleSearchUseCaseProvider.notifier).search(
          query,
          pageConfig: pageConfig,
        );
  }
}
