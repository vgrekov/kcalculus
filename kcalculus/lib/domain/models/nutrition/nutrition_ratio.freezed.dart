// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_ratio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutritionRatio _$NutritionRatioFromJson(Map<String, dynamic> json) {
  return _NutritionRatio.fromJson(json);
}

/// @nodoc
mixin _$NutritionRatio {
  Amount get perAmount => throw _privateConstructorUsedError;
  Amount get totalAmount => throw _privateConstructorUsedError;

  /// Serializes this NutritionRatio to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionRatioCopyWith<NutritionRatio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionRatioCopyWith<$Res> {
  factory $NutritionRatioCopyWith(
          NutritionRatio value, $Res Function(NutritionRatio) then) =
      _$NutritionRatioCopyWithImpl<$Res, NutritionRatio>;
  @useResult
  $Res call({Amount perAmount, Amount totalAmount});

  $AmountCopyWith<$Res> get perAmount;
  $AmountCopyWith<$Res> get totalAmount;
}

/// @nodoc
class _$NutritionRatioCopyWithImpl<$Res, $Val extends NutritionRatio>
    implements $NutritionRatioCopyWith<$Res> {
  _$NutritionRatioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perAmount = null,
    Object? totalAmount = null,
  }) {
    return _then(_value.copyWith(
      perAmount: null == perAmount
          ? _value.perAmount
          : perAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
    ) as $Val);
  }

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get perAmount {
    return $AmountCopyWith<$Res>(_value.perAmount, (value) {
      return _then(_value.copyWith(perAmount: value) as $Val);
    });
  }

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get totalAmount {
    return $AmountCopyWith<$Res>(_value.totalAmount, (value) {
      return _then(_value.copyWith(totalAmount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NutritionRatioImplCopyWith<$Res>
    implements $NutritionRatioCopyWith<$Res> {
  factory _$$NutritionRatioImplCopyWith(_$NutritionRatioImpl value,
          $Res Function(_$NutritionRatioImpl) then) =
      __$$NutritionRatioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Amount perAmount, Amount totalAmount});

  @override
  $AmountCopyWith<$Res> get perAmount;
  @override
  $AmountCopyWith<$Res> get totalAmount;
}

/// @nodoc
class __$$NutritionRatioImplCopyWithImpl<$Res>
    extends _$NutritionRatioCopyWithImpl<$Res, _$NutritionRatioImpl>
    implements _$$NutritionRatioImplCopyWith<$Res> {
  __$$NutritionRatioImplCopyWithImpl(
      _$NutritionRatioImpl _value, $Res Function(_$NutritionRatioImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perAmount = null,
    Object? totalAmount = null,
  }) {
    return _then(_$NutritionRatioImpl(
      perAmount: null == perAmount
          ? _value.perAmount
          : perAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionRatioImpl implements _NutritionRatio {
  const _$NutritionRatioImpl(
      {required this.perAmount, required this.totalAmount});

  factory _$NutritionRatioImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionRatioImplFromJson(json);

  @override
  final Amount perAmount;
  @override
  final Amount totalAmount;

  @override
  String toString() {
    return 'NutritionRatio._default(perAmount: $perAmount, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionRatioImpl &&
            (identical(other.perAmount, perAmount) ||
                other.perAmount == perAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, perAmount, totalAmount);

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionRatioImplCopyWith<_$NutritionRatioImpl> get copyWith =>
      __$$NutritionRatioImplCopyWithImpl<_$NutritionRatioImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionRatioImplToJson(
      this,
    );
  }
}

abstract class _NutritionRatio implements NutritionRatio {
  const factory _NutritionRatio(
      {required final Amount perAmount,
      required final Amount totalAmount}) = _$NutritionRatioImpl;

  factory _NutritionRatio.fromJson(Map<String, dynamic> json) =
      _$NutritionRatioImpl.fromJson;

  @override
  Amount get perAmount;
  @override
  Amount get totalAmount;

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionRatioImplCopyWith<_$NutritionRatioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
