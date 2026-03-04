import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_ui_state.freezed.dart';

@freezed
sealed class SearchUiState<Model> with _$SearchUiState<Model> {
  const factory SearchUiState({
    required String query,
    required FutureOr<List<Model>> data,
  }) = _SearchUiState;
}
