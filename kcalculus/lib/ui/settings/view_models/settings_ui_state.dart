import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/app_info.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';
import 'package:kcalculus/domain/auth/models/user.dart';

part 'settings_ui_state.freezed.dart';

@freezed
sealed class SettingsUiState with _$SettingsUiState {
  const factory SettingsUiState({
    required AppSettings settings,
    User? user,
    AppInfo? appInfo,
  }) = _SettingsUiState;
}
