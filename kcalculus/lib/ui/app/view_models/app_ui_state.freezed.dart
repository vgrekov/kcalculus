// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppUiState {
  AppTheme get theme => throw _privateConstructorUsedError;
  AppStage get stage => throw _privateConstructorUsedError;

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUiStateCopyWith<AppUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUiStateCopyWith<$Res> {
  factory $AppUiStateCopyWith(
          AppUiState value, $Res Function(AppUiState) then) =
      _$AppUiStateCopyWithImpl<$Res, AppUiState>;
  @useResult
  $Res call({AppTheme theme, AppStage stage});
}

/// @nodoc
class _$AppUiStateCopyWithImpl<$Res, $Val extends AppUiState>
    implements $AppUiStateCopyWith<$Res> {
  _$AppUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? stage = null,
  }) {
    return _then(_value.copyWith(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as AppStage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUiStateImplCopyWith<$Res>
    implements $AppUiStateCopyWith<$Res> {
  factory _$$AppUiStateImplCopyWith(
          _$AppUiStateImpl value, $Res Function(_$AppUiStateImpl) then) =
      __$$AppUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppTheme theme, AppStage stage});
}

/// @nodoc
class __$$AppUiStateImplCopyWithImpl<$Res>
    extends _$AppUiStateCopyWithImpl<$Res, _$AppUiStateImpl>
    implements _$$AppUiStateImplCopyWith<$Res> {
  __$$AppUiStateImplCopyWithImpl(
      _$AppUiStateImpl _value, $Res Function(_$AppUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? stage = null,
  }) {
    return _then(_$AppUiStateImpl(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as AppStage,
    ));
  }
}

/// @nodoc

class _$AppUiStateImpl implements _AppUiState {
  const _$AppUiStateImpl({required this.theme, required this.stage});

  @override
  final AppTheme theme;
  @override
  final AppStage stage;

  @override
  String toString() {
    return 'AppUiState(theme: $theme, stage: $stage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUiStateImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme, stage);

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUiStateImplCopyWith<_$AppUiStateImpl> get copyWith =>
      __$$AppUiStateImplCopyWithImpl<_$AppUiStateImpl>(this, _$identity);
}

abstract class _AppUiState implements AppUiState {
  const factory _AppUiState(
      {required final AppTheme theme,
      required final AppStage stage}) = _$AppUiStateImpl;

  @override
  AppTheme get theme;
  @override
  AppStage get stage;

  /// Create a copy of AppUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUiStateImplCopyWith<_$AppUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
