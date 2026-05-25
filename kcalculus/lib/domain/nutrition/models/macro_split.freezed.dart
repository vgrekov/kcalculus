// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'macro_split.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MacroSplit {

 double get fatPercentage; double get carbsPercentage; double get proteinPercentage;
/// Create a copy of MacroSplit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MacroSplitCopyWith<MacroSplit> get copyWith => _$MacroSplitCopyWithImpl<MacroSplit>(this as MacroSplit, _$identity);

  /// Serializes this MacroSplit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MacroSplit&&(identical(other.fatPercentage, fatPercentage) || other.fatPercentage == fatPercentage)&&(identical(other.carbsPercentage, carbsPercentage) || other.carbsPercentage == carbsPercentage)&&(identical(other.proteinPercentage, proteinPercentage) || other.proteinPercentage == proteinPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fatPercentage,carbsPercentage,proteinPercentage);

@override
String toString() {
  return 'MacroSplit(fatPercentage: $fatPercentage, carbsPercentage: $carbsPercentage, proteinPercentage: $proteinPercentage)';
}


}

/// @nodoc
abstract mixin class $MacroSplitCopyWith<$Res>  {
  factory $MacroSplitCopyWith(MacroSplit value, $Res Function(MacroSplit) _then) = _$MacroSplitCopyWithImpl;
@useResult
$Res call({
 double fatPercentage, double carbsPercentage, double proteinPercentage
});




}
/// @nodoc
class _$MacroSplitCopyWithImpl<$Res>
    implements $MacroSplitCopyWith<$Res> {
  _$MacroSplitCopyWithImpl(this._self, this._then);

  final MacroSplit _self;
  final $Res Function(MacroSplit) _then;

/// Create a copy of MacroSplit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fatPercentage = null,Object? carbsPercentage = null,Object? proteinPercentage = null,}) {
  return _then(_self.copyWith(
fatPercentage: null == fatPercentage ? _self.fatPercentage : fatPercentage // ignore: cast_nullable_to_non_nullable
as double,carbsPercentage: null == carbsPercentage ? _self.carbsPercentage : carbsPercentage // ignore: cast_nullable_to_non_nullable
as double,proteinPercentage: null == proteinPercentage ? _self.proteinPercentage : proteinPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MacroSplit].
extension MacroSplitPatterns on MacroSplit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MacroSplit value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MacroSplit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MacroSplit value)  $default,}){
final _that = this;
switch (_that) {
case _MacroSplit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MacroSplit value)?  $default,}){
final _that = this;
switch (_that) {
case _MacroSplit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double fatPercentage,  double carbsPercentage,  double proteinPercentage)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MacroSplit() when $default != null:
return $default(_that.fatPercentage,_that.carbsPercentage,_that.proteinPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double fatPercentage,  double carbsPercentage,  double proteinPercentage)  $default,}) {final _that = this;
switch (_that) {
case _MacroSplit():
return $default(_that.fatPercentage,_that.carbsPercentage,_that.proteinPercentage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double fatPercentage,  double carbsPercentage,  double proteinPercentage)?  $default,}) {final _that = this;
switch (_that) {
case _MacroSplit() when $default != null:
return $default(_that.fatPercentage,_that.carbsPercentage,_that.proteinPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MacroSplit implements MacroSplit {
  const _MacroSplit({required this.fatPercentage, required this.carbsPercentage, required this.proteinPercentage});
  factory _MacroSplit.fromJson(Map<String, dynamic> json) => _$MacroSplitFromJson(json);

@override final  double fatPercentage;
@override final  double carbsPercentage;
@override final  double proteinPercentage;

/// Create a copy of MacroSplit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MacroSplitCopyWith<_MacroSplit> get copyWith => __$MacroSplitCopyWithImpl<_MacroSplit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MacroSplitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MacroSplit&&(identical(other.fatPercentage, fatPercentage) || other.fatPercentage == fatPercentage)&&(identical(other.carbsPercentage, carbsPercentage) || other.carbsPercentage == carbsPercentage)&&(identical(other.proteinPercentage, proteinPercentage) || other.proteinPercentage == proteinPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fatPercentage,carbsPercentage,proteinPercentage);

@override
String toString() {
  return 'MacroSplit.\$default(fatPercentage: $fatPercentage, carbsPercentage: $carbsPercentage, proteinPercentage: $proteinPercentage)';
}


}

/// @nodoc
abstract mixin class _$MacroSplitCopyWith<$Res> implements $MacroSplitCopyWith<$Res> {
  factory _$MacroSplitCopyWith(_MacroSplit value, $Res Function(_MacroSplit) _then) = __$MacroSplitCopyWithImpl;
@override @useResult
$Res call({
 double fatPercentage, double carbsPercentage, double proteinPercentage
});




}
/// @nodoc
class __$MacroSplitCopyWithImpl<$Res>
    implements _$MacroSplitCopyWith<$Res> {
  __$MacroSplitCopyWithImpl(this._self, this._then);

  final _MacroSplit _self;
  final $Res Function(_MacroSplit) _then;

/// Create a copy of MacroSplit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fatPercentage = null,Object? carbsPercentage = null,Object? proteinPercentage = null,}) {
  return _then(_MacroSplit(
fatPercentage: null == fatPercentage ? _self.fatPercentage : fatPercentage // ignore: cast_nullable_to_non_nullable
as double,carbsPercentage: null == carbsPercentage ? _self.carbsPercentage : carbsPercentage // ignore: cast_nullable_to_non_nullable
as double,proteinPercentage: null == proteinPercentage ? _self.proteinPercentage : proteinPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
