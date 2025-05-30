// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutritionFactsUiState {
  Unit get perAmountUnit => throw _privateConstructorUsedError;
  double? get perAmountValue => throw _privateConstructorUsedError;
  List<NutrientAmountUiState> get nutrientAmounts =>
      throw _privateConstructorUsedError;

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsUiStateCopyWith<NutritionFactsUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsUiStateCopyWith<$Res> {
  factory $NutritionFactsUiStateCopyWith(NutritionFactsUiState value,
          $Res Function(NutritionFactsUiState) then) =
      _$NutritionFactsUiStateCopyWithImpl<$Res, NutritionFactsUiState>;
  @useResult
  $Res call(
      {Unit perAmountUnit,
      double? perAmountValue,
      List<NutrientAmountUiState> nutrientAmounts});
}

/// @nodoc
class _$NutritionFactsUiStateCopyWithImpl<$Res,
        $Val extends NutritionFactsUiState>
    implements $NutritionFactsUiStateCopyWith<$Res> {
  _$NutritionFactsUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perAmountUnit = null,
    Object? perAmountValue = freezed,
    Object? nutrientAmounts = null,
  }) {
    return _then(_value.copyWith(
      perAmountUnit: null == perAmountUnit
          ? _value.perAmountUnit
          : perAmountUnit // ignore: cast_nullable_to_non_nullable
              as Unit,
      perAmountValue: freezed == perAmountValue
          ? _value.perAmountValue
          : perAmountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrientAmounts: null == nutrientAmounts
          ? _value.nutrientAmounts
          : nutrientAmounts // ignore: cast_nullable_to_non_nullable
              as List<NutrientAmountUiState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionFactsUiStateImplCopyWith<$Res>
    implements $NutritionFactsUiStateCopyWith<$Res> {
  factory _$$NutritionFactsUiStateImplCopyWith(
          _$NutritionFactsUiStateImpl value,
          $Res Function(_$NutritionFactsUiStateImpl) then) =
      __$$NutritionFactsUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Unit perAmountUnit,
      double? perAmountValue,
      List<NutrientAmountUiState> nutrientAmounts});
}

/// @nodoc
class __$$NutritionFactsUiStateImplCopyWithImpl<$Res>
    extends _$NutritionFactsUiStateCopyWithImpl<$Res,
        _$NutritionFactsUiStateImpl>
    implements _$$NutritionFactsUiStateImplCopyWith<$Res> {
  __$$NutritionFactsUiStateImplCopyWithImpl(_$NutritionFactsUiStateImpl _value,
      $Res Function(_$NutritionFactsUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perAmountUnit = null,
    Object? perAmountValue = freezed,
    Object? nutrientAmounts = null,
  }) {
    return _then(_$NutritionFactsUiStateImpl(
      perAmountUnit: null == perAmountUnit
          ? _value.perAmountUnit
          : perAmountUnit // ignore: cast_nullable_to_non_nullable
              as Unit,
      perAmountValue: freezed == perAmountValue
          ? _value.perAmountValue
          : perAmountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrientAmounts: null == nutrientAmounts
          ? _value._nutrientAmounts
          : nutrientAmounts // ignore: cast_nullable_to_non_nullable
              as List<NutrientAmountUiState>,
    ));
  }
}

/// @nodoc

class _$NutritionFactsUiStateImpl extends _NutritionFactsUiState {
  const _$NutritionFactsUiStateImpl(
      {required this.perAmountUnit,
      this.perAmountValue,
      required final List<NutrientAmountUiState> nutrientAmounts})
      : _nutrientAmounts = nutrientAmounts,
        super._();

  @override
  final Unit perAmountUnit;
  @override
  final double? perAmountValue;
  final List<NutrientAmountUiState> _nutrientAmounts;
  @override
  List<NutrientAmountUiState> get nutrientAmounts {
    if (_nutrientAmounts is EqualUnmodifiableListView) return _nutrientAmounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrientAmounts);
  }

  @override
  String toString() {
    return 'NutritionFactsUiState._default(perAmountUnit: $perAmountUnit, perAmountValue: $perAmountValue, nutrientAmounts: $nutrientAmounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsUiStateImpl &&
            (identical(other.perAmountUnit, perAmountUnit) ||
                other.perAmountUnit == perAmountUnit) &&
            (identical(other.perAmountValue, perAmountValue) ||
                other.perAmountValue == perAmountValue) &&
            const DeepCollectionEquality()
                .equals(other._nutrientAmounts, _nutrientAmounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, perAmountUnit, perAmountValue,
      const DeepCollectionEquality().hash(_nutrientAmounts));

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsUiStateImplCopyWith<_$NutritionFactsUiStateImpl>
      get copyWith => __$$NutritionFactsUiStateImplCopyWithImpl<
          _$NutritionFactsUiStateImpl>(this, _$identity);
}

abstract class _NutritionFactsUiState extends NutritionFactsUiState {
  const factory _NutritionFactsUiState(
          {required final Unit perAmountUnit,
          final double? perAmountValue,
          required final List<NutrientAmountUiState> nutrientAmounts}) =
      _$NutritionFactsUiStateImpl;
  const _NutritionFactsUiState._() : super._();

  @override
  Unit get perAmountUnit;
  @override
  double? get perAmountValue;
  @override
  List<NutrientAmountUiState> get nutrientAmounts;

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsUiStateImplCopyWith<_$NutritionFactsUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
