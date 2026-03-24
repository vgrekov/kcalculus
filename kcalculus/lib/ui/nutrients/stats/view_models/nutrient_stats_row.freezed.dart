// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_stats_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutrientStatsRow {

 Nutrient get nutrient; Amount get amount; Amount? get goalAmount; List<NutrientStatsRow> get children;
/// Create a copy of NutrientStatsRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientStatsRowCopyWith<NutrientStatsRow> get copyWith => _$NutrientStatsRowCopyWithImpl<NutrientStatsRow>(this as NutrientStatsRow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientStatsRow&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.goalAmount, goalAmount) || other.goalAmount == goalAmount)&&const DeepCollectionEquality().equals(other.children, children));
}


@override
int get hashCode => Object.hash(runtimeType,nutrient,amount,goalAmount,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'NutrientStatsRow(nutrient: $nutrient, amount: $amount, goalAmount: $goalAmount, children: $children)';
}


}

/// @nodoc
abstract mixin class $NutrientStatsRowCopyWith<$Res>  {
  factory $NutrientStatsRowCopyWith(NutrientStatsRow value, $Res Function(NutrientStatsRow) _then) = _$NutrientStatsRowCopyWithImpl;
@useResult
$Res call({
 Nutrient nutrient, Amount amount, Amount? goalAmount, List<NutrientStatsRow> children
});


$AmountCopyWith<$Res> get amount;$AmountCopyWith<$Res>? get goalAmount;

}
/// @nodoc
class _$NutrientStatsRowCopyWithImpl<$Res>
    implements $NutrientStatsRowCopyWith<$Res> {
  _$NutrientStatsRowCopyWithImpl(this._self, this._then);

  final NutrientStatsRow _self;
  final $Res Function(NutrientStatsRow) _then;

/// Create a copy of NutrientStatsRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutrient = null,Object? amount = null,Object? goalAmount = freezed,Object? children = null,}) {
  return _then(_self.copyWith(
nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as Nutrient,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,goalAmount: freezed == goalAmount ? _self.goalAmount : goalAmount // ignore: cast_nullable_to_non_nullable
as Amount?,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<NutrientStatsRow>,
  ));
}
/// Create a copy of NutrientStatsRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get amount {
  
  return $AmountCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of NutrientStatsRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res>? get goalAmount {
    if (_self.goalAmount == null) {
    return null;
  }

  return $AmountCopyWith<$Res>(_self.goalAmount!, (value) {
    return _then(_self.copyWith(goalAmount: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutrientStatsRow].
extension NutrientStatsRowPatterns on NutrientStatsRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientStatsRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientStatsRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientStatsRow value)  $default,){
final _that = this;
switch (_that) {
case _NutrientStatsRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientStatsRow value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientStatsRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Nutrient nutrient,  Amount amount,  Amount? goalAmount,  List<NutrientStatsRow> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientStatsRow() when $default != null:
return $default(_that.nutrient,_that.amount,_that.goalAmount,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Nutrient nutrient,  Amount amount,  Amount? goalAmount,  List<NutrientStatsRow> children)  $default,) {final _that = this;
switch (_that) {
case _NutrientStatsRow():
return $default(_that.nutrient,_that.amount,_that.goalAmount,_that.children);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Nutrient nutrient,  Amount amount,  Amount? goalAmount,  List<NutrientStatsRow> children)?  $default,) {final _that = this;
switch (_that) {
case _NutrientStatsRow() when $default != null:
return $default(_that.nutrient,_that.amount,_that.goalAmount,_that.children);case _:
  return null;

}
}

}

/// @nodoc


class _NutrientStatsRow implements NutrientStatsRow {
  const _NutrientStatsRow({required this.nutrient, required this.amount, this.goalAmount, final  List<NutrientStatsRow> children = const []}): _children = children;
  

@override final  Nutrient nutrient;
@override final  Amount amount;
@override final  Amount? goalAmount;
 final  List<NutrientStatsRow> _children;
@override@JsonKey() List<NutrientStatsRow> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of NutrientStatsRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientStatsRowCopyWith<_NutrientStatsRow> get copyWith => __$NutrientStatsRowCopyWithImpl<_NutrientStatsRow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientStatsRow&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.goalAmount, goalAmount) || other.goalAmount == goalAmount)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,nutrient,amount,goalAmount,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'NutrientStatsRow(nutrient: $nutrient, amount: $amount, goalAmount: $goalAmount, children: $children)';
}


}

/// @nodoc
abstract mixin class _$NutrientStatsRowCopyWith<$Res> implements $NutrientStatsRowCopyWith<$Res> {
  factory _$NutrientStatsRowCopyWith(_NutrientStatsRow value, $Res Function(_NutrientStatsRow) _then) = __$NutrientStatsRowCopyWithImpl;
@override @useResult
$Res call({
 Nutrient nutrient, Amount amount, Amount? goalAmount, List<NutrientStatsRow> children
});


@override $AmountCopyWith<$Res> get amount;@override $AmountCopyWith<$Res>? get goalAmount;

}
/// @nodoc
class __$NutrientStatsRowCopyWithImpl<$Res>
    implements _$NutrientStatsRowCopyWith<$Res> {
  __$NutrientStatsRowCopyWithImpl(this._self, this._then);

  final _NutrientStatsRow _self;
  final $Res Function(_NutrientStatsRow) _then;

/// Create a copy of NutrientStatsRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutrient = null,Object? amount = null,Object? goalAmount = freezed,Object? children = null,}) {
  return _then(_NutrientStatsRow(
nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as Nutrient,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,goalAmount: freezed == goalAmount ? _self.goalAmount : goalAmount // ignore: cast_nullable_to_non_nullable
as Amount?,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<NutrientStatsRow>,
  ));
}

/// Create a copy of NutrientStatsRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get amount {
  
  return $AmountCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of NutrientStatsRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res>? get goalAmount {
    if (_self.goalAmount == null) {
    return null;
  }

  return $AmountCopyWith<$Res>(_self.goalAmount!, (value) {
    return _then(_self.copyWith(goalAmount: value));
  });
}
}

// dart format on
