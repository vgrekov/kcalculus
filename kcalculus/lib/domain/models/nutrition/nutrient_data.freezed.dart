// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientData {
  List<NutrientAmount> get nutrientAmounts;
  Map<Nutrient, Amount> get nutrientAmountsMap;

  /// Create a copy of NutrientData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutrientDataCopyWith<NutrientData> get copyWith =>
      _$NutrientDataCopyWithImpl<NutrientData>(
          this as NutrientData, _$identity);

  /// Serializes this NutrientData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutrientData &&
            const DeepCollectionEquality()
                .equals(other.nutrientAmounts, nutrientAmounts) &&
            const DeepCollectionEquality()
                .equals(other.nutrientAmountsMap, nutrientAmountsMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nutrientAmounts),
      const DeepCollectionEquality().hash(nutrientAmountsMap));

  @override
  String toString() {
    return 'NutrientData(nutrientAmounts: $nutrientAmounts, nutrientAmountsMap: $nutrientAmountsMap)';
  }
}

/// @nodoc
abstract mixin class $NutrientDataCopyWith<$Res> {
  factory $NutrientDataCopyWith(
          NutrientData value, $Res Function(NutrientData) _then) =
      _$NutrientDataCopyWithImpl;
  @useResult
  $Res call(
      {List<NutrientAmount> nutrientAmounts,
      Map<Nutrient, Amount> nutrientAmountsMap});
}

/// @nodoc
class _$NutrientDataCopyWithImpl<$Res> implements $NutrientDataCopyWith<$Res> {
  _$NutrientDataCopyWithImpl(this._self, this._then);

  final NutrientData _self;
  final $Res Function(NutrientData) _then;

  /// Create a copy of NutrientData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrientAmounts = null,
    Object? nutrientAmountsMap = null,
  }) {
    return _then(_self.copyWith(
      nutrientAmounts: null == nutrientAmounts
          ? _self.nutrientAmounts
          : nutrientAmounts // ignore: cast_nullable_to_non_nullable
              as List<NutrientAmount>,
      nutrientAmountsMap: null == nutrientAmountsMap
          ? _self.nutrientAmountsMap
          : nutrientAmountsMap // ignore: cast_nullable_to_non_nullable
              as Map<Nutrient, Amount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NutrientData extends NutrientData {
  const _NutrientData(
      {required final List<NutrientAmount> nutrientAmounts,
      required final Map<Nutrient, Amount> nutrientAmountsMap})
      : _nutrientAmounts = nutrientAmounts,
        _nutrientAmountsMap = nutrientAmountsMap,
        super._();
  factory _NutrientData.fromJson(Map<String, dynamic> json) =>
      _$NutrientDataFromJson(json);

  final List<NutrientAmount> _nutrientAmounts;
  @override
  List<NutrientAmount> get nutrientAmounts {
    if (_nutrientAmounts is EqualUnmodifiableListView) return _nutrientAmounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrientAmounts);
  }

  final Map<Nutrient, Amount> _nutrientAmountsMap;
  @override
  Map<Nutrient, Amount> get nutrientAmountsMap {
    if (_nutrientAmountsMap is EqualUnmodifiableMapView)
      return _nutrientAmountsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_nutrientAmountsMap);
  }

  /// Create a copy of NutrientData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutrientDataCopyWith<_NutrientData> get copyWith =>
      __$NutrientDataCopyWithImpl<_NutrientData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutrientDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutrientData &&
            const DeepCollectionEquality()
                .equals(other._nutrientAmounts, _nutrientAmounts) &&
            const DeepCollectionEquality()
                .equals(other._nutrientAmountsMap, _nutrientAmountsMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nutrientAmounts),
      const DeepCollectionEquality().hash(_nutrientAmountsMap));

  @override
  String toString() {
    return 'NutrientData._default(nutrientAmounts: $nutrientAmounts, nutrientAmountsMap: $nutrientAmountsMap)';
  }
}

/// @nodoc
abstract mixin class _$NutrientDataCopyWith<$Res>
    implements $NutrientDataCopyWith<$Res> {
  factory _$NutrientDataCopyWith(
          _NutrientData value, $Res Function(_NutrientData) _then) =
      __$NutrientDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NutrientAmount> nutrientAmounts,
      Map<Nutrient, Amount> nutrientAmountsMap});
}

/// @nodoc
class __$NutrientDataCopyWithImpl<$Res>
    implements _$NutrientDataCopyWith<$Res> {
  __$NutrientDataCopyWithImpl(this._self, this._then);

  final _NutrientData _self;
  final $Res Function(_NutrientData) _then;

  /// Create a copy of NutrientData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nutrientAmounts = null,
    Object? nutrientAmountsMap = null,
  }) {
    return _then(_NutrientData(
      nutrientAmounts: null == nutrientAmounts
          ? _self._nutrientAmounts
          : nutrientAmounts // ignore: cast_nullable_to_non_nullable
              as List<NutrientAmount>,
      nutrientAmountsMap: null == nutrientAmountsMap
          ? _self._nutrientAmountsMap
          : nutrientAmountsMap // ignore: cast_nullable_to_non_nullable
              as Map<Nutrient, Amount>,
    ));
  }
}

// dart format on
