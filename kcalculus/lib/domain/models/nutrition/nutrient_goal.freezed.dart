// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientGoal {
  String? get id;
  Nutrient get nutrient;
  Amount get amount;

  /// Create a copy of NutrientGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutrientGoalCopyWith<NutrientGoal> get copyWith =>
      _$NutrientGoalCopyWithImpl<NutrientGoal>(
          this as NutrientGoal, _$identity);

  /// Serializes this NutrientGoal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutrientGoal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nutrient, amount);

  @override
  String toString() {
    return 'NutrientGoal(id: $id, nutrient: $nutrient, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class $NutrientGoalCopyWith<$Res> {
  factory $NutrientGoalCopyWith(
          NutrientGoal value, $Res Function(NutrientGoal) _then) =
      _$NutrientGoalCopyWithImpl;
  @useResult
  $Res call({String? id, Nutrient nutrient, Amount amount});

  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class _$NutrientGoalCopyWithImpl<$Res> implements $NutrientGoalCopyWith<$Res> {
  _$NutrientGoalCopyWithImpl(this._self, this._then);

  final NutrientGoal _self;
  final $Res Function(NutrientGoal) _then;

  /// Create a copy of NutrientGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nutrient = null,
    Object? amount = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }

  /// Create a copy of NutrientGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NutrientGoal implements NutrientGoal {
  const _NutrientGoal({this.id, required this.nutrient, required this.amount});
  factory _NutrientGoal.fromJson(Map<String, dynamic> json) =>
      _$NutrientGoalFromJson(json);

  @override
  final String? id;
  @override
  final Nutrient nutrient;
  @override
  final Amount amount;

  /// Create a copy of NutrientGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutrientGoalCopyWith<_NutrientGoal> get copyWith =>
      __$NutrientGoalCopyWithImpl<_NutrientGoal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutrientGoalToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutrientGoal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nutrient, amount);

  @override
  String toString() {
    return 'NutrientGoal(id: $id, nutrient: $nutrient, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class _$NutrientGoalCopyWith<$Res>
    implements $NutrientGoalCopyWith<$Res> {
  factory _$NutrientGoalCopyWith(
          _NutrientGoal value, $Res Function(_NutrientGoal) _then) =
      __$NutrientGoalCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, Nutrient nutrient, Amount amount});

  @override
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class __$NutrientGoalCopyWithImpl<$Res>
    implements _$NutrientGoalCopyWith<$Res> {
  __$NutrientGoalCopyWithImpl(this._self, this._then);

  final _NutrientGoal _self;
  final $Res Function(_NutrientGoal) _then;

  /// Create a copy of NutrientGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? nutrient = null,
    Object? amount = null,
  }) {
    return _then(_NutrientGoal(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }

  /// Create a copy of NutrientGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }
}

// dart format on
