import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/ui/common/view_models/search/search_helper.dart';
import 'package:kcalculus/ui/common/view_models/search/search_ui_state.dart';
import 'package:kcalculus/ui/food_containers/common/view_models/food_container_search_helper.dart';

class FoodContainerSearchViewModel
    extends AutoDisposeFamilyNotifier<SearchUiState<FoodContainer>, String> {
  static const _kPageSize = 25;

  late final SearchHelper<FoodContainer> searchHelper =
      FoodContainerSearchHelper(
    pageSize: _kPageSize,
    getRef: () => ref,
    getState: () => state,
    setState: (value) => state = value,
  );

  @override
  SearchUiState<FoodContainer> build(String arg) {
    return searchHelper.initState(arg);
  }
}

final foodContainerSearchViewModel = NotifierProvider.autoDispose
    .family<FoodContainerSearchViewModel, SearchUiState<FoodContainer>, String>(
  () => FoodContainerSearchViewModel(),
);
