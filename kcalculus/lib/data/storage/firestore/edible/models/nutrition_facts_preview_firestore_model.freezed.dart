// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_preview_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsPreviewFirestoreModel {

 AmountFirestoreModel get per; AmountFirestoreModel get calories; AmountFirestoreModel? get fat; AmountFirestoreModel? get carbs; AmountFirestoreModel? get protein; AmountFirestoreModel? get fiber;
/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionFactsPreviewFirestoreModelCopyWith<NutritionFactsPreviewFirestoreModel> get copyWith => _$NutritionFactsPreviewFirestoreModelCopyWithImpl<NutritionFactsPreviewFirestoreModel>(this as NutritionFactsPreviewFirestoreModel, _$identity);

  /// Serializes this NutritionFactsPreviewFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionFactsPreviewFirestoreModel&&(identical(other.per, per) || other.per == per)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fiber, fiber) || other.fiber == fiber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,per,calories,fat,carbs,protein,fiber);

@override
String toString() {
  return 'NutritionFactsPreviewFirestoreModel(per: $per, calories: $calories, fat: $fat, carbs: $carbs, protein: $protein, fiber: $fiber)';
}


}

/// @nodoc
abstract mixin class $NutritionFactsPreviewFirestoreModelCopyWith<$Res>  {
  factory $NutritionFactsPreviewFirestoreModelCopyWith(NutritionFactsPreviewFirestoreModel value, $Res Function(NutritionFactsPreviewFirestoreModel) _then) = _$NutritionFactsPreviewFirestoreModelCopyWithImpl;
@useResult
$Res call({
 AmountFirestoreModel per, AmountFirestoreModel calories, AmountFirestoreModel? fat, AmountFirestoreModel? carbs, AmountFirestoreModel? protein, AmountFirestoreModel? fiber
});


$AmountFirestoreModelCopyWith<$Res> get per;$AmountFirestoreModelCopyWith<$Res> get calories;$AmountFirestoreModelCopyWith<$Res>? get fat;$AmountFirestoreModelCopyWith<$Res>? get carbs;$AmountFirestoreModelCopyWith<$Res>? get protein;$AmountFirestoreModelCopyWith<$Res>? get fiber;

}
/// @nodoc
class _$NutritionFactsPreviewFirestoreModelCopyWithImpl<$Res>
    implements $NutritionFactsPreviewFirestoreModelCopyWith<$Res> {
  _$NutritionFactsPreviewFirestoreModelCopyWithImpl(this._self, this._then);

  final NutritionFactsPreviewFirestoreModel _self;
  final $Res Function(NutritionFactsPreviewFirestoreModel) _then;

/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? per = null,Object? calories = null,Object? fat = freezed,Object? carbs = freezed,Object? protein = freezed,Object? fiber = freezed,}) {
  return _then(_self.copyWith(
per: null == per ? _self.per : per // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel?,
  ));
}
/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get per {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.per, (value) {
    return _then(_self.copyWith(per: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get calories {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.calories, (value) {
    return _then(_self.copyWith(calories: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res>? get fat {
    if (_self.fat == null) {
    return null;
  }

  return $AmountFirestoreModelCopyWith<$Res>(_self.fat!, (value) {
    return _then(_self.copyWith(fat: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res>? get carbs {
    if (_self.carbs == null) {
    return null;
  }

  return $AmountFirestoreModelCopyWith<$Res>(_self.carbs!, (value) {
    return _then(_self.copyWith(carbs: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res>? get protein {
    if (_self.protein == null) {
    return null;
  }

  return $AmountFirestoreModelCopyWith<$Res>(_self.protein!, (value) {
    return _then(_self.copyWith(protein: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res>? get fiber {
    if (_self.fiber == null) {
    return null;
  }

  return $AmountFirestoreModelCopyWith<$Res>(_self.fiber!, (value) {
    return _then(_self.copyWith(fiber: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutritionFactsPreviewFirestoreModel].
extension NutritionFactsPreviewFirestoreModelPatterns on NutritionFactsPreviewFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionFactsPreviewFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionFactsPreviewFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionFactsPreviewFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsPreviewFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionFactsPreviewFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsPreviewFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AmountFirestoreModel per,  AmountFirestoreModel calories,  AmountFirestoreModel? fat,  AmountFirestoreModel? carbs,  AmountFirestoreModel? protein,  AmountFirestoreModel? fiber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionFactsPreviewFirestoreModel() when $default != null:
return $default(_that.per,_that.calories,_that.fat,_that.carbs,_that.protein,_that.fiber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AmountFirestoreModel per,  AmountFirestoreModel calories,  AmountFirestoreModel? fat,  AmountFirestoreModel? carbs,  AmountFirestoreModel? protein,  AmountFirestoreModel? fiber)  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsPreviewFirestoreModel():
return $default(_that.per,_that.calories,_that.fat,_that.carbs,_that.protein,_that.fiber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AmountFirestoreModel per,  AmountFirestoreModel calories,  AmountFirestoreModel? fat,  AmountFirestoreModel? carbs,  AmountFirestoreModel? protein,  AmountFirestoreModel? fiber)?  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsPreviewFirestoreModel() when $default != null:
return $default(_that.per,_that.calories,_that.fat,_that.carbs,_that.protein,_that.fiber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutritionFactsPreviewFirestoreModel extends NutritionFactsPreviewFirestoreModel {
  const _NutritionFactsPreviewFirestoreModel({required this.per, required this.calories, required this.fat, required this.carbs, required this.protein, required this.fiber}): super._();
  factory _NutritionFactsPreviewFirestoreModel.fromJson(Map<String, dynamic> json) => _$NutritionFactsPreviewFirestoreModelFromJson(json);

@override final  AmountFirestoreModel per;
@override final  AmountFirestoreModel calories;
@override final  AmountFirestoreModel? fat;
@override final  AmountFirestoreModel? carbs;
@override final  AmountFirestoreModel? protein;
@override final  AmountFirestoreModel? fiber;

/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionFactsPreviewFirestoreModelCopyWith<_NutritionFactsPreviewFirestoreModel> get copyWith => __$NutritionFactsPreviewFirestoreModelCopyWithImpl<_NutritionFactsPreviewFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutritionFactsPreviewFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionFactsPreviewFirestoreModel&&(identical(other.per, per) || other.per == per)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fiber, fiber) || other.fiber == fiber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,per,calories,fat,carbs,protein,fiber);

@override
String toString() {
  return 'NutritionFactsPreviewFirestoreModel(per: $per, calories: $calories, fat: $fat, carbs: $carbs, protein: $protein, fiber: $fiber)';
}


}

/// @nodoc
abstract mixin class _$NutritionFactsPreviewFirestoreModelCopyWith<$Res> implements $NutritionFactsPreviewFirestoreModelCopyWith<$Res> {
  factory _$NutritionFactsPreviewFirestoreModelCopyWith(_NutritionFactsPreviewFirestoreModel value, $Res Function(_NutritionFactsPreviewFirestoreModel) _then) = __$NutritionFactsPreviewFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
 AmountFirestoreModel per, AmountFirestoreModel calories, AmountFirestoreModel? fat, AmountFirestoreModel? carbs, AmountFirestoreModel? protein, AmountFirestoreModel? fiber
});


@override $AmountFirestoreModelCopyWith<$Res> get per;@override $AmountFirestoreModelCopyWith<$Res> get calories;@override $AmountFirestoreModelCopyWith<$Res>? get fat;@override $AmountFirestoreModelCopyWith<$Res>? get carbs;@override $AmountFirestoreModelCopyWith<$Res>? get protein;@override $AmountFirestoreModelCopyWith<$Res>? get fiber;

}
/// @nodoc
class __$NutritionFactsPreviewFirestoreModelCopyWithImpl<$Res>
    implements _$NutritionFactsPreviewFirestoreModelCopyWith<$Res> {
  __$NutritionFactsPreviewFirestoreModelCopyWithImpl(this._self, this._then);

  final _NutritionFactsPreviewFirestoreModel _self;
  final $Res Function(_NutritionFactsPreviewFirestoreModel) _then;

/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? per = null,Object? calories = null,Object? fat = freezed,Object? carbs = freezed,Object? protein = freezed,Object? fiber = freezed,}) {
  return _then(_NutritionFactsPreviewFirestoreModel(
per: null == per ? _self.per : per // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel?,
  ));
}

/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get per {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.per, (value) {
    return _then(_self.copyWith(per: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get calories {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.calories, (value) {
    return _then(_self.copyWith(calories: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res>? get fat {
    if (_self.fat == null) {
    return null;
  }

  return $AmountFirestoreModelCopyWith<$Res>(_self.fat!, (value) {
    return _then(_self.copyWith(fat: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res>? get carbs {
    if (_self.carbs == null) {
    return null;
  }

  return $AmountFirestoreModelCopyWith<$Res>(_self.carbs!, (value) {
    return _then(_self.copyWith(carbs: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res>? get protein {
    if (_self.protein == null) {
    return null;
  }

  return $AmountFirestoreModelCopyWith<$Res>(_self.protein!, (value) {
    return _then(_self.copyWith(protein: value));
  });
}/// Create a copy of NutritionFactsPreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res>? get fiber {
    if (_self.fiber == null) {
    return null;
  }

  return $AmountFirestoreModelCopyWith<$Res>(_self.fiber!, (value) {
    return _then(_self.copyWith(fiber: value));
  });
}
}

// dart format on
