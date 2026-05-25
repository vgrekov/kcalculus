import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/data.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/ui/common/view_models/paginator_view_model.dart';
import 'package:kcalculus/ui/common/view_models/search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/search_view_model.dart';

class FoodContainerSearchViewModel
    extends AutoDisposeFamilyNotifier<SearchUiState<FoodContainer>, String>
    with PaginatorViewModel<FoodContainer>, SearchViewModel<FoodContainer> {
  @override
  SearchUiState<FoodContainer> build(String arg) {
    ref.onDispose(() {
      searchController.dispose();
    });

    return SearchUiState<FoodContainer>(
      query: arg,
      data: search(
        arg,
        pageConfig: firstPageConfig(),
      ),
    );
  }

  @override
  int get pageSize => 25;

  @override
  String getQuery() => state.query;

  @override
  FutureOr<List<FoodContainer>> getData() => state.data;

  @override
  void updateState({
    String? query,
    FutureOr<List<FoodContainer>>? data,
  }) {
    state = state.copyWith(
      query: query ?? state.query,
      data: data ?? state.data,
    );
  }

  @override
  Future<List<FoodContainer>> search(
    String query, {
    PageConfig<FoodContainer>? pageConfig,
  }) {
    final repo = ref.read(foodContainerRepositoryProvider.notifier);

    return repo.search(query, pageConfig: pageConfig);
  }
}

final foodContainerSearchViewModel = NotifierProvider.autoDispose
    .family<FoodContainerSearchViewModel, SearchUiState<FoodContainer>, String>(
  () => FoodContainerSearchViewModel(),
);
