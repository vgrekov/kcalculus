// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_list_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealListUiState {

 DateTime get date; FutureOr<List<Meal>> get data; bool get showCalendar; Amount? get energyGoalAmount;
/// Create a copy of MealListUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealListUiStateCopyWith<MealListUiState> get copyWith => _$MealListUiStateCopyWithImpl<MealListUiState>(this as MealListUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealListUiState&&(identical(other.date, date) || other.date == date)&&(identical(other.data, data) || other.data == data)&&(identical(other.showCalendar, showCalendar) || other.showCalendar == showCalendar)&&(identical(other.energyGoalAmount, energyGoalAmount) || other.energyGoalAmount == energyGoalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,date,data,showCalendar,energyGoalAmount);

@override
String toString() {
  return 'MealListUiState(date: $date, data: $data, showCalendar: $showCalendar, energyGoalAmount: $energyGoalAmount)';
}


}

/// @nodoc
abstract mixin class $MealListUiStateCopyWith<$Res>  {
  factory $MealListUiStateCopyWith(MealListUiState value, $Res Function(MealListUiState) _then) = _$MealListUiStateCopyWithImpl;
@useResult
$Res call({
 DateTime date, FutureOr<List<Meal>> data, bool showCalendar, Amount? energyGoalAmount
});


$AmountCopyWith<$Res>? get energyGoalAmount;

}
/// @nodoc
class _$MealListUiStateCopyWithImpl<$Res>
    implements $MealListUiStateCopyWith<$Res> {
  _$MealListUiStateCopyWithImpl(this._self, this._then);

  final MealListUiState _self;
  final $Res Function(MealListUiState) _then;

/// Create a copy of MealListUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? data = null,Object? showCalendar = null,Object? energyGoalAmount = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FutureOr<List<Meal>>,showCalendar: null == showCalendar ? _self.showCalendar : showCalendar // ignore: cast_nullable_to_non_nullable
as bool,energyGoalAmount: freezed == energyGoalAmount ? _self.energyGoalAmount : energyGoalAmount // ignore: cast_nullable_to_non_nullable
as Amount?,
  ));
}
/// Create a copy of MealListUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res>? get energyGoalAmount {
    if (_self.energyGoalAmount == null) {
    return null;
  }

  return $AmountCopyWith<$Res>(_self.energyGoalAmount!, (value) {
    return _then(_self.copyWith(energyGoalAmount: value));
  });
}
}


/// Adds pattern-matching-related methods to [MealListUiState].
extension MealListUiStatePatterns on MealListUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealListUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealListUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealListUiState value)  $default,){
final _that = this;
switch (_that) {
case _MealListUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealListUiState value)?  $default,){
final _that = this;
switch (_that) {
case _MealListUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  FutureOr<List<Meal>> data,  bool showCalendar,  Amount? energyGoalAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealListUiState() when $default != null:
return $default(_that.date,_that.data,_that.showCalendar,_that.energyGoalAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  FutureOr<List<Meal>> data,  bool showCalendar,  Amount? energyGoalAmount)  $default,) {final _that = this;
switch (_that) {
case _MealListUiState():
return $default(_that.date,_that.data,_that.showCalendar,_that.energyGoalAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  FutureOr<List<Meal>> data,  bool showCalendar,  Amount? energyGoalAmount)?  $default,) {final _that = this;
switch (_that) {
case _MealListUiState() when $default != null:
return $default(_that.date,_that.data,_that.showCalendar,_that.energyGoalAmount);case _:
  return null;

}
}

}

/// @nodoc


class _MealListUiState implements MealListUiState {
  const _MealListUiState({required this.date, required this.data, required this.showCalendar, this.energyGoalAmount});
  

@override final  DateTime date;
@override final  FutureOr<List<Meal>> data;
@override final  bool showCalendar;
@override final  Amount? energyGoalAmount;

/// Create a copy of MealListUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealListUiStateCopyWith<_MealListUiState> get copyWith => __$MealListUiStateCopyWithImpl<_MealListUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealListUiState&&(identical(other.date, date) || other.date == date)&&(identical(other.data, data) || other.data == data)&&(identical(other.showCalendar, showCalendar) || other.showCalendar == showCalendar)&&(identical(other.energyGoalAmount, energyGoalAmount) || other.energyGoalAmount == energyGoalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,date,data,showCalendar,energyGoalAmount);

@override
String toString() {
  return 'MealListUiState(date: $date, data: $data, showCalendar: $showCalendar, energyGoalAmount: $energyGoalAmount)';
}


}

/// @nodoc
abstract mixin class _$MealListUiStateCopyWith<$Res> implements $MealListUiStateCopyWith<$Res> {
  factory _$MealListUiStateCopyWith(_MealListUiState value, $Res Function(_MealListUiState) _then) = __$MealListUiStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, FutureOr<List<Meal>> data, bool showCalendar, Amount? energyGoalAmount
});


@override $AmountCopyWith<$Res>? get energyGoalAmount;

}
/// @nodoc
class __$MealListUiStateCopyWithImpl<$Res>
    implements _$MealListUiStateCopyWith<$Res> {
  __$MealListUiStateCopyWithImpl(this._self, this._then);

  final _MealListUiState _self;
  final $Res Function(_MealListUiState) _then;

/// Create a copy of MealListUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? data = null,Object? showCalendar = null,Object? energyGoalAmount = freezed,}) {
  return _then(_MealListUiState(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FutureOr<List<Meal>>,showCalendar: null == showCalendar ? _self.showCalendar : showCalendar // ignore: cast_nullable_to_non_nullable
as bool,energyGoalAmount: freezed == energyGoalAmount ? _self.energyGoalAmount : energyGoalAmount // ignore: cast_nullable_to_non_nullable
as Amount?,
  ));
}

/// Create a copy of MealListUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res>? get energyGoalAmount {
    if (_self.energyGoalAmount == null) {
    return null;
  }

  return $AmountCopyWith<$Res>(_self.energyGoalAmount!, (value) {
    return _then(_self.copyWith(energyGoalAmount: value));
  });
}
}

// dart format on
