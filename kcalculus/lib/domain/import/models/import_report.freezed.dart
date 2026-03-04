// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImportReport {

 ImportProgress get foods; ImportProgress get dishes; ImportProgress get meals; ImportProgress get containers; ImportProgress get defaultNutrients; ImportProgress get nutrientGoals; ImportProgress get settings;
/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportReportCopyWith<ImportReport> get copyWith => _$ImportReportCopyWithImpl<ImportReport>(this as ImportReport, _$identity);

  /// Serializes this ImportReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportReport&&(identical(other.foods, foods) || other.foods == foods)&&(identical(other.dishes, dishes) || other.dishes == dishes)&&(identical(other.meals, meals) || other.meals == meals)&&(identical(other.containers, containers) || other.containers == containers)&&(identical(other.defaultNutrients, defaultNutrients) || other.defaultNutrients == defaultNutrients)&&(identical(other.nutrientGoals, nutrientGoals) || other.nutrientGoals == nutrientGoals)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foods,dishes,meals,containers,defaultNutrients,nutrientGoals,settings);

@override
String toString() {
  return 'ImportReport(foods: $foods, dishes: $dishes, meals: $meals, containers: $containers, defaultNutrients: $defaultNutrients, nutrientGoals: $nutrientGoals, settings: $settings)';
}


}

/// @nodoc
abstract mixin class $ImportReportCopyWith<$Res>  {
  factory $ImportReportCopyWith(ImportReport value, $Res Function(ImportReport) _then) = _$ImportReportCopyWithImpl;
@useResult
$Res call({
 ImportProgress foods, ImportProgress dishes, ImportProgress meals, ImportProgress containers, ImportProgress defaultNutrients, ImportProgress nutrientGoals, ImportProgress settings
});


$ImportProgressCopyWith<$Res> get foods;$ImportProgressCopyWith<$Res> get dishes;$ImportProgressCopyWith<$Res> get meals;$ImportProgressCopyWith<$Res> get containers;$ImportProgressCopyWith<$Res> get defaultNutrients;$ImportProgressCopyWith<$Res> get nutrientGoals;$ImportProgressCopyWith<$Res> get settings;

}
/// @nodoc
class _$ImportReportCopyWithImpl<$Res>
    implements $ImportReportCopyWith<$Res> {
  _$ImportReportCopyWithImpl(this._self, this._then);

  final ImportReport _self;
  final $Res Function(ImportReport) _then;

/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foods = null,Object? dishes = null,Object? meals = null,Object? containers = null,Object? defaultNutrients = null,Object? nutrientGoals = null,Object? settings = null,}) {
  return _then(_self.copyWith(
foods: null == foods ? _self.foods : foods // ignore: cast_nullable_to_non_nullable
as ImportProgress,dishes: null == dishes ? _self.dishes : dishes // ignore: cast_nullable_to_non_nullable
as ImportProgress,meals: null == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as ImportProgress,containers: null == containers ? _self.containers : containers // ignore: cast_nullable_to_non_nullable
as ImportProgress,defaultNutrients: null == defaultNutrients ? _self.defaultNutrients : defaultNutrients // ignore: cast_nullable_to_non_nullable
as ImportProgress,nutrientGoals: null == nutrientGoals ? _self.nutrientGoals : nutrientGoals // ignore: cast_nullable_to_non_nullable
as ImportProgress,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ImportProgress,
  ));
}
/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get foods {
  
  return $ImportProgressCopyWith<$Res>(_self.foods, (value) {
    return _then(_self.copyWith(foods: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get dishes {
  
  return $ImportProgressCopyWith<$Res>(_self.dishes, (value) {
    return _then(_self.copyWith(dishes: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get meals {
  
  return $ImportProgressCopyWith<$Res>(_self.meals, (value) {
    return _then(_self.copyWith(meals: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get containers {
  
  return $ImportProgressCopyWith<$Res>(_self.containers, (value) {
    return _then(_self.copyWith(containers: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get defaultNutrients {
  
  return $ImportProgressCopyWith<$Res>(_self.defaultNutrients, (value) {
    return _then(_self.copyWith(defaultNutrients: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get nutrientGoals {
  
  return $ImportProgressCopyWith<$Res>(_self.nutrientGoals, (value) {
    return _then(_self.copyWith(nutrientGoals: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get settings {
  
  return $ImportProgressCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [ImportReport].
extension ImportReportPatterns on ImportReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportReport value)  $default,){
final _that = this;
switch (_that) {
case _ImportReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportReport value)?  $default,){
final _that = this;
switch (_that) {
case _ImportReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImportProgress foods,  ImportProgress dishes,  ImportProgress meals,  ImportProgress containers,  ImportProgress defaultNutrients,  ImportProgress nutrientGoals,  ImportProgress settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportReport() when $default != null:
return $default(_that.foods,_that.dishes,_that.meals,_that.containers,_that.defaultNutrients,_that.nutrientGoals,_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImportProgress foods,  ImportProgress dishes,  ImportProgress meals,  ImportProgress containers,  ImportProgress defaultNutrients,  ImportProgress nutrientGoals,  ImportProgress settings)  $default,) {final _that = this;
switch (_that) {
case _ImportReport():
return $default(_that.foods,_that.dishes,_that.meals,_that.containers,_that.defaultNutrients,_that.nutrientGoals,_that.settings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImportProgress foods,  ImportProgress dishes,  ImportProgress meals,  ImportProgress containers,  ImportProgress defaultNutrients,  ImportProgress nutrientGoals,  ImportProgress settings)?  $default,) {final _that = this;
switch (_that) {
case _ImportReport() when $default != null:
return $default(_that.foods,_that.dishes,_that.meals,_that.containers,_that.defaultNutrients,_that.nutrientGoals,_that.settings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImportReport implements ImportReport {
  const _ImportReport({required this.foods, required this.dishes, required this.meals, required this.containers, required this.defaultNutrients, required this.nutrientGoals, required this.settings});
  factory _ImportReport.fromJson(Map<String, dynamic> json) => _$ImportReportFromJson(json);

@override final  ImportProgress foods;
@override final  ImportProgress dishes;
@override final  ImportProgress meals;
@override final  ImportProgress containers;
@override final  ImportProgress defaultNutrients;
@override final  ImportProgress nutrientGoals;
@override final  ImportProgress settings;

/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportReportCopyWith<_ImportReport> get copyWith => __$ImportReportCopyWithImpl<_ImportReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImportReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportReport&&(identical(other.foods, foods) || other.foods == foods)&&(identical(other.dishes, dishes) || other.dishes == dishes)&&(identical(other.meals, meals) || other.meals == meals)&&(identical(other.containers, containers) || other.containers == containers)&&(identical(other.defaultNutrients, defaultNutrients) || other.defaultNutrients == defaultNutrients)&&(identical(other.nutrientGoals, nutrientGoals) || other.nutrientGoals == nutrientGoals)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foods,dishes,meals,containers,defaultNutrients,nutrientGoals,settings);

@override
String toString() {
  return 'ImportReport(foods: $foods, dishes: $dishes, meals: $meals, containers: $containers, defaultNutrients: $defaultNutrients, nutrientGoals: $nutrientGoals, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$ImportReportCopyWith<$Res> implements $ImportReportCopyWith<$Res> {
  factory _$ImportReportCopyWith(_ImportReport value, $Res Function(_ImportReport) _then) = __$ImportReportCopyWithImpl;
@override @useResult
$Res call({
 ImportProgress foods, ImportProgress dishes, ImportProgress meals, ImportProgress containers, ImportProgress defaultNutrients, ImportProgress nutrientGoals, ImportProgress settings
});


@override $ImportProgressCopyWith<$Res> get foods;@override $ImportProgressCopyWith<$Res> get dishes;@override $ImportProgressCopyWith<$Res> get meals;@override $ImportProgressCopyWith<$Res> get containers;@override $ImportProgressCopyWith<$Res> get defaultNutrients;@override $ImportProgressCopyWith<$Res> get nutrientGoals;@override $ImportProgressCopyWith<$Res> get settings;

}
/// @nodoc
class __$ImportReportCopyWithImpl<$Res>
    implements _$ImportReportCopyWith<$Res> {
  __$ImportReportCopyWithImpl(this._self, this._then);

  final _ImportReport _self;
  final $Res Function(_ImportReport) _then;

/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foods = null,Object? dishes = null,Object? meals = null,Object? containers = null,Object? defaultNutrients = null,Object? nutrientGoals = null,Object? settings = null,}) {
  return _then(_ImportReport(
foods: null == foods ? _self.foods : foods // ignore: cast_nullable_to_non_nullable
as ImportProgress,dishes: null == dishes ? _self.dishes : dishes // ignore: cast_nullable_to_non_nullable
as ImportProgress,meals: null == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as ImportProgress,containers: null == containers ? _self.containers : containers // ignore: cast_nullable_to_non_nullable
as ImportProgress,defaultNutrients: null == defaultNutrients ? _self.defaultNutrients : defaultNutrients // ignore: cast_nullable_to_non_nullable
as ImportProgress,nutrientGoals: null == nutrientGoals ? _self.nutrientGoals : nutrientGoals // ignore: cast_nullable_to_non_nullable
as ImportProgress,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ImportProgress,
  ));
}

/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get foods {
  
  return $ImportProgressCopyWith<$Res>(_self.foods, (value) {
    return _then(_self.copyWith(foods: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get dishes {
  
  return $ImportProgressCopyWith<$Res>(_self.dishes, (value) {
    return _then(_self.copyWith(dishes: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get meals {
  
  return $ImportProgressCopyWith<$Res>(_self.meals, (value) {
    return _then(_self.copyWith(meals: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get containers {
  
  return $ImportProgressCopyWith<$Res>(_self.containers, (value) {
    return _then(_self.copyWith(containers: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get defaultNutrients {
  
  return $ImportProgressCopyWith<$Res>(_self.defaultNutrients, (value) {
    return _then(_self.copyWith(defaultNutrients: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get nutrientGoals {
  
  return $ImportProgressCopyWith<$Res>(_self.nutrientGoals, (value) {
    return _then(_self.copyWith(nutrientGoals: value));
  });
}/// Create a copy of ImportReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<$Res> get settings {
  
  return $ImportProgressCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
