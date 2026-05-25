// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportUiState {

 ImportProcess get importProcess; bool get isImportRunning;
/// Create a copy of ImportUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportUiStateCopyWith<ImportUiState> get copyWith => _$ImportUiStateCopyWithImpl<ImportUiState>(this as ImportUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportUiState&&(identical(other.importProcess, importProcess) || other.importProcess == importProcess)&&(identical(other.isImportRunning, isImportRunning) || other.isImportRunning == isImportRunning));
}


@override
int get hashCode => Object.hash(runtimeType,importProcess,isImportRunning);

@override
String toString() {
  return 'ImportUiState(importProcess: $importProcess, isImportRunning: $isImportRunning)';
}


}

/// @nodoc
abstract mixin class $ImportUiStateCopyWith<$Res>  {
  factory $ImportUiStateCopyWith(ImportUiState value, $Res Function(ImportUiState) _then) = _$ImportUiStateCopyWithImpl;
@useResult
$Res call({
 ImportProcess importProcess, bool isImportRunning
});




}
/// @nodoc
class _$ImportUiStateCopyWithImpl<$Res>
    implements $ImportUiStateCopyWith<$Res> {
  _$ImportUiStateCopyWithImpl(this._self, this._then);

  final ImportUiState _self;
  final $Res Function(ImportUiState) _then;

/// Create a copy of ImportUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? importProcess = null,Object? isImportRunning = null,}) {
  return _then(_self.copyWith(
importProcess: null == importProcess ? _self.importProcess : importProcess // ignore: cast_nullable_to_non_nullable
as ImportProcess,isImportRunning: null == isImportRunning ? _self.isImportRunning : isImportRunning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportUiState].
extension ImportUiStatePatterns on ImportUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportUiState value)  $default,){
final _that = this;
switch (_that) {
case _ImportUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportUiState value)?  $default,){
final _that = this;
switch (_that) {
case _ImportUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImportProcess importProcess,  bool isImportRunning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportUiState() when $default != null:
return $default(_that.importProcess,_that.isImportRunning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImportProcess importProcess,  bool isImportRunning)  $default,) {final _that = this;
switch (_that) {
case _ImportUiState():
return $default(_that.importProcess,_that.isImportRunning);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImportProcess importProcess,  bool isImportRunning)?  $default,) {final _that = this;
switch (_that) {
case _ImportUiState() when $default != null:
return $default(_that.importProcess,_that.isImportRunning);case _:
  return null;

}
}

}

/// @nodoc


class _ImportUiState implements ImportUiState {
  const _ImportUiState({required this.importProcess, required this.isImportRunning});
  

@override final  ImportProcess importProcess;
@override final  bool isImportRunning;

/// Create a copy of ImportUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportUiStateCopyWith<_ImportUiState> get copyWith => __$ImportUiStateCopyWithImpl<_ImportUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportUiState&&(identical(other.importProcess, importProcess) || other.importProcess == importProcess)&&(identical(other.isImportRunning, isImportRunning) || other.isImportRunning == isImportRunning));
}


@override
int get hashCode => Object.hash(runtimeType,importProcess,isImportRunning);

@override
String toString() {
  return 'ImportUiState(importProcess: $importProcess, isImportRunning: $isImportRunning)';
}


}

/// @nodoc
abstract mixin class _$ImportUiStateCopyWith<$Res> implements $ImportUiStateCopyWith<$Res> {
  factory _$ImportUiStateCopyWith(_ImportUiState value, $Res Function(_ImportUiState) _then) = __$ImportUiStateCopyWithImpl;
@override @useResult
$Res call({
 ImportProcess importProcess, bool isImportRunning
});




}
/// @nodoc
class __$ImportUiStateCopyWithImpl<$Res>
    implements _$ImportUiStateCopyWith<$Res> {
  __$ImportUiStateCopyWithImpl(this._self, this._then);

  final _ImportUiState _self;
  final $Res Function(_ImportUiState) _then;

/// Create a copy of ImportUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? importProcess = null,Object? isImportRunning = null,}) {
  return _then(_ImportUiState(
importProcess: null == importProcess ? _self.importProcess : importProcess // ignore: cast_nullable_to_non_nullable
as ImportProcess,isImportRunning: null == isImportRunning ? _self.isImportRunning : isImportRunning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
