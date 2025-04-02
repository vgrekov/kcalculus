// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_save_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MealSaveUiState {
  String? get id => throw _privateConstructorUsedError;
  DateTime get eatenAt => throw _privateConstructorUsedError;
  Portion? get portion => throw _privateConstructorUsedError;

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealSaveUiStateCopyWith<MealSaveUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealSaveUiStateCopyWith<$Res> {
  factory $MealSaveUiStateCopyWith(
          MealSaveUiState value, $Res Function(MealSaveUiState) then) =
      _$MealSaveUiStateCopyWithImpl<$Res, MealSaveUiState>;
  @useResult
  $Res call({String? id, DateTime eatenAt, Portion? portion});
}

/// @nodoc
class _$MealSaveUiStateCopyWithImpl<$Res, $Val extends MealSaveUiState>
    implements $MealSaveUiStateCopyWith<$Res> {
  _$MealSaveUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eatenAt = null,
    Object? portion = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      eatenAt: null == eatenAt
          ? _value.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as Portion?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealSaveUiStateImplCopyWith<$Res>
    implements $MealSaveUiStateCopyWith<$Res> {
  factory _$$MealSaveUiStateImplCopyWith(_$MealSaveUiStateImpl value,
          $Res Function(_$MealSaveUiStateImpl) then) =
      __$$MealSaveUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, DateTime eatenAt, Portion? portion});
}

/// @nodoc
class __$$MealSaveUiStateImplCopyWithImpl<$Res>
    extends _$MealSaveUiStateCopyWithImpl<$Res, _$MealSaveUiStateImpl>
    implements _$$MealSaveUiStateImplCopyWith<$Res> {
  __$$MealSaveUiStateImplCopyWithImpl(
      _$MealSaveUiStateImpl _value, $Res Function(_$MealSaveUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eatenAt = null,
    Object? portion = freezed,
  }) {
    return _then(_$MealSaveUiStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      eatenAt: null == eatenAt
          ? _value.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as Portion?,
    ));
  }
}

/// @nodoc

class _$MealSaveUiStateImpl extends _MealSaveUiState {
  const _$MealSaveUiStateImpl({this.id, required this.eatenAt, this.portion})
      : super._();

  @override
  final String? id;
  @override
  final DateTime eatenAt;
  @override
  final Portion? portion;

  @override
  String toString() {
    return 'MealSaveUiState._default(id: $id, eatenAt: $eatenAt, portion: $portion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealSaveUiStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt) &&
            (identical(other.portion, portion) || other.portion == portion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, eatenAt, portion);

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealSaveUiStateImplCopyWith<_$MealSaveUiStateImpl> get copyWith =>
      __$$MealSaveUiStateImplCopyWithImpl<_$MealSaveUiStateImpl>(
          this, _$identity);
}

abstract class _MealSaveUiState extends MealSaveUiState {
  const factory _MealSaveUiState(
      {final String? id,
      required final DateTime eatenAt,
      final Portion? portion}) = _$MealSaveUiStateImpl;
  const _MealSaveUiState._() : super._();

  @override
  String? get id;
  @override
  DateTime get eatenAt;
  @override
  Portion? get portion;

  /// Create a copy of MealSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealSaveUiStateImplCopyWith<_$MealSaveUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
