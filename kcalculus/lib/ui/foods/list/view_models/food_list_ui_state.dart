import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';

part 'food_list_ui_state.freezed.dart';

@freezed
class FoodListUiState with _$FoodListUiState {
  const factory FoodListUiState({
    required String searchQuery,
    required Future<List<EdibleSearchResult>> dataLoader,
    @Default([]) List<EdibleSearchResult> data,
  }) = _FoodListUiState;
}
