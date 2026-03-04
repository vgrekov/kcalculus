// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutrientNode {

 Nutrient get nutrient; Amount get amount; int get level;
/// Create a copy of NutrientNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientNodeCopyWith<NutrientNode> get copyWith => _$NutrientNodeCopyWithImpl<NutrientNode>(this as NutrientNode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientNode&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,nutrient,amount,level);

@override
String toString() {
  return 'NutrientNode(nutrient: $nutrient, amount: $amount, level: $level)';
}


}

/// @nodoc
abstract mixin class $NutrientNodeCopyWith<$Res>  {
  factory $NutrientNodeCopyWith(NutrientNode value, $Res Function(NutrientNode) _then) = _$NutrientNodeCopyWithImpl;
@useResult
$Res call({
 Nutrient nutrient, Amount amount, int level
});


$AmountCopyWith<$Res> get amount;

}
/// @nodoc
class _$NutrientNodeCopyWithImpl<$Res>
    implements $NutrientNodeCopyWith<$Res> {
  _$NutrientNodeCopyWithImpl(this._self, this._then);

  final NutrientNode _self;
  final $Res Function(NutrientNode) _then;

/// Create a copy of NutrientNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutrient = null,Object? amount = null,Object? level = null,}) {
  return _then(_self.copyWith(
nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as Nutrient,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of NutrientNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get amount {
  
  return $AmountCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutrientNode].
extension NutrientNodePatterns on NutrientNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientNode value)  $default,){
final _that = this;
switch (_that) {
case _NutrientNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientNode value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Nutrient nutrient,  Amount amount,  int level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientNode() when $default != null:
return $default(_that.nutrient,_that.amount,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Nutrient nutrient,  Amount amount,  int level)  $default,) {final _that = this;
switch (_that) {
case _NutrientNode():
return $default(_that.nutrient,_that.amount,_that.level);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Nutrient nutrient,  Amount amount,  int level)?  $default,) {final _that = this;
switch (_that) {
case _NutrientNode() when $default != null:
return $default(_that.nutrient,_that.amount,_that.level);case _:
  return null;

}
}

}

/// @nodoc


class _NutrientNode implements NutrientNode {
  const _NutrientNode({required this.nutrient, required this.amount, this.level = 0});
  

@override final  Nutrient nutrient;
@override final  Amount amount;
@override@JsonKey() final  int level;

/// Create a copy of NutrientNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientNodeCopyWith<_NutrientNode> get copyWith => __$NutrientNodeCopyWithImpl<_NutrientNode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientNode&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,nutrient,amount,level);

@override
String toString() {
  return 'NutrientNode(nutrient: $nutrient, amount: $amount, level: $level)';
}


}

/// @nodoc
abstract mixin class _$NutrientNodeCopyWith<$Res> implements $NutrientNodeCopyWith<$Res> {
  factory _$NutrientNodeCopyWith(_NutrientNode value, $Res Function(_NutrientNode) _then) = __$NutrientNodeCopyWithImpl;
@override @useResult
$Res call({
 Nutrient nutrient, Amount amount, int level
});


@override $AmountCopyWith<$Res> get amount;

}
/// @nodoc
class __$NutrientNodeCopyWithImpl<$Res>
    implements _$NutrientNodeCopyWith<$Res> {
  __$NutrientNodeCopyWithImpl(this._self, this._then);

  final _NutrientNode _self;
  final $Res Function(_NutrientNode) _then;

/// Create a copy of NutrientNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutrient = null,Object? amount = null,Object? level = null,}) {
  return _then(_NutrientNode(
nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as Nutrient,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of NutrientNode
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
