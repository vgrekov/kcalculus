// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_stats_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutrientStatsViewModelArg {

 DateTime get date; NutrientData get data;
/// Create a copy of NutrientStatsViewModelArg
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientStatsViewModelArgCopyWith<NutrientStatsViewModelArg> get copyWith => _$NutrientStatsViewModelArgCopyWithImpl<NutrientStatsViewModelArg>(this as NutrientStatsViewModelArg, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientStatsViewModelArg&&(identical(other.date, date) || other.date == date)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,date,data);

@override
String toString() {
  return 'NutrientStatsViewModelArg(date: $date, data: $data)';
}


}

/// @nodoc
abstract mixin class $NutrientStatsViewModelArgCopyWith<$Res>  {
  factory $NutrientStatsViewModelArgCopyWith(NutrientStatsViewModelArg value, $Res Function(NutrientStatsViewModelArg) _then) = _$NutrientStatsViewModelArgCopyWithImpl;
@useResult
$Res call({
 DateTime date, NutrientData data
});


$NutrientDataCopyWith<$Res> get data;

}
/// @nodoc
class _$NutrientStatsViewModelArgCopyWithImpl<$Res>
    implements $NutrientStatsViewModelArgCopyWith<$Res> {
  _$NutrientStatsViewModelArgCopyWithImpl(this._self, this._then);

  final NutrientStatsViewModelArg _self;
  final $Res Function(NutrientStatsViewModelArg) _then;

/// Create a copy of NutrientStatsViewModelArg
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? data = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NutrientData,
  ));
}
/// Create a copy of NutrientStatsViewModelArg
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientDataCopyWith<$Res> get data {
  
  return $NutrientDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutrientStatsViewModelArg].
extension NutrientStatsViewModelArgPatterns on NutrientStatsViewModelArg {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientStatsViewModelArg value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientStatsViewModelArg() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientStatsViewModelArg value)  $default,){
final _that = this;
switch (_that) {
case _NutrientStatsViewModelArg():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientStatsViewModelArg value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientStatsViewModelArg() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  NutrientData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientStatsViewModelArg() when $default != null:
return $default(_that.date,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  NutrientData data)  $default,) {final _that = this;
switch (_that) {
case _NutrientStatsViewModelArg():
return $default(_that.date,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  NutrientData data)?  $default,) {final _that = this;
switch (_that) {
case _NutrientStatsViewModelArg() when $default != null:
return $default(_that.date,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _NutrientStatsViewModelArg implements NutrientStatsViewModelArg {
  const _NutrientStatsViewModelArg({required this.date, required this.data});
  

@override final  DateTime date;
@override final  NutrientData data;

/// Create a copy of NutrientStatsViewModelArg
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientStatsViewModelArgCopyWith<_NutrientStatsViewModelArg> get copyWith => __$NutrientStatsViewModelArgCopyWithImpl<_NutrientStatsViewModelArg>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientStatsViewModelArg&&(identical(other.date, date) || other.date == date)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,date,data);

@override
String toString() {
  return 'NutrientStatsViewModelArg(date: $date, data: $data)';
}


}

/// @nodoc
abstract mixin class _$NutrientStatsViewModelArgCopyWith<$Res> implements $NutrientStatsViewModelArgCopyWith<$Res> {
  factory _$NutrientStatsViewModelArgCopyWith(_NutrientStatsViewModelArg value, $Res Function(_NutrientStatsViewModelArg) _then) = __$NutrientStatsViewModelArgCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, NutrientData data
});


@override $NutrientDataCopyWith<$Res> get data;

}
/// @nodoc
class __$NutrientStatsViewModelArgCopyWithImpl<$Res>
    implements _$NutrientStatsViewModelArgCopyWith<$Res> {
  __$NutrientStatsViewModelArgCopyWithImpl(this._self, this._then);

  final _NutrientStatsViewModelArg _self;
  final $Res Function(_NutrientStatsViewModelArg) _then;

/// Create a copy of NutrientStatsViewModelArg
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? data = null,}) {
  return _then(_NutrientStatsViewModelArg(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NutrientData,
  ));
}

/// Create a copy of NutrientStatsViewModelArg
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientDataCopyWith<$Res> get data {
  
  return $NutrientDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
