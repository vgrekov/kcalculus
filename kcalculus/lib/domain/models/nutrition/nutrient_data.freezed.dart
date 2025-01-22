// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutrientData {
  double get calories => throw _privateConstructorUsedError;
  double get fatInGrams => throw _privateConstructorUsedError;
  double get carbsInGrams => throw _privateConstructorUsedError;
  double get fiberInGrams => throw _privateConstructorUsedError;
  double get proteinInGrams => throw _privateConstructorUsedError;

  /// Serializes this NutrientData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutrientData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientDataCopyWith<NutrientData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientDataCopyWith<$Res> {
  factory $NutrientDataCopyWith(
          NutrientData value, $Res Function(NutrientData) then) =
      _$NutrientDataCopyWithImpl<$Res, NutrientData>;
  @useResult
  $Res call(
      {double calories,
      double fatInGrams,
      double carbsInGrams,
      double fiberInGrams,
      double proteinInGrams});
}

/// @nodoc
class _$NutrientDataCopyWithImpl<$Res, $Val extends NutrientData>
    implements $NutrientDataCopyWith<$Res> {
  _$NutrientDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutrientData
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
abstract class _$$NutrientDataImplCopyWith<$Res>
    implements $NutrientDataCopyWith<$Res> {
  factory _$$NutrientDataImplCopyWith(
          _$NutrientDataImpl value, $Res Function(_$NutrientDataImpl) then) =
      __$$NutrientDataImplCopyWithImpl<$Res>;
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
class __$$NutrientDataImplCopyWithImpl<$Res>
    extends _$NutrientDataCopyWithImpl<$Res, _$NutrientDataImpl>
    implements _$$NutrientDataImplCopyWith<$Res> {
  __$$NutrientDataImplCopyWithImpl(
      _$NutrientDataImpl _value, $Res Function(_$NutrientDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutrientData
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
    return _then(_$NutrientDataImpl(
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
@JsonSerializable(createFactory: false)
class _$NutrientDataImpl extends _NutrientData {
  const _$NutrientDataImpl(
      {required this.calories,
      required this.fatInGrams,
      required this.carbsInGrams,
      required this.fiberInGrams,
      required this.proteinInGrams})
      : super._();

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
    return 'NutrientData(calories: $calories, fatInGrams: $fatInGrams, carbsInGrams: $carbsInGrams, fiberInGrams: $fiberInGrams, proteinInGrams: $proteinInGrams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientDataImpl &&
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

  /// Create a copy of NutrientData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientDataImplCopyWith<_$NutrientDataImpl> get copyWith =>
      __$$NutrientDataImplCopyWithImpl<_$NutrientDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutrientDataImplToJson(
      this,
    );
  }
}

abstract class _NutrientData extends NutrientData {
  const factory _NutrientData(
      {required final double calories,
      required final double fatInGrams,
      required final double carbsInGrams,
      required final double fiberInGrams,
      required final double proteinInGrams}) = _$NutrientDataImpl;
  const _NutrientData._() : super._();

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

  /// Create a copy of NutrientData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientDataImplCopyWith<_$NutrientDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
