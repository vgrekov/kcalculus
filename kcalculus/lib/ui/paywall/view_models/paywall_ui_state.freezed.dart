// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paywall_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaywallUiState {

 SubscriptionState get subscriptionState; bool get isProcessing;
/// Create a copy of PaywallUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaywallUiStateCopyWith<PaywallUiState> get copyWith => _$PaywallUiStateCopyWithImpl<PaywallUiState>(this as PaywallUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallUiState&&(identical(other.subscriptionState, subscriptionState) || other.subscriptionState == subscriptionState)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing));
}


@override
int get hashCode => Object.hash(runtimeType,subscriptionState,isProcessing);

@override
String toString() {
  return 'PaywallUiState(subscriptionState: $subscriptionState, isProcessing: $isProcessing)';
}


}

/// @nodoc
abstract mixin class $PaywallUiStateCopyWith<$Res>  {
  factory $PaywallUiStateCopyWith(PaywallUiState value, $Res Function(PaywallUiState) _then) = _$PaywallUiStateCopyWithImpl;
@useResult
$Res call({
 SubscriptionState subscriptionState, bool isProcessing
});




}
/// @nodoc
class _$PaywallUiStateCopyWithImpl<$Res>
    implements $PaywallUiStateCopyWith<$Res> {
  _$PaywallUiStateCopyWithImpl(this._self, this._then);

  final PaywallUiState _self;
  final $Res Function(PaywallUiState) _then;

/// Create a copy of PaywallUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subscriptionState = null,Object? isProcessing = null,}) {
  return _then(_self.copyWith(
subscriptionState: null == subscriptionState ? _self.subscriptionState : subscriptionState // ignore: cast_nullable_to_non_nullable
as SubscriptionState,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaywallUiState].
extension PaywallUiStatePatterns on PaywallUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaywallUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaywallUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaywallUiState value)  $default,){
final _that = this;
switch (_that) {
case _PaywallUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaywallUiState value)?  $default,){
final _that = this;
switch (_that) {
case _PaywallUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubscriptionState subscriptionState,  bool isProcessing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaywallUiState() when $default != null:
return $default(_that.subscriptionState,_that.isProcessing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubscriptionState subscriptionState,  bool isProcessing)  $default,) {final _that = this;
switch (_that) {
case _PaywallUiState():
return $default(_that.subscriptionState,_that.isProcessing);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubscriptionState subscriptionState,  bool isProcessing)?  $default,) {final _that = this;
switch (_that) {
case _PaywallUiState() when $default != null:
return $default(_that.subscriptionState,_that.isProcessing);case _:
  return null;

}
}

}

/// @nodoc


class _PaywallUiState implements PaywallUiState {
  const _PaywallUiState({required this.subscriptionState, this.isProcessing = false});
  

@override final  SubscriptionState subscriptionState;
@override@JsonKey() final  bool isProcessing;

/// Create a copy of PaywallUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaywallUiStateCopyWith<_PaywallUiState> get copyWith => __$PaywallUiStateCopyWithImpl<_PaywallUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaywallUiState&&(identical(other.subscriptionState, subscriptionState) || other.subscriptionState == subscriptionState)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing));
}


@override
int get hashCode => Object.hash(runtimeType,subscriptionState,isProcessing);

@override
String toString() {
  return 'PaywallUiState(subscriptionState: $subscriptionState, isProcessing: $isProcessing)';
}


}

/// @nodoc
abstract mixin class _$PaywallUiStateCopyWith<$Res> implements $PaywallUiStateCopyWith<$Res> {
  factory _$PaywallUiStateCopyWith(_PaywallUiState value, $Res Function(_PaywallUiState) _then) = __$PaywallUiStateCopyWithImpl;
@override @useResult
$Res call({
 SubscriptionState subscriptionState, bool isProcessing
});




}
/// @nodoc
class __$PaywallUiStateCopyWithImpl<$Res>
    implements _$PaywallUiStateCopyWith<$Res> {
  __$PaywallUiStateCopyWithImpl(this._self, this._then);

  final _PaywallUiState _self;
  final $Res Function(_PaywallUiState) _then;

/// Create a copy of PaywallUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subscriptionState = null,Object? isProcessing = null,}) {
  return _then(_PaywallUiState(
subscriptionState: null == subscriptionState ? _self.subscriptionState : subscriptionState // ignore: cast_nullable_to_non_nullable
as SubscriptionState,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
