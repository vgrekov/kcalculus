import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';

part 'dish_list_ui_state.freezed.dart';

@freezed
class DishListUiState with _$DishListUiState {
  const factory DishListUiState({
    required String searchQuery,
    required Future<List<EdibleSearchResult>> dataLoader,
    @Default([]) List<EdibleSearchResult> data,
  }) = _DishListUiState;
}
