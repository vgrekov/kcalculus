import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';

part 'app_ui_state.freezed.dart';

enum AppStage {
  agreement,
  dataSharingConsent,
  maintenance,
  authentication,
  import,
  operation,
}

@freezed
sealed class AppUiState with _$AppUiState {
  const factory AppUiState({
    required AppTheme theme,
    required AppStage stage,
  }) = _AppUiState;
}
