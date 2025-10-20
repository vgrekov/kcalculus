import 'dart:async';

import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/ui/common/view_models/paginator_view_model.dart';
import 'package:kcalculus/ui/common/view_models/search_controller.dart';

mixin SearchViewModel<Model> on PaginatorViewModel<Model> {
  late final searchController = SearchController(_search);

  String getQuery();

  void updateState({
    String? query,
    FutureOr<List<Model>>? data,
  });

  @override
  void setData(FutureOr<List<Model>>? data) {
    updateState(data: data);
  }

  Future<List<Model>> search(
    String query, {
    PageConfig<Model>? pageConfig,
  });

  @override
  Future<List<Model>> loadPage([PageConfig<Model>? pageConfig]) => search(
        getQuery(),
        pageConfig: pageConfig,
      );

  void _search(String query) {
    updateState(
      query: query,
      data: search(query, pageConfig: firstPageConfig()),
    );
  }
}
