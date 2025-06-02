// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_amount_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutrientAmountUiState {
  Nutrient get nutrient => throw _privateConstructorUsedError;
  Unit get unit => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientAmountUiStateCopyWith<NutrientAmountUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientAmountUiStateCopyWith<$Res> {
  factory $NutrientAmountUiStateCopyWith(NutrientAmountUiState value,
          $Res Function(NutrientAmountUiState) then) =
      _$NutrientAmountUiStateCopyWithImpl<$Res, NutrientAmountUiState>;
  @useResult
  $Res call({Nutrient nutrient, Unit unit, double? value});
}

/// @nodoc
class _$NutrientAmountUiStateCopyWithImpl<$Res,
        $Val extends NutrientAmountUiState>
    implements $NutrientAmountUiStateCopyWith<$Res> {
  _$NutrientAmountUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrient = null,
    Object? unit = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutrientAmountUiStateImplCopyWith<$Res>
    implements $NutrientAmountUiStateCopyWith<$Res> {
  factory _$$NutrientAmountUiStateImplCopyWith(
          _$NutrientAmountUiStateImpl value,
          $Res Function(_$NutrientAmountUiStateImpl) then) =
      __$$NutrientAmountUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Nutrient nutrient, Unit unit, double? value});
}

/// @nodoc
class __$$NutrientAmountUiStateImplCopyWithImpl<$Res>
    extends _$NutrientAmountUiStateCopyWithImpl<$Res,
        _$NutrientAmountUiStateImpl>
    implements _$$NutrientAmountUiStateImplCopyWith<$Res> {
  __$$NutrientAmountUiStateImplCopyWithImpl(_$NutrientAmountUiStateImpl _value,
      $Res Function(_$NutrientAmountUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrient = null,
    Object? unit = null,
    Object? value = freezed,
  }) {
    return _then(_$NutrientAmountUiStateImpl(
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$NutrientAmountUiStateImpl extends _NutrientAmountUiState {
  const _$NutrientAmountUiStateImpl(
      {required this.nutrient, required this.unit, this.value})
      : super._();

  @override
  final Nutrient nutrient;
  @override
  final Unit unit;
  @override
  final double? value;

  @override
  String toString() {
    return 'NutrientAmountUiState._default(nutrient: $nutrient, unit: $unit, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientAmountUiStateImpl &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nutrient, unit, value);

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientAmountUiStateImplCopyWith<_$NutrientAmountUiStateImpl>
      get copyWith => __$$NutrientAmountUiStateImplCopyWithImpl<
          _$NutrientAmountUiStateImpl>(this, _$identity);
}

abstract class _NutrientAmountUiState extends NutrientAmountUiState {
  const factory _NutrientAmountUiState(
      {required final Nutrient nutrient,
      required final Unit unit,
      final double? value}) = _$NutrientAmountUiStateImpl;
  const _NutrientAmountUiState._() : super._();

  @override
  Nutrient get nutrient;
  @override
  Unit get unit;
  @override
  double? get value;

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientAmountUiStateImplCopyWith<_$NutrientAmountUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
