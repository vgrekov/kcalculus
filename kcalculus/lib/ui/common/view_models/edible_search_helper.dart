import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/domain/edible/use_cases/edible_use_case.dart';
import 'package:kcalculus/ui/common/view_models/search/search_helper.dart';

class EdibleSearchHelper extends SearchHelper<EdiblePreview> {
  EdibleSearchHelper({
    required super.pageSize,
    required super.getRef,
    required super.getState,
    required super.setState,
  });

  @override
  Future<List<EdiblePreview>> loadData(
    String query, {
    PageConfig<EdiblePreview>? pageConfig,
  }) {
    return getRef().read(edibleUseCaseProvider.notifier).search(
          query,
          pageConfig: pageConfig,
        );
  }
}
