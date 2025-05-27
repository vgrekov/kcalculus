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

NutrientData _$NutrientDataFromJson(Map<String, dynamic> json) {
  return _NutrientData.fromJson(json);
}

/// @nodoc
mixin _$NutrientData {
  Map<Nutrient, Amount> get nutrientAmounts =>
      throw _privateConstructorUsedError;

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
  $Res call({Map<Nutrient, Amount> nutrientAmounts});
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
    Object? nutrientAmounts = null,
  }) {
    return _then(_value.copyWith(
      nutrientAmounts: null == nutrientAmounts
          ? _value.nutrientAmounts
          : nutrientAmounts // ignore: cast_nullable_to_non_nullable
              as Map<Nutrient, Amount>,
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
  $Res call({Map<Nutrient, Amount> nutrientAmounts});
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
    Object? nutrientAmounts = null,
  }) {
    return _then(_$NutrientDataImpl(
      nutrientAmounts: null == nutrientAmounts
          ? _value._nutrientAmounts
          : nutrientAmounts // ignore: cast_nullable_to_non_nullable
              as Map<Nutrient, Amount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutrientDataImpl extends _NutrientData {
  const _$NutrientDataImpl(
      {required final Map<Nutrient, Amount> nutrientAmounts})
      : _nutrientAmounts = nutrientAmounts,
        super._();

  factory _$NutrientDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutrientDataImplFromJson(json);

  final Map<Nutrient, Amount> _nutrientAmounts;
  @override
  Map<Nutrient, Amount> get nutrientAmounts {
    if (_nutrientAmounts is EqualUnmodifiableMapView) return _nutrientAmounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_nutrientAmounts);
  }

  @override
  String toString() {
    return 'NutrientData(nutrientAmounts: $nutrientAmounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientDataImpl &&
            const DeepCollectionEquality()
                .equals(other._nutrientAmounts, _nutrientAmounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_nutrientAmounts));

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
          {required final Map<Nutrient, Amount> nutrientAmounts}) =
      _$NutrientDataImpl;
  const _NutrientData._() : super._();

  factory _NutrientData.fromJson(Map<String, dynamic> json) =
      _$NutrientDataImpl.fromJson;

  @override
  Map<Nutrient, Amount> get nutrientAmounts;

  /// Create a copy of NutrientData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientDataImplCopyWith<_$NutrientDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
