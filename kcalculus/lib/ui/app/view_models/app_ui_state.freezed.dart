// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUiState {
  AppTheme get theme;
  AppStage get stage;

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppUiStateCopyWith<AppUiState> get copyWith =>
      _$AppUiStateCopyWithImpl<AppUiState>(this as AppUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppUiState &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme, stage);

  @override
  String toString() {
    return 'AppUiState(theme: $theme, stage: $stage)';
  }
}

/// @nodoc
abstract mixin class $AppUiStateCopyWith<$Res> {
  factory $AppUiStateCopyWith(
          AppUiState value, $Res Function(AppUiState) _then) =
      _$AppUiStateCopyWithImpl;
  @useResult
  $Res call({AppTheme theme, AppStage stage});
}

/// @nodoc
class _$AppUiStateCopyWithImpl<$Res> implements $AppUiStateCopyWith<$Res> {
  _$AppUiStateCopyWithImpl(this._self, this._then);

  final AppUiState _self;
  final $Res Function(AppUiState) _then;

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? stage = null,
  }) {
    return _then(_self.copyWith(
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as AppStage,
    ));
  }
}

/// @nodoc

class _AppUiState implements AppUiState {
  const _AppUiState({required this.theme, required this.stage});

  @override
  final AppTheme theme;
  @override
  final AppStage stage;

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppUiStateCopyWith<_AppUiState> get copyWith =>
      __$AppUiStateCopyWithImpl<_AppUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppUiState &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme, stage);

  @override
  String toString() {
    return 'AppUiState(theme: $theme, stage: $stage)';
  }
}

/// @nodoc
abstract mixin class _$AppUiStateCopyWith<$Res>
    implements $AppUiStateCopyWith<$Res> {
  factory _$AppUiStateCopyWith(
          _AppUiState value, $Res Function(_AppUiState) _then) =
      __$AppUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({AppTheme theme, AppStage stage});
}

/// @nodoc
class __$AppUiStateCopyWithImpl<$Res> implements _$AppUiStateCopyWith<$Res> {
  __$AppUiStateCopyWithImpl(this._self, this._then);

  final _AppUiState _self;
  final $Res Function(_AppUiState) _then;

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? theme = null,
    Object? stage = null,
  }) {
    return _then(_AppUiState(
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as AppStage,
    ));
  }
}

// dart format on
