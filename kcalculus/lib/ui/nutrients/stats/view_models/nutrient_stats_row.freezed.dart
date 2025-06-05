// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_stats_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutrientStatsRow {
  Nutrient get nutrient => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  Amount? get goalAmount => throw _privateConstructorUsedError;

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientStatsRowCopyWith<NutrientStatsRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientStatsRowCopyWith<$Res> {
  factory $NutrientStatsRowCopyWith(
          NutrientStatsRow value, $Res Function(NutrientStatsRow) then) =
      _$NutrientStatsRowCopyWithImpl<$Res, NutrientStatsRow>;
  @useResult
  $Res call({Nutrient nutrient, Amount amount, int level, Amount? goalAmount});

  $AmountCopyWith<$Res> get amount;
  $AmountCopyWith<$Res>? get goalAmount;
}

/// @nodoc
class _$NutrientStatsRowCopyWithImpl<$Res, $Val extends NutrientStatsRow>
    implements $NutrientStatsRowCopyWith<$Res> {
  _$NutrientStatsRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrient = null,
    Object? amount = null,
    Object? level = null,
    Object? goalAmount = freezed,
  }) {
    return _then(_value.copyWith(
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      goalAmount: freezed == goalAmount
          ? _value.goalAmount
          : goalAmount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ) as $Val);
  }

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get goalAmount {
    if (_value.goalAmount == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_value.goalAmount!, (value) {
      return _then(_value.copyWith(goalAmount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NutrientStatsRowImplCopyWith<$Res>
    implements $NutrientStatsRowCopyWith<$Res> {
  factory _$$NutrientStatsRowImplCopyWith(_$NutrientStatsRowImpl value,
          $Res Function(_$NutrientStatsRowImpl) then) =
      __$$NutrientStatsRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Nutrient nutrient, Amount amount, int level, Amount? goalAmount});

  @override
  $AmountCopyWith<$Res> get amount;
  @override
  $AmountCopyWith<$Res>? get goalAmount;
}

/// @nodoc
class __$$NutrientStatsRowImplCopyWithImpl<$Res>
    extends _$NutrientStatsRowCopyWithImpl<$Res, _$NutrientStatsRowImpl>
    implements _$$NutrientStatsRowImplCopyWith<$Res> {
  __$$NutrientStatsRowImplCopyWithImpl(_$NutrientStatsRowImpl _value,
      $Res Function(_$NutrientStatsRowImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrient = null,
    Object? amount = null,
    Object? level = null,
    Object? goalAmount = freezed,
  }) {
    return _then(_$NutrientStatsRowImpl(
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      goalAmount: freezed == goalAmount
          ? _value.goalAmount
          : goalAmount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }
}

/// @nodoc

class _$NutrientStatsRowImpl implements _NutrientStatsRow {
  const _$NutrientStatsRowImpl(
      {required this.nutrient,
      required this.amount,
      this.level = 0,
      this.goalAmount});

  @override
  final Nutrient nutrient;
  @override
  final Amount amount;
  @override
  @JsonKey()
  final int level;
  @override
  final Amount? goalAmount;

  @override
  String toString() {
    return 'NutrientStatsRow(nutrient: $nutrient, amount: $amount, level: $level, goalAmount: $goalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientStatsRowImpl &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.goalAmount, goalAmount) ||
                other.goalAmount == goalAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nutrient, amount, level, goalAmount);

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientStatsRowImplCopyWith<_$NutrientStatsRowImpl> get copyWith =>
      __$$NutrientStatsRowImplCopyWithImpl<_$NutrientStatsRowImpl>(
          this, _$identity);
}

abstract class _NutrientStatsRow implements NutrientStatsRow {
  const factory _NutrientStatsRow(
      {required final Nutrient nutrient,
      required final Amount amount,
      final int level,
      final Amount? goalAmount}) = _$NutrientStatsRowImpl;

  @override
  Nutrient get nutrient;
  @override
  Amount get amount;
  @override
  int get level;
  @override
  Amount? get goalAmount;

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientStatsRowImplCopyWith<_$NutrientStatsRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
