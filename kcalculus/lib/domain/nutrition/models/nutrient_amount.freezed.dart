// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_amount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientAmount {

 Nutrient get nutrient; Amount get amount;
/// Create a copy of NutrientAmount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientAmountCopyWith<NutrientAmount> get copyWith => _$NutrientAmountCopyWithImpl<NutrientAmount>(this as NutrientAmount, _$identity);

  /// Serializes this NutrientAmount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientAmount&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutrient,amount);

@override
String toString() {
  return 'NutrientAmount(nutrient: $nutrient, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $NutrientAmountCopyWith<$Res>  {
  factory $NutrientAmountCopyWith(NutrientAmount value, $Res Function(NutrientAmount) _then) = _$NutrientAmountCopyWithImpl;
@useResult
$Res call({
 Nutrient nutrient, Amount amount
});


$AmountCopyWith<$Res> get amount;

}
/// @nodoc
class _$NutrientAmountCopyWithImpl<$Res>
    implements $NutrientAmountCopyWith<$Res> {
  _$NutrientAmountCopyWithImpl(this._self, this._then);

  final NutrientAmount _self;
  final $Res Function(NutrientAmount) _then;

/// Create a copy of NutrientAmount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutrient = null,Object? amount = null,}) {
  return _then(_self.copyWith(
nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as Nutrient,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,
  ));
}
/// Create a copy of NutrientAmount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get amount {
  
  return $AmountCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutrientAmount].
extension NutrientAmountPatterns on NutrientAmount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientAmount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientAmount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientAmount value)  $default,){
final _that = this;
switch (_that) {
case _NutrientAmount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientAmount value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientAmount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Nutrient nutrient,  Amount amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientAmount() when $default != null:
return $default(_that.nutrient,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Nutrient nutrient,  Amount amount)  $default,) {final _that = this;
switch (_that) {
case _NutrientAmount():
return $default(_that.nutrient,_that.amount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Nutrient nutrient,  Amount amount)?  $default,) {final _that = this;
switch (_that) {
case _NutrientAmount() when $default != null:
return $default(_that.nutrient,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutrientAmount extends NutrientAmount {
  const _NutrientAmount({required this.nutrient, required this.amount}): super._();
  factory _NutrientAmount.fromJson(Map<String, dynamic> json) => _$NutrientAmountFromJson(json);

@override final  Nutrient nutrient;
@override final  Amount amount;

/// Create a copy of NutrientAmount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientAmountCopyWith<_NutrientAmount> get copyWith => __$NutrientAmountCopyWithImpl<_NutrientAmount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrientAmountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientAmount&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutrient,amount);

@override
String toString() {
  return 'NutrientAmount(nutrient: $nutrient, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$NutrientAmountCopyWith<$Res> implements $NutrientAmountCopyWith<$Res> {
  factory _$NutrientAmountCopyWith(_NutrientAmount value, $Res Function(_NutrientAmount) _then) = __$NutrientAmountCopyWithImpl;
@override @useResult
$Res call({
 Nutrient nutrient, Amount amount
});


@override $AmountCopyWith<$Res> get amount;

}
/// @nodoc
class __$NutrientAmountCopyWithImpl<$Res>
    implements _$NutrientAmountCopyWith<$Res> {
  __$NutrientAmountCopyWithImpl(this._self, this._then);

  final _NutrientAmount _self;
  final $Res Function(_NutrientAmount) _then;

/// Create a copy of NutrientAmount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutrient = null,Object? amount = null,}) {
  return _then(_NutrientAmount(
nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as Nutrient,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,
  ));
}

/// Create a copy of NutrientAmount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get amount {
  
  return $AmountCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}

// dart format on
