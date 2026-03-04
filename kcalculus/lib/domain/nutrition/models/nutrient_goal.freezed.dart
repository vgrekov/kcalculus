// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientGoal {

 String? get id; Nutrient get nutrient; Amount get amount; DateTime? get createdAt; DateTime? get deletedAt;
/// Create a copy of NutrientGoal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientGoalCopyWith<NutrientGoal> get copyWith => _$NutrientGoalCopyWithImpl<NutrientGoal>(this as NutrientGoal, _$identity);

  /// Serializes this NutrientGoal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nutrient,amount,createdAt,deletedAt);

@override
String toString() {
  return 'NutrientGoal(id: $id, nutrient: $nutrient, amount: $amount, createdAt: $createdAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $NutrientGoalCopyWith<$Res>  {
  factory $NutrientGoalCopyWith(NutrientGoal value, $Res Function(NutrientGoal) _then) = _$NutrientGoalCopyWithImpl;
@useResult
$Res call({
 String? id, Nutrient nutrient, Amount amount, DateTime? createdAt, DateTime? deletedAt
});


$AmountCopyWith<$Res> get amount;

}
/// @nodoc
class _$NutrientGoalCopyWithImpl<$Res>
    implements $NutrientGoalCopyWith<$Res> {
  _$NutrientGoalCopyWithImpl(this._self, this._then);

  final NutrientGoal _self;
  final $Res Function(NutrientGoal) _then;

/// Create a copy of NutrientGoal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nutrient = null,Object? amount = null,Object? createdAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as Nutrient,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of NutrientGoal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get amount {
  
  return $AmountCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutrientGoal].
extension NutrientGoalPatterns on NutrientGoal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientGoal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientGoal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientGoal value)  $default,){
final _that = this;
switch (_that) {
case _NutrientGoal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientGoal value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientGoal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  Nutrient nutrient,  Amount amount,  DateTime? createdAt,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientGoal() when $default != null:
return $default(_that.id,_that.nutrient,_that.amount,_that.createdAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  Nutrient nutrient,  Amount amount,  DateTime? createdAt,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _NutrientGoal():
return $default(_that.id,_that.nutrient,_that.amount,_that.createdAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  Nutrient nutrient,  Amount amount,  DateTime? createdAt,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _NutrientGoal() when $default != null:
return $default(_that.id,_that.nutrient,_that.amount,_that.createdAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutrientGoal implements NutrientGoal {
  const _NutrientGoal({this.id, required this.nutrient, required this.amount, this.createdAt, this.deletedAt});
  factory _NutrientGoal.fromJson(Map<String, dynamic> json) => _$NutrientGoalFromJson(json);

@override final  String? id;
@override final  Nutrient nutrient;
@override final  Amount amount;
@override final  DateTime? createdAt;
@override final  DateTime? deletedAt;

/// Create a copy of NutrientGoal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientGoalCopyWith<_NutrientGoal> get copyWith => __$NutrientGoalCopyWithImpl<_NutrientGoal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrientGoalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nutrient,amount,createdAt,deletedAt);

@override
String toString() {
  return 'NutrientGoal(id: $id, nutrient: $nutrient, amount: $amount, createdAt: $createdAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$NutrientGoalCopyWith<$Res> implements $NutrientGoalCopyWith<$Res> {
  factory _$NutrientGoalCopyWith(_NutrientGoal value, $Res Function(_NutrientGoal) _then) = __$NutrientGoalCopyWithImpl;
@override @useResult
$Res call({
 String? id, Nutrient nutrient, Amount amount, DateTime? createdAt, DateTime? deletedAt
});


@override $AmountCopyWith<$Res> get amount;

}
/// @nodoc
class __$NutrientGoalCopyWithImpl<$Res>
    implements _$NutrientGoalCopyWith<$Res> {
  __$NutrientGoalCopyWithImpl(this._self, this._then);

  final _NutrientGoal _self;
  final $Res Function(_NutrientGoal) _then;

/// Create a copy of NutrientGoal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nutrient = null,Object? amount = null,Object? createdAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_NutrientGoal(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as Nutrient,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of NutrientGoal
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
