import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';

part 'edible_search_ui_state.freezed.dart';

@freezed
class EdibleSearchUiState with _$EdibleSearchUiState {
  const factory EdibleSearchUiState({
    required String searchQuery,
    required Future<List<EdibleSearchResult>> dataLoader,
    @Default([]) List<EdibleSearchResult> data,
  }) = _EdibleSearchUiState;
}
