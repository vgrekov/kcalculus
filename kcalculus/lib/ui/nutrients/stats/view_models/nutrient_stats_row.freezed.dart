// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_stats_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientStatsRow {
  Nutrient get nutrient;
  Amount get amount;
  int get level;
  Amount? get goalAmount;

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutrientStatsRowCopyWith<NutrientStatsRow> get copyWith =>
      _$NutrientStatsRowCopyWithImpl<NutrientStatsRow>(
          this as NutrientStatsRow, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutrientStatsRow &&
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

  @override
  String toString() {
    return 'NutrientStatsRow(nutrient: $nutrient, amount: $amount, level: $level, goalAmount: $goalAmount)';
  }
}

/// @nodoc
abstract mixin class $NutrientStatsRowCopyWith<$Res> {
  factory $NutrientStatsRowCopyWith(
          NutrientStatsRow value, $Res Function(NutrientStatsRow) _then) =
      _$NutrientStatsRowCopyWithImpl;
  @useResult
  $Res call({Nutrient nutrient, Amount amount, int level, Amount? goalAmount});

  $AmountCopyWith<$Res> get amount;
  $AmountCopyWith<$Res>? get goalAmount;
}

/// @nodoc
class _$NutrientStatsRowCopyWithImpl<$Res>
    implements $NutrientStatsRowCopyWith<$Res> {
  _$NutrientStatsRowCopyWithImpl(this._self, this._then);

  final NutrientStatsRow _self;
  final $Res Function(NutrientStatsRow) _then;

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
    return _then(_self.copyWith(
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      goalAmount: freezed == goalAmount
          ? _self.goalAmount
          : goalAmount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get goalAmount {
    if (_self.goalAmount == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.goalAmount!, (value) {
      return _then(_self.copyWith(goalAmount: value));
    });
  }
}

/// @nodoc

class _NutrientStatsRow implements NutrientStatsRow {
  const _NutrientStatsRow(
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

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutrientStatsRowCopyWith<_NutrientStatsRow> get copyWith =>
      __$NutrientStatsRowCopyWithImpl<_NutrientStatsRow>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutrientStatsRow &&
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

  @override
  String toString() {
    return 'NutrientStatsRow(nutrient: $nutrient, amount: $amount, level: $level, goalAmount: $goalAmount)';
  }
}

/// @nodoc
abstract mixin class _$NutrientStatsRowCopyWith<$Res>
    implements $NutrientStatsRowCopyWith<$Res> {
  factory _$NutrientStatsRowCopyWith(
          _NutrientStatsRow value, $Res Function(_NutrientStatsRow) _then) =
      __$NutrientStatsRowCopyWithImpl;
  @override
  @useResult
  $Res call({Nutrient nutrient, Amount amount, int level, Amount? goalAmount});

  @override
  $AmountCopyWith<$Res> get amount;
  @override
  $AmountCopyWith<$Res>? get goalAmount;
}

/// @nodoc
class __$NutrientStatsRowCopyWithImpl<$Res>
    implements _$NutrientStatsRowCopyWith<$Res> {
  __$NutrientStatsRowCopyWithImpl(this._self, this._then);

  final _NutrientStatsRow _self;
  final $Res Function(_NutrientStatsRow) _then;

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nutrient = null,
    Object? amount = null,
    Object? level = null,
    Object? goalAmount = freezed,
  }) {
    return _then(_NutrientStatsRow(
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      goalAmount: freezed == goalAmount
          ? _self.goalAmount
          : goalAmount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }

  /// Create a copy of NutrientStatsRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get goalAmount {
    if (_self.goalAmount == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.goalAmount!, (value) {
      return _then(_self.copyWith(goalAmount: value));
    });
  }
}

// dart format on
