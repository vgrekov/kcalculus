// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_save_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealSaveUiState {
  String? get id;
  DateTime get eatenAt;
  Portion? get portion;

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealSaveUiStateCopyWith<MealSaveUiState> get copyWith =>
      _$MealSaveUiStateCopyWithImpl<MealSaveUiState>(
          this as MealSaveUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealSaveUiState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt) &&
            (identical(other.portion, portion) || other.portion == portion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, eatenAt, portion);

  @override
  String toString() {
    return 'MealSaveUiState(id: $id, eatenAt: $eatenAt, portion: $portion)';
  }
}

/// @nodoc
abstract mixin class $MealSaveUiStateCopyWith<$Res> {
  factory $MealSaveUiStateCopyWith(
          MealSaveUiState value, $Res Function(MealSaveUiState) _then) =
      _$MealSaveUiStateCopyWithImpl;
  @useResult
  $Res call({String? id, DateTime eatenAt, Portion? portion});
}

/// @nodoc
class _$MealSaveUiStateCopyWithImpl<$Res>
    implements $MealSaveUiStateCopyWith<$Res> {
  _$MealSaveUiStateCopyWithImpl(this._self, this._then);

  final MealSaveUiState _self;
  final $Res Function(MealSaveUiState) _then;

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eatenAt = null,
    Object? portion = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      eatenAt: null == eatenAt
          ? _self.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      portion: freezed == portion
          ? _self.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as Portion?,
    ));
  }
}

/// @nodoc

class _MealSaveUiState extends MealSaveUiState {
  const _MealSaveUiState({this.id, required this.eatenAt, this.portion})
      : super._();

  @override
  final String? id;
  @override
  final DateTime eatenAt;
  @override
  final Portion? portion;

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealSaveUiStateCopyWith<_MealSaveUiState> get copyWith =>
      __$MealSaveUiStateCopyWithImpl<_MealSaveUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MealSaveUiState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt) &&
            (identical(other.portion, portion) || other.portion == portion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, eatenAt, portion);

  @override
  String toString() {
    return 'MealSaveUiState._default(id: $id, eatenAt: $eatenAt, portion: $portion)';
  }
}

/// @nodoc
abstract mixin class _$MealSaveUiStateCopyWith<$Res>
    implements $MealSaveUiStateCopyWith<$Res> {
  factory _$MealSaveUiStateCopyWith(
          _MealSaveUiState value, $Res Function(_MealSaveUiState) _then) =
      __$MealSaveUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, DateTime eatenAt, Portion? portion});
}

/// @nodoc
class __$MealSaveUiStateCopyWithImpl<$Res>
    implements _$MealSaveUiStateCopyWith<$Res> {
  __$MealSaveUiStateCopyWithImpl(this._self, this._then);

  final _MealSaveUiState _self;
  final $Res Function(_MealSaveUiState) _then;

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? eatenAt = null,
    Object? portion = freezed,
  }) {
    return _then(_MealSaveUiState(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      eatenAt: null == eatenAt
          ? _self.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      portion: freezed == portion
          ? _self.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as Portion?,
    ));
  }
}

// dart format on
