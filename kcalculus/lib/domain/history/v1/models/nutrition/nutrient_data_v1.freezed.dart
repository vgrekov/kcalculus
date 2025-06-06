// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_data_v1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutrientDataV1 _$NutrientDataV1FromJson(Map<String, dynamic> json) {
  return _NutrientDataV1.fromJson(json);
}

/// @nodoc
mixin _$NutrientDataV1 {
  double get calories => throw _privateConstructorUsedError;
  double get fatInGrams => throw _privateConstructorUsedError;
  double get carbsInGrams => throw _privateConstructorUsedError;
  double get fiberInGrams => throw _privateConstructorUsedError;
  double get proteinInGrams => throw _privateConstructorUsedError;

  /// Serializes this NutrientDataV1 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutrientDataV1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientDataV1CopyWith<NutrientDataV1> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientDataV1CopyWith<$Res> {
  factory $NutrientDataV1CopyWith(
          NutrientDataV1 value, $Res Function(NutrientDataV1) then) =
      _$NutrientDataV1CopyWithImpl<$Res, NutrientDataV1>;
  @useResult
  $Res call(
      {double calories,
      double fatInGrams,
      double carbsInGrams,
      double fiberInGrams,
      double proteinInGrams});
}

/// @nodoc
class _$NutrientDataV1CopyWithImpl<$Res, $Val extends NutrientDataV1>
    implements $NutrientDataV1CopyWith<$Res> {
  _$NutrientDataV1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutrientDataV1
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = null,
    Object? fatInGrams = null,
    Object? carbsInGrams = null,
    Object? fiberInGrams = null,
    Object? proteinInGrams = null,
  }) {
    return _then(_value.copyWith(
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      fatInGrams: null == fatInGrams
          ? _value.fatInGrams
          : fatInGrams // ignore: cast_nullable_to_non_nullable
              as double,
      carbsInGrams: null == carbsInGrams
          ? _value.carbsInGrams
          : carbsInGrams // ignore: cast_nullable_to_non_nullable
              as double,
      fiberInGrams: null == fiberInGrams
          ? _value.fiberInGrams
          : fiberInGrams // ignore: cast_nullable_to_non_nullable
              as double,
      proteinInGrams: null == proteinInGrams
          ? _value.proteinInGrams
          : proteinInGrams // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutrientDataV1ImplCopyWith<$Res>
    implements $NutrientDataV1CopyWith<$Res> {
  factory _$$NutrientDataV1ImplCopyWith(_$NutrientDataV1Impl value,
          $Res Function(_$NutrientDataV1Impl) then) =
      __$$NutrientDataV1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double calories,
      double fatInGrams,
      double carbsInGrams,
      double fiberInGrams,
      double proteinInGrams});
}

/// @nodoc
class __$$NutrientDataV1ImplCopyWithImpl<$Res>
    extends _$NutrientDataV1CopyWithImpl<$Res, _$NutrientDataV1Impl>
    implements _$$NutrientDataV1ImplCopyWith<$Res> {
  __$$NutrientDataV1ImplCopyWithImpl(
      _$NutrientDataV1Impl _value, $Res Function(_$NutrientDataV1Impl) _then)
      : super(_value, _then);

  /// Create a copy of NutrientDataV1
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = null,
    Object? fatInGrams = null,
    Object? carbsInGrams = null,
    Object? fiberInGrams = null,
    Object? proteinInGrams = null,
  }) {
    return _then(_$NutrientDataV1Impl(
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      fatInGrams: null == fatInGrams
          ? _value.fatInGrams
          : fatInGrams // ignore: cast_nullable_to_non_nullable
              as double,
      carbsInGrams: null == carbsInGrams
          ? _value.carbsInGrams
          : carbsInGrams // ignore: cast_nullable_to_non_nullable
              as double,
      fiberInGrams: null == fiberInGrams
          ? _value.fiberInGrams
          : fiberInGrams // ignore: cast_nullable_to_non_nullable
              as double,
      proteinInGrams: null == proteinInGrams
          ? _value.proteinInGrams
          : proteinInGrams // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutrientDataV1Impl implements _NutrientDataV1 {
  const _$NutrientDataV1Impl(
      {required this.calories,
      required this.fatInGrams,
      required this.carbsInGrams,
      required this.fiberInGrams,
      required this.proteinInGrams});

  factory _$NutrientDataV1Impl.fromJson(Map<String, dynamic> json) =>
      _$$NutrientDataV1ImplFromJson(json);

  @override
  final double calories;
  @override
  final double fatInGrams;
  @override
  final double carbsInGrams;
  @override
  final double fiberInGrams;
  @override
  final double proteinInGrams;

  @override
  String toString() {
    return 'NutrientDataV1(calories: $calories, fatInGrams: $fatInGrams, carbsInGrams: $carbsInGrams, fiberInGrams: $fiberInGrams, proteinInGrams: $proteinInGrams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientDataV1Impl &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.fatInGrams, fatInGrams) ||
                other.fatInGrams == fatInGrams) &&
            (identical(other.carbsInGrams, carbsInGrams) ||
                other.carbsInGrams == carbsInGrams) &&
            (identical(other.fiberInGrams, fiberInGrams) ||
                other.fiberInGrams == fiberInGrams) &&
            (identical(other.proteinInGrams, proteinInGrams) ||
                other.proteinInGrams == proteinInGrams));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, calories, fatInGrams,
      carbsInGrams, fiberInGrams, proteinInGrams);

  /// Create a copy of NutrientDataV1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientDataV1ImplCopyWith<_$NutrientDataV1Impl> get copyWith =>
      __$$NutrientDataV1ImplCopyWithImpl<_$NutrientDataV1Impl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutrientDataV1ImplToJson(
      this,
    );
  }
}

abstract class _NutrientDataV1 implements NutrientDataV1 {
  const factory _NutrientDataV1(
      {required final double calories,
      required final double fatInGrams,
      required final double carbsInGrams,
      required final double fiberInGrams,
      required final double proteinInGrams}) = _$NutrientDataV1Impl;

  factory _NutrientDataV1.fromJson(Map<String, dynamic> json) =
      _$NutrientDataV1Impl.fromJson;

  @override
  double get calories;
  @override
  double get fatInGrams;
  @override
  double get carbsInGrams;
  @override
  double get fiberInGrams;
  @override
  double get proteinInGrams;

  /// Create a copy of NutrientDataV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientDataV1ImplCopyWith<_$NutrientDataV1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
