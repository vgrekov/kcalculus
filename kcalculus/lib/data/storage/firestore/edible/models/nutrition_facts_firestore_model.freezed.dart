// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsFirestoreModel {
  AmountFirestoreModel get per;
  Map<Nutrient, AmountFirestoreModel> get data;

  /// Create a copy of NutritionFactsFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsFirestoreModelCopyWith<NutritionFactsFirestoreModel>
      get copyWith => _$NutritionFactsFirestoreModelCopyWithImpl<
              NutritionFactsFirestoreModel>(
          this as NutritionFactsFirestoreModel, _$identity);

  /// Serializes this NutritionFactsFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFactsFirestoreModel &&
            (identical(other.per, per) || other.per == per) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, per, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'NutritionFactsFirestoreModel(per: $per, data: $data)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsFirestoreModelCopyWith<$Res> {
  factory $NutritionFactsFirestoreModelCopyWith(
          NutritionFactsFirestoreModel value,
          $Res Function(NutritionFactsFirestoreModel) _then) =
      _$NutritionFactsFirestoreModelCopyWithImpl;
  @useResult
  $Res call(
      {AmountFirestoreModel per, Map<Nutrient, AmountFirestoreModel> data});

  $AmountFirestoreModelCopyWith<$Res> get per;
}

/// @nodoc
class _$NutritionFactsFirestoreModelCopyWithImpl<$Res>
    implements $NutritionFactsFirestoreModelCopyWith<$Res> {
  _$NutritionFactsFirestoreModelCopyWithImpl(this._self, this._then);

  final NutritionFactsFirestoreModel _self;
  final $Res Function(NutritionFactsFirestoreModel) _then;

  /// Create a copy of NutritionFactsFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? per = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      per: null == per
          ? _self.per
          : per // ignore: cast_nullable_to_non_nullable
              as AmountFirestoreModel,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<Nutrient, AmountFirestoreModel>,
    ));
  }

  /// Create a copy of NutritionFactsFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountFirestoreModelCopyWith<$Res> get per {
    return $AmountFirestoreModelCopyWith<$Res>(_self.per, (value) {
      return _then(_self.copyWith(per: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NutritionFactsFirestoreModel extends NutritionFactsFirestoreModel {
  const _NutritionFactsFirestoreModel(
      {required this.per,
      required final Map<Nutrient, AmountFirestoreModel> data})
      : _data = data,
        super._();
  factory _NutritionFactsFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsFirestoreModelFromJson(json);

  @override
  final AmountFirestoreModel per;
  final Map<Nutrient, AmountFirestoreModel> _data;
  @override
  Map<Nutrient, AmountFirestoreModel> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Create a copy of NutritionFactsFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsFirestoreModelCopyWith<_NutritionFactsFirestoreModel>
      get copyWith => __$NutritionFactsFirestoreModelCopyWithImpl<
          _NutritionFactsFirestoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionFactsFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFactsFirestoreModel &&
            (identical(other.per, per) || other.per == per) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, per, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'NutritionFactsFirestoreModel(per: $per, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsFirestoreModelCopyWith<$Res>
    implements $NutritionFactsFirestoreModelCopyWith<$Res> {
  factory _$NutritionFactsFirestoreModelCopyWith(
          _NutritionFactsFirestoreModel value,
          $Res Function(_NutritionFactsFirestoreModel) _then) =
      __$NutritionFactsFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AmountFirestoreModel per, Map<Nutrient, AmountFirestoreModel> data});

  @override
  $AmountFirestoreModelCopyWith<$Res> get per;
}

/// @nodoc
class __$NutritionFactsFirestoreModelCopyWithImpl<$Res>
    implements _$NutritionFactsFirestoreModelCopyWith<$Res> {
  __$NutritionFactsFirestoreModelCopyWithImpl(this._self, this._then);

  final _NutritionFactsFirestoreModel _self;
  final $Res Function(_NutritionFactsFirestoreModel) _then;

  /// Create a copy of NutritionFactsFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? per = null,
    Object? data = null,
  }) {
    return _then(_NutritionFactsFirestoreModel(
      per: null == per
          ? _self.per
          : per // ignore: cast_nullable_to_non_nullable
              as AmountFirestoreModel,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<Nutrient, AmountFirestoreModel>,
    ));
  }

  /// Create a copy of NutritionFactsFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountFirestoreModelCopyWith<$Res> get per {
    return $AmountFirestoreModelCopyWith<$Res>(_self.per, (value) {
      return _then(_self.copyWith(per: value));
    });
  }
}

// dart format on
