import 'dart:async';

import 'package:kcalculus/domain/_common/models/page_config.dart';

mixin PaginatorViewModel<Model> {
  int get pageSize;

  FutureOr<List<Model>> getData();

  void setData(FutureOr<List<Model>> data);

  PageConfig<Model> firstPageConfig() => PageConfig<Model>(
        size: pageSize,
        offset: 0,
      );

  Future<List<Model>> loadPage([PageConfig<Model>? pageConfig]);

  Future<List<Model>> loadNextPage() async {
    final data = await getData();

    final nextPage = await loadPage(
      PageConfig<Model>(
        size: pageSize,
        offset: data.length,
        startAfter: data.lastOrNull,
      ),
    );

    if (nextPage.isNotEmpty) {
      setData([
        ...data,
        ...nextPage,
      ]);
    }

    return nextPage;
  }

  Future<List<Model>> refresh() async {
    final firstPage = await loadPage(firstPageConfig());

    setData(firstPage);

    return firstPage;
  }
}
