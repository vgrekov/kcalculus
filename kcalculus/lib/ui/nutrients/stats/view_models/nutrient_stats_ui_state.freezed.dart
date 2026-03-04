// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_stats_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutrientStatsUiState {

 DateTime get date; NutrientData get data; List<NutrientStatsRow> get rows;
/// Create a copy of NutrientStatsUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientStatsUiStateCopyWith<NutrientStatsUiState> get copyWith => _$NutrientStatsUiStateCopyWithImpl<NutrientStatsUiState>(this as NutrientStatsUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientStatsUiState&&(identical(other.date, date) || other.date == date)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.rows, rows));
}


@override
int get hashCode => Object.hash(runtimeType,date,data,const DeepCollectionEquality().hash(rows));

@override
String toString() {
  return 'NutrientStatsUiState(date: $date, data: $data, rows: $rows)';
}


}

/// @nodoc
abstract mixin class $NutrientStatsUiStateCopyWith<$Res>  {
  factory $NutrientStatsUiStateCopyWith(NutrientStatsUiState value, $Res Function(NutrientStatsUiState) _then) = _$NutrientStatsUiStateCopyWithImpl;
@useResult
$Res call({
 DateTime date, NutrientData data, List<NutrientStatsRow> rows
});


$NutrientDataCopyWith<$Res> get data;

}
/// @nodoc
class _$NutrientStatsUiStateCopyWithImpl<$Res>
    implements $NutrientStatsUiStateCopyWith<$Res> {
  _$NutrientStatsUiStateCopyWithImpl(this._self, this._then);

  final NutrientStatsUiState _self;
  final $Res Function(NutrientStatsUiState) _then;

/// Create a copy of NutrientStatsUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? data = null,Object? rows = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NutrientData,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<NutrientStatsRow>,
  ));
}
/// Create a copy of NutrientStatsUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientDataCopyWith<$Res> get data {
  
  return $NutrientDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutrientStatsUiState].
extension NutrientStatsUiStatePatterns on NutrientStatsUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NutrientStatsUiState value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientStatsUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NutrientStatsUiState value)  $default,}){
final _that = this;
switch (_that) {
case _NutrientStatsUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NutrientStatsUiState value)?  $default,}){
final _that = this;
switch (_that) {
case _NutrientStatsUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime date,  NutrientData data,  List<NutrientStatsRow> rows)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientStatsUiState() when $default != null:
return $default(_that.date,_that.data,_that.rows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime date,  NutrientData data,  List<NutrientStatsRow> rows)  $default,}) {final _that = this;
switch (_that) {
case _NutrientStatsUiState():
return $default(_that.date,_that.data,_that.rows);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime date,  NutrientData data,  List<NutrientStatsRow> rows)?  $default,}) {final _that = this;
switch (_that) {
case _NutrientStatsUiState() when $default != null:
return $default(_that.date,_that.data,_that.rows);case _:
  return null;

}
}

}

/// @nodoc


class _NutrientStatsUiState implements NutrientStatsUiState {
  const _NutrientStatsUiState({required this.date, required this.data, required final  List<NutrientStatsRow> rows}): _rows = rows;
  

@override final  DateTime date;
@override final  NutrientData data;
 final  List<NutrientStatsRow> _rows;
@override List<NutrientStatsRow> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}


/// Create a copy of NutrientStatsUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientStatsUiStateCopyWith<_NutrientStatsUiState> get copyWith => __$NutrientStatsUiStateCopyWithImpl<_NutrientStatsUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientStatsUiState&&(identical(other.date, date) || other.date == date)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._rows, _rows));
}


@override
int get hashCode => Object.hash(runtimeType,date,data,const DeepCollectionEquality().hash(_rows));

@override
String toString() {
  return 'NutrientStatsUiState.\$default(date: $date, data: $data, rows: $rows)';
}


}

/// @nodoc
abstract mixin class _$NutrientStatsUiStateCopyWith<$Res> implements $NutrientStatsUiStateCopyWith<$Res> {
  factory _$NutrientStatsUiStateCopyWith(_NutrientStatsUiState value, $Res Function(_NutrientStatsUiState) _then) = __$NutrientStatsUiStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, NutrientData data, List<NutrientStatsRow> rows
});


@override $NutrientDataCopyWith<$Res> get data;

}
/// @nodoc
class __$NutrientStatsUiStateCopyWithImpl<$Res>
    implements _$NutrientStatsUiStateCopyWith<$Res> {
  __$NutrientStatsUiStateCopyWithImpl(this._self, this._then);

  final _NutrientStatsUiState _self;
  final $Res Function(_NutrientStatsUiState) _then;

/// Create a copy of NutrientStatsUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? data = null,Object? rows = null,}) {
  return _then(_NutrientStatsUiState(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NutrientData,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<NutrientStatsRow>,
  ));
}

/// Create a copy of NutrientStatsUiState
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
