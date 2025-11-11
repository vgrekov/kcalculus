import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/view_models/paginator_view_model.dart';
import 'package:kcalculus/ui/common/view_models/search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/search_view_model.dart';
import 'package:kcalculus/ui/nutrients/search/view_models/nutrient_search_view_model_arg.dart';
import 'package:kcalculus/ui/providers.dart';

class NutrientSearchViewModel extends AutoDisposeFamilyNotifier<
        SearchUiState<Nutrient>, NutrientSearchViewModelArg>
    with PaginatorViewModel<Nutrient>, SearchViewModel<Nutrient> {
  late List<Nutrient> initialData;

  @override
  SearchUiState<Nutrient> build(NutrientSearchViewModelArg arg) {
    ref.onDispose(() {
      searchController.dispose();
    });

    initialData = Nutrient.values
        .where(
          (n) => !arg.exceptions.contains(n),
        )
        .toList();

    return SearchUiState<Nutrient>(
      query: arg.intialQuery,
      data: search(
        arg.intialQuery,
      ),
    );
  }

  @override
  int get pageSize => initialData.length;

  @override
  String getQuery() => state.query;

  @override
  FutureOr<List<Nutrient>> getData() => state.data;

  @override
  void updateState({
    String? query,
    FutureOr<List<Nutrient>>? data,
  }) {
    state = state.copyWith(
      query: query ?? state.query,
      data: data ?? state.data,
    );
  }

  @override
  Future<List<Nutrient>> search(
    String query, {
    PageConfig<Nutrient>? pageConfig,
  }) async {
    final l10n = ref.read(l10nProvider);

    return initialData
        .where(
          (n) => n.localName(l10n).toUpperCase().contains(query.toUpperCase()),
        )
        .toList();
  }
}

final nutrientSearchViewModel = NotifierProvider.autoDispose.family<
    NutrientSearchViewModel,
    SearchUiState<Nutrient>,
    NutrientSearchViewModelArg>(
  () => NutrientSearchViewModel(),
);
