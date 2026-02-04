// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImportProgress {

 int get imported; int? get total;
/// Create a copy of ImportProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportProgressCopyWith<ImportProgress> get copyWith => _$ImportProgressCopyWithImpl<ImportProgress>(this as ImportProgress, _$identity);

  /// Serializes this ImportProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportProgress&&(identical(other.imported, imported) || other.imported == imported)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imported,total);

@override
String toString() {
  return 'ImportProgress(imported: $imported, total: $total)';
}


}

/// @nodoc
abstract mixin class $ImportProgressCopyWith<$Res>  {
  factory $ImportProgressCopyWith(ImportProgress value, $Res Function(ImportProgress) _then) = _$ImportProgressCopyWithImpl;
@useResult
$Res call({
 int imported, int? total
});




}
/// @nodoc
class _$ImportProgressCopyWithImpl<$Res>
    implements $ImportProgressCopyWith<$Res> {
  _$ImportProgressCopyWithImpl(this._self, this._then);

  final ImportProgress _self;
  final $Res Function(ImportProgress) _then;

/// Create a copy of ImportProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imported = null,Object? total = freezed,}) {
  return _then(_self.copyWith(
imported: null == imported ? _self.imported : imported // ignore: cast_nullable_to_non_nullable
as int,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportProgress].
extension ImportProgressPatterns on ImportProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ImportProgress value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ImportProgress value)  $default,}){
final _that = this;
switch (_that) {
case _ImportProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ImportProgress value)?  $default,}){
final _that = this;
switch (_that) {
case _ImportProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int imported,  int? total)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportProgress() when $default != null:
return $default(_that.imported,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int imported,  int? total)  $default,}) {final _that = this;
switch (_that) {
case _ImportProgress():
return $default(_that.imported,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int imported,  int? total)?  $default,}) {final _that = this;
switch (_that) {
case _ImportProgress() when $default != null:
return $default(_that.imported,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImportProgress implements ImportProgress {
  const _ImportProgress({required this.imported, this.total});
  factory _ImportProgress.fromJson(Map<String, dynamic> json) => _$ImportProgressFromJson(json);

@override final  int imported;
@override final  int? total;

/// Create a copy of ImportProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportProgressCopyWith<_ImportProgress> get copyWith => __$ImportProgressCopyWithImpl<_ImportProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImportProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportProgress&&(identical(other.imported, imported) || other.imported == imported)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imported,total);

@override
String toString() {
  return 'ImportProgress.\$default(imported: $imported, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ImportProgressCopyWith<$Res> implements $ImportProgressCopyWith<$Res> {
  factory _$ImportProgressCopyWith(_ImportProgress value, $Res Function(_ImportProgress) _then) = __$ImportProgressCopyWithImpl;
@override @useResult
$Res call({
 int imported, int? total
});




}
/// @nodoc
class __$ImportProgressCopyWithImpl<$Res>
    implements _$ImportProgressCopyWith<$Res> {
  __$ImportProgressCopyWithImpl(this._self, this._then);

  final _ImportProgress _self;
  final $Res Function(_ImportProgress) _then;

/// Create a copy of ImportProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imported = null,Object? total = freezed,}) {
  return _then(_ImportProgress(
imported: null == imported ? _self.imported : imported // ignore: cast_nullable_to_non_nullable
as int,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
