// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_ratio_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionRatioFirestoreModel {

 AmountFirestoreModel get per; AmountFirestoreModel get total;
/// Create a copy of NutritionRatioFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionRatioFirestoreModelCopyWith<NutritionRatioFirestoreModel> get copyWith => _$NutritionRatioFirestoreModelCopyWithImpl<NutritionRatioFirestoreModel>(this as NutritionRatioFirestoreModel, _$identity);

  /// Serializes this NutritionRatioFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionRatioFirestoreModel&&(identical(other.per, per) || other.per == per)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,per,total);

@override
String toString() {
  return 'NutritionRatioFirestoreModel(per: $per, total: $total)';
}


}

/// @nodoc
abstract mixin class $NutritionRatioFirestoreModelCopyWith<$Res>  {
  factory $NutritionRatioFirestoreModelCopyWith(NutritionRatioFirestoreModel value, $Res Function(NutritionRatioFirestoreModel) _then) = _$NutritionRatioFirestoreModelCopyWithImpl;
@useResult
$Res call({
 AmountFirestoreModel per, AmountFirestoreModel total
});


$AmountFirestoreModelCopyWith<$Res> get per;$AmountFirestoreModelCopyWith<$Res> get total;

}
/// @nodoc
class _$NutritionRatioFirestoreModelCopyWithImpl<$Res>
    implements $NutritionRatioFirestoreModelCopyWith<$Res> {
  _$NutritionRatioFirestoreModelCopyWithImpl(this._self, this._then);

  final NutritionRatioFirestoreModel _self;
  final $Res Function(NutritionRatioFirestoreModel) _then;

/// Create a copy of NutritionRatioFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? per = null,Object? total = null,}) {
  return _then(_self.copyWith(
per: null == per ? _self.per : per // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,
  ));
}
/// Create a copy of NutritionRatioFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get per {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.per, (value) {
    return _then(_self.copyWith(per: value));
  });
}/// Create a copy of NutritionRatioFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get total {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutritionRatioFirestoreModel].
extension NutritionRatioFirestoreModelPatterns on NutritionRatioFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionRatioFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionRatioFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionRatioFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _NutritionRatioFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionRatioFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionRatioFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AmountFirestoreModel per,  AmountFirestoreModel total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionRatioFirestoreModel() when $default != null:
return $default(_that.per,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AmountFirestoreModel per,  AmountFirestoreModel total)  $default,) {final _that = this;
switch (_that) {
case _NutritionRatioFirestoreModel():
return $default(_that.per,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AmountFirestoreModel per,  AmountFirestoreModel total)?  $default,) {final _that = this;
switch (_that) {
case _NutritionRatioFirestoreModel() when $default != null:
return $default(_that.per,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutritionRatioFirestoreModel extends NutritionRatioFirestoreModel {
  const _NutritionRatioFirestoreModel({required this.per, required this.total}): super._();
  factory _NutritionRatioFirestoreModel.fromJson(Map<String, dynamic> json) => _$NutritionRatioFirestoreModelFromJson(json);

@override final  AmountFirestoreModel per;
@override final  AmountFirestoreModel total;

/// Create a copy of NutritionRatioFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionRatioFirestoreModelCopyWith<_NutritionRatioFirestoreModel> get copyWith => __$NutritionRatioFirestoreModelCopyWithImpl<_NutritionRatioFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutritionRatioFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionRatioFirestoreModel&&(identical(other.per, per) || other.per == per)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,per,total);

@override
String toString() {
  return 'NutritionRatioFirestoreModel(per: $per, total: $total)';
}


}

/// @nodoc
abstract mixin class _$NutritionRatioFirestoreModelCopyWith<$Res> implements $NutritionRatioFirestoreModelCopyWith<$Res> {
  factory _$NutritionRatioFirestoreModelCopyWith(_NutritionRatioFirestoreModel value, $Res Function(_NutritionRatioFirestoreModel) _then) = __$NutritionRatioFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
 AmountFirestoreModel per, AmountFirestoreModel total
});


@override $AmountFirestoreModelCopyWith<$Res> get per;@override $AmountFirestoreModelCopyWith<$Res> get total;

}
/// @nodoc
class __$NutritionRatioFirestoreModelCopyWithImpl<$Res>
    implements _$NutritionRatioFirestoreModelCopyWith<$Res> {
  __$NutritionRatioFirestoreModelCopyWithImpl(this._self, this._then);

  final _NutritionRatioFirestoreModel _self;
  final $Res Function(_NutritionRatioFirestoreModel) _then;

/// Create a copy of NutritionRatioFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? per = null,Object? total = null,}) {
  return _then(_NutritionRatioFirestoreModel(
per: null == per ? _self.per : per // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,
  ));
}

/// Create a copy of NutritionRatioFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get per {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.per, (value) {
    return _then(_self.copyWith(per: value));
  });
}/// Create a copy of NutritionRatioFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get total {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}
}

// dart format on
