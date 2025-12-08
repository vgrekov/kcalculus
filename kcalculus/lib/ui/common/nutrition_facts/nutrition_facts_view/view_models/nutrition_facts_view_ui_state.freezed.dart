// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_view_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutritionFactsViewUiState implements DiagnosticableTreeMixin {

 List<NutritionFactsRecord> get records; int get selectedRecordIndex;
/// Create a copy of NutritionFactsViewUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionFactsViewUiStateCopyWith<NutritionFactsViewUiState> get copyWith => _$NutritionFactsViewUiStateCopyWithImpl<NutritionFactsViewUiState>(this as NutritionFactsViewUiState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NutritionFactsViewUiState'))
    ..add(DiagnosticsProperty('records', records))..add(DiagnosticsProperty('selectedRecordIndex', selectedRecordIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionFactsViewUiState&&const DeepCollectionEquality().equals(other.records, records)&&(identical(other.selectedRecordIndex, selectedRecordIndex) || other.selectedRecordIndex == selectedRecordIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(records),selectedRecordIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NutritionFactsViewUiState(records: $records, selectedRecordIndex: $selectedRecordIndex)';
}


}

/// @nodoc
abstract mixin class $NutritionFactsViewUiStateCopyWith<$Res>  {
  factory $NutritionFactsViewUiStateCopyWith(NutritionFactsViewUiState value, $Res Function(NutritionFactsViewUiState) _then) = _$NutritionFactsViewUiStateCopyWithImpl;
@useResult
$Res call({
 List<NutritionFactsRecord> records, int selectedRecordIndex
});




}
/// @nodoc
class _$NutritionFactsViewUiStateCopyWithImpl<$Res>
    implements $NutritionFactsViewUiStateCopyWith<$Res> {
  _$NutritionFactsViewUiStateCopyWithImpl(this._self, this._then);

  final NutritionFactsViewUiState _self;
  final $Res Function(NutritionFactsViewUiState) _then;

/// Create a copy of NutritionFactsViewUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? records = null,Object? selectedRecordIndex = null,}) {
  return _then(_self.copyWith(
records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<NutritionFactsRecord>,selectedRecordIndex: null == selectedRecordIndex ? _self.selectedRecordIndex : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionFactsViewUiState].
extension NutritionFactsViewUiStatePatterns on NutritionFactsViewUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionFactsViewUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionFactsViewUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionFactsViewUiState value)  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsViewUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionFactsViewUiState value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsViewUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NutritionFactsRecord> records,  int selectedRecordIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionFactsViewUiState() when $default != null:
return $default(_that.records,_that.selectedRecordIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NutritionFactsRecord> records,  int selectedRecordIndex)  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsViewUiState():
return $default(_that.records,_that.selectedRecordIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NutritionFactsRecord> records,  int selectedRecordIndex)?  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsViewUiState() when $default != null:
return $default(_that.records,_that.selectedRecordIndex);case _:
  return null;

}
}

}

/// @nodoc


class _NutritionFactsViewUiState extends NutritionFactsViewUiState with DiagnosticableTreeMixin {
  const _NutritionFactsViewUiState({required final  List<NutritionFactsRecord> records, required this.selectedRecordIndex}): _records = records,super._();
  

 final  List<NutritionFactsRecord> _records;
@override List<NutritionFactsRecord> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

@override final  int selectedRecordIndex;

/// Create a copy of NutritionFactsViewUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionFactsViewUiStateCopyWith<_NutritionFactsViewUiState> get copyWith => __$NutritionFactsViewUiStateCopyWithImpl<_NutritionFactsViewUiState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NutritionFactsViewUiState'))
    ..add(DiagnosticsProperty('records', records))..add(DiagnosticsProperty('selectedRecordIndex', selectedRecordIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionFactsViewUiState&&const DeepCollectionEquality().equals(other._records, _records)&&(identical(other.selectedRecordIndex, selectedRecordIndex) || other.selectedRecordIndex == selectedRecordIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_records),selectedRecordIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NutritionFactsViewUiState(records: $records, selectedRecordIndex: $selectedRecordIndex)';
}


}

/// @nodoc
abstract mixin class _$NutritionFactsViewUiStateCopyWith<$Res> implements $NutritionFactsViewUiStateCopyWith<$Res> {
  factory _$NutritionFactsViewUiStateCopyWith(_NutritionFactsViewUiState value, $Res Function(_NutritionFactsViewUiState) _then) = __$NutritionFactsViewUiStateCopyWithImpl;
@override @useResult
$Res call({
 List<NutritionFactsRecord> records, int selectedRecordIndex
});




}
/// @nodoc
class __$NutritionFactsViewUiStateCopyWithImpl<$Res>
    implements _$NutritionFactsViewUiStateCopyWith<$Res> {
  __$NutritionFactsViewUiStateCopyWithImpl(this._self, this._then);

  final _NutritionFactsViewUiState _self;
  final $Res Function(_NutritionFactsViewUiState) _then;

/// Create a copy of NutritionFactsViewUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? records = null,Object? selectedRecordIndex = null,}) {
  return _then(_NutritionFactsViewUiState(
records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<NutritionFactsRecord>,selectedRecordIndex: null == selectedRecordIndex ? _self.selectedRecordIndex : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
