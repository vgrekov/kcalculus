import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'settings_ui_state.freezed.dart';

@freezed
class SettingsUiState with _$SettingsUiState {
  const factory SettingsUiState({
    required AppSettings settings,
    PackageInfo? packageInfo,
  }) = _SettingsUiState;
}
