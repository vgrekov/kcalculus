import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/app_settings.dart';

part 'app_ui_state.freezed.dart';

enum AppStage {
  agreement,
  dataSharingConsent,
  maintenance,
  operation,
}

@freezed
class AppUiState with _$AppUiState {
  const factory AppUiState({
    required AppTheme theme,
    required AppStage stage,
  }) = _AppUiState;
}
