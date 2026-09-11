// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lifecycle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LifecycleState {

 AppLifecycleState? get currentAppState; Map<AppLifecycleState, bool> get triggers;
/// Create a copy of LifecycleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LifecycleStateCopyWith<LifecycleState> get copyWith => _$LifecycleStateCopyWithImpl<LifecycleState>(this as LifecycleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LifecycleState&&(identical(other.currentAppState, currentAppState) || other.currentAppState == currentAppState)&&const DeepCollectionEquality().equals(other.triggers, triggers));
}


@override
int get hashCode => Object.hash(runtimeType,currentAppState,const DeepCollectionEquality().hash(triggers));

@override
String toString() {
  return 'LifecycleState(currentAppState: $currentAppState, triggers: $triggers)';
}


}

/// @nodoc
abstract mixin class $LifecycleStateCopyWith<$Res>  {
  factory $LifecycleStateCopyWith(LifecycleState value, $Res Function(LifecycleState) _then) = _$LifecycleStateCopyWithImpl;
@useResult
$Res call({
 AppLifecycleState? currentAppState, Map<AppLifecycleState, bool> triggers
});




}
/// @nodoc
class _$LifecycleStateCopyWithImpl<$Res>
    implements $LifecycleStateCopyWith<$Res> {
  _$LifecycleStateCopyWithImpl(this._self, this._then);

  final LifecycleState _self;
  final $Res Function(LifecycleState) _then;

/// Create a copy of LifecycleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentAppState = freezed,Object? triggers = null,}) {
  return _then(_self.copyWith(
currentAppState: freezed == currentAppState ? _self.currentAppState : currentAppState // ignore: cast_nullable_to_non_nullable
as AppLifecycleState?,triggers: null == triggers ? _self.triggers : triggers // ignore: cast_nullable_to_non_nullable
as Map<AppLifecycleState, bool>,
  ));
}

}


/// Adds pattern-matching-related methods to [LifecycleState].
extension LifecycleStatePatterns on LifecycleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LifecycleState value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LifecycleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LifecycleState value)  $default,}){
final _that = this;
switch (_that) {
case _LifecycleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LifecycleState value)?  $default,}){
final _that = this;
switch (_that) {
case _LifecycleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppLifecycleState? currentAppState,  Map<AppLifecycleState, bool> triggers)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LifecycleState() when $default != null:
return $default(_that.currentAppState,_that.triggers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppLifecycleState? currentAppState,  Map<AppLifecycleState, bool> triggers)  $default,}) {final _that = this;
switch (_that) {
case _LifecycleState():
return $default(_that.currentAppState,_that.triggers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppLifecycleState? currentAppState,  Map<AppLifecycleState, bool> triggers)?  $default,}) {final _that = this;
switch (_that) {
case _LifecycleState() when $default != null:
return $default(_that.currentAppState,_that.triggers);case _:
  return null;

}
}

}

/// @nodoc


class _LifecycleState extends LifecycleState {
  const _LifecycleState({required this.currentAppState, required final  Map<AppLifecycleState, bool> triggers}): _triggers = triggers,super._();
  

@override final  AppLifecycleState? currentAppState;
 final  Map<AppLifecycleState, bool> _triggers;
@override Map<AppLifecycleState, bool> get triggers {
  if (_triggers is EqualUnmodifiableMapView) return _triggers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_triggers);
}


/// Create a copy of LifecycleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LifecycleStateCopyWith<_LifecycleState> get copyWith => __$LifecycleStateCopyWithImpl<_LifecycleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LifecycleState&&(identical(other.currentAppState, currentAppState) || other.currentAppState == currentAppState)&&const DeepCollectionEquality().equals(other._triggers, _triggers));
}


@override
int get hashCode => Object.hash(runtimeType,currentAppState,const DeepCollectionEquality().hash(_triggers));

@override
String toString() {
  return 'LifecycleState.\$default(currentAppState: $currentAppState, triggers: $triggers)';
}


}

/// @nodoc
abstract mixin class _$LifecycleStateCopyWith<$Res> implements $LifecycleStateCopyWith<$Res> {
  factory _$LifecycleStateCopyWith(_LifecycleState value, $Res Function(_LifecycleState) _then) = __$LifecycleStateCopyWithImpl;
@override @useResult
$Res call({
 AppLifecycleState? currentAppState, Map<AppLifecycleState, bool> triggers
});




}
/// @nodoc
class __$LifecycleStateCopyWithImpl<$Res>
    implements _$LifecycleStateCopyWith<$Res> {
  __$LifecycleStateCopyWithImpl(this._self, this._then);

  final _LifecycleState _self;
  final $Res Function(_LifecycleState) _then;

/// Create a copy of LifecycleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentAppState = freezed,Object? triggers = null,}) {
  return _then(_LifecycleState(
currentAppState: freezed == currentAppState ? _self.currentAppState : currentAppState // ignore: cast_nullable_to_non_nullable
as AppLifecycleState?,triggers: null == triggers ? _self._triggers : triggers // ignore: cast_nullable_to_non_nullable
as Map<AppLifecycleState, bool>,
  ));
}


}

// dart format on
