// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_ratio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionRatio {
  Amount get perAmount;
  Amount get totalAmount;

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionRatioCopyWith<NutritionRatio> get copyWith =>
      _$NutritionRatioCopyWithImpl<NutritionRatio>(
          this as NutritionRatio, _$identity);

  /// Serializes this NutritionRatio to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionRatio &&
            (identical(other.perAmount, perAmount) ||
                other.perAmount == perAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, perAmount, totalAmount);

  @override
  String toString() {
    return 'NutritionRatio(perAmount: $perAmount, totalAmount: $totalAmount)';
  }
}

/// @nodoc
abstract mixin class $NutritionRatioCopyWith<$Res> {
  factory $NutritionRatioCopyWith(
          NutritionRatio value, $Res Function(NutritionRatio) _then) =
      _$NutritionRatioCopyWithImpl;
  @useResult
  $Res call({Amount perAmount, Amount totalAmount});

  $AmountCopyWith<$Res> get perAmount;
  $AmountCopyWith<$Res> get totalAmount;
}

/// @nodoc
class _$NutritionRatioCopyWithImpl<$Res>
    implements $NutritionRatioCopyWith<$Res> {
  _$NutritionRatioCopyWithImpl(this._self, this._then);

  final NutritionRatio _self;
  final $Res Function(NutritionRatio) _then;

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perAmount = null,
    Object? totalAmount = null,
  }) {
    return _then(_self.copyWith(
      perAmount: null == perAmount
          ? _self.perAmount
          : perAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get perAmount {
    return $AmountCopyWith<$Res>(_self.perAmount, (value) {
      return _then(_self.copyWith(perAmount: value));
    });
  }

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get totalAmount {
    return $AmountCopyWith<$Res>(_self.totalAmount, (value) {
      return _then(_self.copyWith(totalAmount: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NutritionRatio implements NutritionRatio {
  const _NutritionRatio({required this.perAmount, required this.totalAmount});
  factory _NutritionRatio.fromJson(Map<String, dynamic> json) =>
      _$NutritionRatioFromJson(json);

  @override
  final Amount perAmount;
  @override
  final Amount totalAmount;

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionRatioCopyWith<_NutritionRatio> get copyWith =>
      __$NutritionRatioCopyWithImpl<_NutritionRatio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionRatioToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionRatio &&
            (identical(other.perAmount, perAmount) ||
                other.perAmount == perAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, perAmount, totalAmount);

  @override
  String toString() {
    return 'NutritionRatio._default(perAmount: $perAmount, totalAmount: $totalAmount)';
  }
}

/// @nodoc
abstract mixin class _$NutritionRatioCopyWith<$Res>
    implements $NutritionRatioCopyWith<$Res> {
  factory _$NutritionRatioCopyWith(
          _NutritionRatio value, $Res Function(_NutritionRatio) _then) =
      __$NutritionRatioCopyWithImpl;
  @override
  @useResult
  $Res call({Amount perAmount, Amount totalAmount});

  @override
  $AmountCopyWith<$Res> get perAmount;
  @override
  $AmountCopyWith<$Res> get totalAmount;
}

/// @nodoc
class __$NutritionRatioCopyWithImpl<$Res>
    implements _$NutritionRatioCopyWith<$Res> {
  __$NutritionRatioCopyWithImpl(this._self, this._then);

  final _NutritionRatio _self;
  final $Res Function(_NutritionRatio) _then;

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? perAmount = null,
    Object? totalAmount = null,
  }) {
    return _then(_NutritionRatio(
      perAmount: null == perAmount
          ? _self.perAmount
          : perAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get perAmount {
    return $AmountCopyWith<$Res>(_self.perAmount, (value) {
      return _then(_self.copyWith(perAmount: value));
    });
  }

  /// Create a copy of NutritionRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get totalAmount {
    return $AmountCopyWith<$Res>(_self.totalAmount, (value) {
      return _then(_self.copyWith(totalAmount: value));
    });
  }
}

// dart format on
