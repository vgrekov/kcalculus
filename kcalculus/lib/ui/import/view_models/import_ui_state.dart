import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/import/models/import_process.dart';

part 'import_ui_state.freezed.dart';

@freezed
sealed class ImportUiState with _$ImportUiState {
  const factory ImportUiState({
    required ImportProcess importProcess,
    required bool isImportRunning,
  }) = _ImportUiState;
}
