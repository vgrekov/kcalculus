// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 List<NutrientAmount> get nutrientAmounts; Map<Nutrient, Amount> get nutrientAmountsMap;
/// Create a copy of NutrientData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientDataCopyWith<NutrientData> get copyWith => _$NutrientDataCopyWithImpl<NutrientData>(this as NutrientData, _$identity);

  /// Serializes this NutrientData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientData&&const DeepCollectionEquality().equals(other.nutrientAmounts, nutrientAmounts)&&const DeepCollectionEquality().equals(other.nutrientAmountsMap, nutrientAmountsMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nutrientAmounts),const DeepCollectionEquality().hash(nutrientAmountsMap));

@override
String toString() {
  return 'NutrientData(nutrientAmounts: $nutrientAmounts, nutrientAmountsMap: $nutrientAmountsMap)';
}


}

/// @nodoc
abstract mixin class $NutrientDataCopyWith<$Res>  {
  factory $NutrientDataCopyWith(NutrientData value, $Res Function(NutrientData) _then) = _$NutrientDataCopyWithImpl;
@useResult
$Res call({
 List<NutrientAmount> nutrientAmounts, Map<Nutrient, Amount> nutrientAmountsMap
});




}
/// @nodoc
class _$NutrientDataCopyWithImpl<$Res>
    implements $NutrientDataCopyWith<$Res> {
  _$NutrientDataCopyWithImpl(this._self, this._then);

  final NutrientData _self;
  final $Res Function(NutrientData) _then;

/// Create a copy of NutrientData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutrientAmounts = null,Object? nutrientAmountsMap = null,}) {
  return _then(_self.copyWith(
nutrientAmounts: null == nutrientAmounts ? _self.nutrientAmounts : nutrientAmounts // ignore: cast_nullable_to_non_nullable
as List<NutrientAmount>,nutrientAmountsMap: null == nutrientAmountsMap ? _self.nutrientAmountsMap : nutrientAmountsMap // ignore: cast_nullable_to_non_nullable
as Map<Nutrient, Amount>,
  ));
}

}


/// Adds pattern-matching-related methods to [NutrientData].
extension NutrientDataPatterns on NutrientData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NutrientData value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NutrientData value)  $default,}){
final _that = this;
switch (_that) {
case _NutrientData():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NutrientData value)?  $default,}){
final _that = this;
switch (_that) {
case _NutrientData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<NutrientAmount> nutrientAmounts,  Map<Nutrient, Amount> nutrientAmountsMap)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientData() when $default != null:
return $default(_that.nutrientAmounts,_that.nutrientAmountsMap);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<NutrientAmount> nutrientAmounts,  Map<Nutrient, Amount> nutrientAmountsMap)  $default,}) {final _that = this;
switch (_that) {
case _NutrientData():
return $default(_that.nutrientAmounts,_that.nutrientAmountsMap);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<NutrientAmount> nutrientAmounts,  Map<Nutrient, Amount> nutrientAmountsMap)?  $default,}) {final _that = this;
switch (_that) {
case _NutrientData() when $default != null:
return $default(_that.nutrientAmounts,_that.nutrientAmountsMap);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutrientData extends NutrientData {
  const _NutrientData({required final  List<NutrientAmount> nutrientAmounts, required final  Map<Nutrient, Amount> nutrientAmountsMap}): _nutrientAmounts = nutrientAmounts,_nutrientAmountsMap = nutrientAmountsMap,super._();
  factory _NutrientData.fromJson(Map<String, dynamic> json) => _$NutrientDataFromJson(json);

 final  List<NutrientAmount> _nutrientAmounts;
@override List<NutrientAmount> get nutrientAmounts {
  if (_nutrientAmounts is EqualUnmodifiableListView) return _nutrientAmounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutrientAmounts);
}

 final  Map<Nutrient, Amount> _nutrientAmountsMap;
@override Map<Nutrient, Amount> get nutrientAmountsMap {
  if (_nutrientAmountsMap is EqualUnmodifiableMapView) return _nutrientAmountsMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_nutrientAmountsMap);
}


/// Create a copy of NutrientData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientDataCopyWith<_NutrientData> get copyWith => __$NutrientDataCopyWithImpl<_NutrientData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrientDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientData&&const DeepCollectionEquality().equals(other._nutrientAmounts, _nutrientAmounts)&&const DeepCollectionEquality().equals(other._nutrientAmountsMap, _nutrientAmountsMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nutrientAmounts),const DeepCollectionEquality().hash(_nutrientAmountsMap));

@override
String toString() {
  return 'NutrientData.\$default(nutrientAmounts: $nutrientAmounts, nutrientAmountsMap: $nutrientAmountsMap)';
}


}

/// @nodoc
abstract mixin class _$NutrientDataCopyWith<$Res> implements $NutrientDataCopyWith<$Res> {
  factory _$NutrientDataCopyWith(_NutrientData value, $Res Function(_NutrientData) _then) = __$NutrientDataCopyWithImpl;
@override @useResult
$Res call({
 List<NutrientAmount> nutrientAmounts, Map<Nutrient, Amount> nutrientAmountsMap
});




}
/// @nodoc
class __$NutrientDataCopyWithImpl<$Res>
    implements _$NutrientDataCopyWith<$Res> {
  __$NutrientDataCopyWithImpl(this._self, this._then);

  final _NutrientData _self;
  final $Res Function(_NutrientData) _then;

/// Create a copy of NutrientData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutrientAmounts = null,Object? nutrientAmountsMap = null,}) {
  return _then(_NutrientData(
nutrientAmounts: null == nutrientAmounts ? _self._nutrientAmounts : nutrientAmounts // ignore: cast_nullable_to_non_nullable
as List<NutrientAmount>,nutrientAmountsMap: null == nutrientAmountsMap ? _self._nutrientAmountsMap : nutrientAmountsMap // ignore: cast_nullable_to_non_nullable
as Map<Nutrient, Amount>,
  ));
}


}

// dart format on
