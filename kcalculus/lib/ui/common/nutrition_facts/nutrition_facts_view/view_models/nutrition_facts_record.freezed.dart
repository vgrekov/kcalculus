// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutritionFactsRecord {

 Amount get perAmount; List<NutrientNode> get nodes;
/// Create a copy of NutritionFactsRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionFactsRecordCopyWith<NutritionFactsRecord> get copyWith => _$NutritionFactsRecordCopyWithImpl<NutritionFactsRecord>(this as NutritionFactsRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionFactsRecord&&(identical(other.perAmount, perAmount) || other.perAmount == perAmount)&&const DeepCollectionEquality().equals(other.nodes, nodes));
}


@override
int get hashCode => Object.hash(runtimeType,perAmount,const DeepCollectionEquality().hash(nodes));

@override
String toString() {
  return 'NutritionFactsRecord(perAmount: $perAmount, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class $NutritionFactsRecordCopyWith<$Res>  {
  factory $NutritionFactsRecordCopyWith(NutritionFactsRecord value, $Res Function(NutritionFactsRecord) _then) = _$NutritionFactsRecordCopyWithImpl;
@useResult
$Res call({
 Amount perAmount, List<NutrientNode> nodes
});


$AmountCopyWith<$Res> get perAmount;

}
/// @nodoc
class _$NutritionFactsRecordCopyWithImpl<$Res>
    implements $NutritionFactsRecordCopyWith<$Res> {
  _$NutritionFactsRecordCopyWithImpl(this._self, this._then);

  final NutritionFactsRecord _self;
  final $Res Function(NutritionFactsRecord) _then;

/// Create a copy of NutritionFactsRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? perAmount = null,Object? nodes = null,}) {
  return _then(_self.copyWith(
perAmount: null == perAmount ? _self.perAmount : perAmount // ignore: cast_nullable_to_non_nullable
as Amount,nodes: null == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<NutrientNode>,
  ));
}
/// Create a copy of NutritionFactsRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get perAmount {
  
  return $AmountCopyWith<$Res>(_self.perAmount, (value) {
    return _then(_self.copyWith(perAmount: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutritionFactsRecord].
extension NutritionFactsRecordPatterns on NutritionFactsRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionFactsRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionFactsRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionFactsRecord value)  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionFactsRecord value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Amount perAmount,  List<NutrientNode> nodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionFactsRecord() when $default != null:
return $default(_that.perAmount,_that.nodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Amount perAmount,  List<NutrientNode> nodes)  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsRecord():
return $default(_that.perAmount,_that.nodes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Amount perAmount,  List<NutrientNode> nodes)?  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsRecord() when $default != null:
return $default(_that.perAmount,_that.nodes);case _:
  return null;

}
}

}

/// @nodoc


class _NutritionFactsRecord implements NutritionFactsRecord {
  const _NutritionFactsRecord({required this.perAmount, required final  List<NutrientNode> nodes}): _nodes = nodes;
  

@override final  Amount perAmount;
 final  List<NutrientNode> _nodes;
@override List<NutrientNode> get nodes {
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nodes);
}


/// Create a copy of NutritionFactsRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionFactsRecordCopyWith<_NutritionFactsRecord> get copyWith => __$NutritionFactsRecordCopyWithImpl<_NutritionFactsRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionFactsRecord&&(identical(other.perAmount, perAmount) || other.perAmount == perAmount)&&const DeepCollectionEquality().equals(other._nodes, _nodes));
}


@override
int get hashCode => Object.hash(runtimeType,perAmount,const DeepCollectionEquality().hash(_nodes));

@override
String toString() {
  return 'NutritionFactsRecord(perAmount: $perAmount, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class _$NutritionFactsRecordCopyWith<$Res> implements $NutritionFactsRecordCopyWith<$Res> {
  factory _$NutritionFactsRecordCopyWith(_NutritionFactsRecord value, $Res Function(_NutritionFactsRecord) _then) = __$NutritionFactsRecordCopyWithImpl;
@override @useResult
$Res call({
 Amount perAmount, List<NutrientNode> nodes
});


@override $AmountCopyWith<$Res> get perAmount;

}
/// @nodoc
class __$NutritionFactsRecordCopyWithImpl<$Res>
    implements _$NutritionFactsRecordCopyWith<$Res> {
  __$NutritionFactsRecordCopyWithImpl(this._self, this._then);

  final _NutritionFactsRecord _self;
  final $Res Function(_NutritionFactsRecord) _then;

/// Create a copy of NutritionFactsRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? perAmount = null,Object? nodes = null,}) {
  return _then(_NutritionFactsRecord(
perAmount: null == perAmount ? _self.perAmount : perAmount // ignore: cast_nullable_to_non_nullable
as Amount,nodes: null == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<NutrientNode>,
  ));
}

/// Create a copy of NutritionFactsRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get perAmount {
  
  return $AmountCopyWith<$Res>(_self.perAmount, (value) {
    return _then(_self.copyWith(perAmount: value));
  });
}
}

// dart format on
