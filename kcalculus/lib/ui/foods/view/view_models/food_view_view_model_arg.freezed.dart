// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_view_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodViewViewModelArg {
  String get foodId;
  bool get isUsdaFood;

  /// Create a copy of FoodViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FoodViewViewModelArgCopyWith<FoodViewViewModelArg> get copyWith =>
      _$FoodViewViewModelArgCopyWithImpl<FoodViewViewModelArg>(
          this as FoodViewViewModelArg, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodViewViewModelArg &&
            (identical(other.foodId, foodId) || other.foodId == foodId) &&
            (identical(other.isUsdaFood, isUsdaFood) ||
                other.isUsdaFood == isUsdaFood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, foodId, isUsdaFood);

  @override
  String toString() {
    return 'FoodViewViewModelArg(foodId: $foodId, isUsdaFood: $isUsdaFood)';
  }
}

/// @nodoc
abstract mixin class $FoodViewViewModelArgCopyWith<$Res> {
  factory $FoodViewViewModelArgCopyWith(FoodViewViewModelArg value,
          $Res Function(FoodViewViewModelArg) _then) =
      _$FoodViewViewModelArgCopyWithImpl;
  @useResult
  $Res call({String foodId, bool isUsdaFood});
}

/// @nodoc
class _$FoodViewViewModelArgCopyWithImpl<$Res>
    implements $FoodViewViewModelArgCopyWith<$Res> {
  _$FoodViewViewModelArgCopyWithImpl(this._self, this._then);

  final FoodViewViewModelArg _self;
  final $Res Function(FoodViewViewModelArg) _then;

  /// Create a copy of FoodViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? isUsdaFood = null,
  }) {
    return _then(_self.copyWith(
      foodId: null == foodId
          ? _self.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      isUsdaFood: null == isUsdaFood
          ? _self.isUsdaFood
          : isUsdaFood // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _FoodViewViewModelArg implements FoodViewViewModelArg {
  const _FoodViewViewModelArg({required this.foodId, required this.isUsdaFood});

  @override
  final String foodId;
  @override
  final bool isUsdaFood;

  /// Create a copy of FoodViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FoodViewViewModelArgCopyWith<_FoodViewViewModelArg> get copyWith =>
      __$FoodViewViewModelArgCopyWithImpl<_FoodViewViewModelArg>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodViewViewModelArg &&
            (identical(other.foodId, foodId) || other.foodId == foodId) &&
            (identical(other.isUsdaFood, isUsdaFood) ||
                other.isUsdaFood == isUsdaFood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, foodId, isUsdaFood);

  @override
  String toString() {
    return 'FoodViewViewModelArg(foodId: $foodId, isUsdaFood: $isUsdaFood)';
  }
}

/// @nodoc
abstract mixin class _$FoodViewViewModelArgCopyWith<$Res>
    implements $FoodViewViewModelArgCopyWith<$Res> {
  factory _$FoodViewViewModelArgCopyWith(_FoodViewViewModelArg value,
          $Res Function(_FoodViewViewModelArg) _then) =
      __$FoodViewViewModelArgCopyWithImpl;
  @override
  @useResult
  $Res call({String foodId, bool isUsdaFood});
}

/// @nodoc
class __$FoodViewViewModelArgCopyWithImpl<$Res>
    implements _$FoodViewViewModelArgCopyWith<$Res> {
  __$FoodViewViewModelArgCopyWithImpl(this._self, this._then);

  final _FoodViewViewModelArg _self;
  final $Res Function(_FoodViewViewModelArg) _then;

  /// Create a copy of FoodViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? foodId = null,
    Object? isUsdaFood = null,
  }) {
    return _then(_FoodViewViewModelArg(
      foodId: null == foodId
          ? _self.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      isUsdaFood: null == isUsdaFood
          ? _self.isUsdaFood
          : isUsdaFood // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
