// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portion_edit_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PortionEditUiState {
  Edible? get edible => throw _privateConstructorUsedError;
  Unit? get amountUnit => throw _privateConstructorUsedError;
  double? get amountValue => throw _privateConstructorUsedError;

  /// Create a copy of PortionEditUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortionEditUiStateCopyWith<PortionEditUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortionEditUiStateCopyWith<$Res> {
  factory $PortionEditUiStateCopyWith(
          PortionEditUiState value, $Res Function(PortionEditUiState) then) =
      _$PortionEditUiStateCopyWithImpl<$Res, PortionEditUiState>;
  @useResult
  $Res call({Edible? edible, Unit? amountUnit, double? amountValue});
}

/// @nodoc
class _$PortionEditUiStateCopyWithImpl<$Res, $Val extends PortionEditUiState>
    implements $PortionEditUiStateCopyWith<$Res> {
  _$PortionEditUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortionEditUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edible = freezed,
    Object? amountUnit = freezed,
    Object? amountValue = freezed,
  }) {
    return _then(_value.copyWith(
      edible: freezed == edible
          ? _value.edible
          : edible // ignore: cast_nullable_to_non_nullable
              as Edible?,
      amountUnit: freezed == amountUnit
          ? _value.amountUnit
          : amountUnit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      amountValue: freezed == amountValue
          ? _value.amountValue
          : amountValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortionEditUiStateImplCopyWith<$Res>
    implements $PortionEditUiStateCopyWith<$Res> {
  factory _$$PortionEditUiStateImplCopyWith(_$PortionEditUiStateImpl value,
          $Res Function(_$PortionEditUiStateImpl) then) =
      __$$PortionEditUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Edible? edible, Unit? amountUnit, double? amountValue});
}

/// @nodoc
class __$$PortionEditUiStateImplCopyWithImpl<$Res>
    extends _$PortionEditUiStateCopyWithImpl<$Res, _$PortionEditUiStateImpl>
    implements _$$PortionEditUiStateImplCopyWith<$Res> {
  __$$PortionEditUiStateImplCopyWithImpl(_$PortionEditUiStateImpl _value,
      $Res Function(_$PortionEditUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PortionEditUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edible = freezed,
    Object? amountUnit = freezed,
    Object? amountValue = freezed,
  }) {
    return _then(_$PortionEditUiStateImpl(
      edible: freezed == edible
          ? _value.edible
          : edible // ignore: cast_nullable_to_non_nullable
              as Edible?,
      amountUnit: freezed == amountUnit
          ? _value.amountUnit
          : amountUnit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      amountValue: freezed == amountValue
          ? _value.amountValue
          : amountValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$PortionEditUiStateImpl extends _PortionEditUiState {
  const _$PortionEditUiStateImpl(
      {this.edible, this.amountUnit, this.amountValue})
      : super._();

  @override
  final Edible? edible;
  @override
  final Unit? amountUnit;
  @override
  final double? amountValue;

  @override
  String toString() {
    return 'PortionEditUiState(edible: $edible, amountUnit: $amountUnit, amountValue: $amountValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortionEditUiStateImpl &&
            (identical(other.edible, edible) || other.edible == edible) &&
            (identical(other.amountUnit, amountUnit) ||
                other.amountUnit == amountUnit) &&
            (identical(other.amountValue, amountValue) ||
                other.amountValue == amountValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, edible, amountUnit, amountValue);

  /// Create a copy of PortionEditUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortionEditUiStateImplCopyWith<_$PortionEditUiStateImpl> get copyWith =>
      __$$PortionEditUiStateImplCopyWithImpl<_$PortionEditUiStateImpl>(
          this, _$identity);
}

abstract class _PortionEditUiState extends PortionEditUiState {
  const factory _PortionEditUiState(
      {final Edible? edible,
      final Unit? amountUnit,
      final double? amountValue}) = _$PortionEditUiStateImpl;
  const _PortionEditUiState._() : super._();

  @override
  Edible? get edible;
  @override
  Unit? get amountUnit;
  @override
  double? get amountValue;

  /// Create a copy of PortionEditUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortionEditUiStateImplCopyWith<_$PortionEditUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
