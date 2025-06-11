// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_v1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsV1 {
  Amount get amount;
  NutrientDataV1 get nutrientData;

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsV1CopyWith<NutritionFactsV1> get copyWith =>
      _$NutritionFactsV1CopyWithImpl<NutritionFactsV1>(
          this as NutritionFactsV1, _$identity);

  /// Serializes this NutritionFactsV1 to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFactsV1 &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.nutrientData, nutrientData) ||
                other.nutrientData == nutrientData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, nutrientData);

  @override
  String toString() {
    return 'NutritionFactsV1(amount: $amount, nutrientData: $nutrientData)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsV1CopyWith<$Res> {
  factory $NutritionFactsV1CopyWith(
          NutritionFactsV1 value, $Res Function(NutritionFactsV1) _then) =
      _$NutritionFactsV1CopyWithImpl;
  @useResult
  $Res call({Amount amount, NutrientDataV1 nutrientData});

  $AmountCopyWith<$Res> get amount;
  $NutrientDataV1CopyWith<$Res> get nutrientData;
}

/// @nodoc
class _$NutritionFactsV1CopyWithImpl<$Res>
    implements $NutritionFactsV1CopyWith<$Res> {
  _$NutritionFactsV1CopyWithImpl(this._self, this._then);

  final NutritionFactsV1 _self;
  final $Res Function(NutritionFactsV1) _then;

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? nutrientData = null,
  }) {
    return _then(_self.copyWith(
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      nutrientData: null == nutrientData
          ? _self.nutrientData
          : nutrientData // ignore: cast_nullable_to_non_nullable
              as NutrientDataV1,
    ));
  }

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientDataV1CopyWith<$Res> get nutrientData {
    return $NutrientDataV1CopyWith<$Res>(_self.nutrientData, (value) {
      return _then(_self.copyWith(nutrientData: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NutritionFactsV1 implements NutritionFactsV1 {
  const _NutritionFactsV1({required this.amount, required this.nutrientData});
  factory _NutritionFactsV1.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsV1FromJson(json);

  @override
  final Amount amount;
  @override
  final NutrientDataV1 nutrientData;

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsV1CopyWith<_NutritionFactsV1> get copyWith =>
      __$NutritionFactsV1CopyWithImpl<_NutritionFactsV1>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionFactsV1ToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFactsV1 &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.nutrientData, nutrientData) ||
                other.nutrientData == nutrientData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, nutrientData);

  @override
  String toString() {
    return 'NutritionFactsV1(amount: $amount, nutrientData: $nutrientData)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsV1CopyWith<$Res>
    implements $NutritionFactsV1CopyWith<$Res> {
  factory _$NutritionFactsV1CopyWith(
          _NutritionFactsV1 value, $Res Function(_NutritionFactsV1) _then) =
      __$NutritionFactsV1CopyWithImpl;
  @override
  @useResult
  $Res call({Amount amount, NutrientDataV1 nutrientData});

  @override
  $AmountCopyWith<$Res> get amount;
  @override
  $NutrientDataV1CopyWith<$Res> get nutrientData;
}

/// @nodoc
class __$NutritionFactsV1CopyWithImpl<$Res>
    implements _$NutritionFactsV1CopyWith<$Res> {
  __$NutritionFactsV1CopyWithImpl(this._self, this._then);

  final _NutritionFactsV1 _self;
  final $Res Function(_NutritionFactsV1) _then;

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? amount = null,
    Object? nutrientData = null,
  }) {
    return _then(_NutritionFactsV1(
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      nutrientData: null == nutrientData
          ? _self.nutrientData
          : nutrientData // ignore: cast_nullable_to_non_nullable
              as NutrientDataV1,
    ));
  }

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientDataV1CopyWith<$Res> get nutrientData {
    return $NutrientDataV1CopyWith<$Res>(_self.nutrientData, (value) {
      return _then(_self.copyWith(nutrientData: value));
    });
  }
}

// dart format on
