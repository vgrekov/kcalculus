import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';

part 'edible_search_ui_state.freezed.dart';

@freezed
sealed class EdibleSearchUiState with _$EdibleSearchUiState {
  const factory EdibleSearchUiState({
    required String query,
    required FutureOr<List<EdiblePreview>> data,
  }) = _EdibleSearchUiState;
}
