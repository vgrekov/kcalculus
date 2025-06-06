// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_v1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutritionFactsV1 _$NutritionFactsV1FromJson(Map<String, dynamic> json) {
  return _NutritionFactsV1.fromJson(json);
}

/// @nodoc
mixin _$NutritionFactsV1 {
  Amount get amount => throw _privateConstructorUsedError;
  NutrientDataV1 get nutrientData => throw _privateConstructorUsedError;

  /// Serializes this NutritionFactsV1 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsV1CopyWith<NutritionFactsV1> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsV1CopyWith<$Res> {
  factory $NutritionFactsV1CopyWith(
          NutritionFactsV1 value, $Res Function(NutritionFactsV1) then) =
      _$NutritionFactsV1CopyWithImpl<$Res, NutritionFactsV1>;
  @useResult
  $Res call({Amount amount, NutrientDataV1 nutrientData});

  $AmountCopyWith<$Res> get amount;
  $NutrientDataV1CopyWith<$Res> get nutrientData;
}

/// @nodoc
class _$NutritionFactsV1CopyWithImpl<$Res, $Val extends NutritionFactsV1>
    implements $NutritionFactsV1CopyWith<$Res> {
  _$NutritionFactsV1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? nutrientData = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      nutrientData: null == nutrientData
          ? _value.nutrientData
          : nutrientData // ignore: cast_nullable_to_non_nullable
              as NutrientDataV1,
    ) as $Val);
  }

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientDataV1CopyWith<$Res> get nutrientData {
    return $NutrientDataV1CopyWith<$Res>(_value.nutrientData, (value) {
      return _then(_value.copyWith(nutrientData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NutritionFactsV1ImplCopyWith<$Res>
    implements $NutritionFactsV1CopyWith<$Res> {
  factory _$$NutritionFactsV1ImplCopyWith(_$NutritionFactsV1Impl value,
          $Res Function(_$NutritionFactsV1Impl) then) =
      __$$NutritionFactsV1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Amount amount, NutrientDataV1 nutrientData});

  @override
  $AmountCopyWith<$Res> get amount;
  @override
  $NutrientDataV1CopyWith<$Res> get nutrientData;
}

/// @nodoc
class __$$NutritionFactsV1ImplCopyWithImpl<$Res>
    extends _$NutritionFactsV1CopyWithImpl<$Res, _$NutritionFactsV1Impl>
    implements _$$NutritionFactsV1ImplCopyWith<$Res> {
  __$$NutritionFactsV1ImplCopyWithImpl(_$NutritionFactsV1Impl _value,
      $Res Function(_$NutritionFactsV1Impl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? nutrientData = null,
  }) {
    return _then(_$NutritionFactsV1Impl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      nutrientData: null == nutrientData
          ? _value.nutrientData
          : nutrientData // ignore: cast_nullable_to_non_nullable
              as NutrientDataV1,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionFactsV1Impl implements _NutritionFactsV1 {
  const _$NutritionFactsV1Impl(
      {required this.amount, required this.nutrientData});

  factory _$NutritionFactsV1Impl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionFactsV1ImplFromJson(json);

  @override
  final Amount amount;
  @override
  final NutrientDataV1 nutrientData;

  @override
  String toString() {
    return 'NutritionFactsV1(amount: $amount, nutrientData: $nutrientData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsV1Impl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.nutrientData, nutrientData) ||
                other.nutrientData == nutrientData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, nutrientData);

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsV1ImplCopyWith<_$NutritionFactsV1Impl> get copyWith =>
      __$$NutritionFactsV1ImplCopyWithImpl<_$NutritionFactsV1Impl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionFactsV1ImplToJson(
      this,
    );
  }
}

abstract class _NutritionFactsV1 implements NutritionFactsV1 {
  const factory _NutritionFactsV1(
      {required final Amount amount,
      required final NutrientDataV1 nutrientData}) = _$NutritionFactsV1Impl;

  factory _NutritionFactsV1.fromJson(Map<String, dynamic> json) =
      _$NutritionFactsV1Impl.fromJson;

  @override
  Amount get amount;
  @override
  NutrientDataV1 get nutrientData;

  /// Create a copy of NutritionFactsV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsV1ImplCopyWith<_$NutritionFactsV1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
