// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImportRecord {

 ImportState get state; ImportReport? get report;
/// Create a copy of ImportRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportRecordCopyWith<ImportRecord> get copyWith => _$ImportRecordCopyWithImpl<ImportRecord>(this as ImportRecord, _$identity);

  /// Serializes this ImportRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportRecord&&(identical(other.state, state) || other.state == state)&&(identical(other.report, report) || other.report == report));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,report);

@override
String toString() {
  return 'ImportRecord(state: $state, report: $report)';
}


}

/// @nodoc
abstract mixin class $ImportRecordCopyWith<$Res>  {
  factory $ImportRecordCopyWith(ImportRecord value, $Res Function(ImportRecord) _then) = _$ImportRecordCopyWithImpl;
@useResult
$Res call({
 ImportState state, ImportReport? report
});


$ImportReportCopyWith<$Res>? get report;

}
/// @nodoc
class _$ImportRecordCopyWithImpl<$Res>
    implements $ImportRecordCopyWith<$Res> {
  _$ImportRecordCopyWithImpl(this._self, this._then);

  final ImportRecord _self;
  final $Res Function(ImportRecord) _then;

/// Create a copy of ImportRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? report = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ImportState,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ImportReport?,
  ));
}
/// Create a copy of ImportRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportReportCopyWith<$Res>? get report {
    if (_self.report == null) {
    return null;
  }

  return $ImportReportCopyWith<$Res>(_self.report!, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}


/// Adds pattern-matching-related methods to [ImportRecord].
extension ImportRecordPatterns on ImportRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportRecord value)  $default,){
final _that = this;
switch (_that) {
case _ImportRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ImportRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImportState state,  ImportReport? report)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportRecord() when $default != null:
return $default(_that.state,_that.report);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImportState state,  ImportReport? report)  $default,) {final _that = this;
switch (_that) {
case _ImportRecord():
return $default(_that.state,_that.report);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImportState state,  ImportReport? report)?  $default,) {final _that = this;
switch (_that) {
case _ImportRecord() when $default != null:
return $default(_that.state,_that.report);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImportRecord extends ImportRecord {
  const _ImportRecord({required this.state, this.report}): super._();
  factory _ImportRecord.fromJson(Map<String, dynamic> json) => _$ImportRecordFromJson(json);

@override final  ImportState state;
@override final  ImportReport? report;

/// Create a copy of ImportRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportRecordCopyWith<_ImportRecord> get copyWith => __$ImportRecordCopyWithImpl<_ImportRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImportRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportRecord&&(identical(other.state, state) || other.state == state)&&(identical(other.report, report) || other.report == report));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,report);

@override
String toString() {
  return 'ImportRecord(state: $state, report: $report)';
}


}

/// @nodoc
abstract mixin class _$ImportRecordCopyWith<$Res> implements $ImportRecordCopyWith<$Res> {
  factory _$ImportRecordCopyWith(_ImportRecord value, $Res Function(_ImportRecord) _then) = __$ImportRecordCopyWithImpl;
@override @useResult
$Res call({
 ImportState state, ImportReport? report
});


@override $ImportReportCopyWith<$Res>? get report;

}
/// @nodoc
class __$ImportRecordCopyWithImpl<$Res>
    implements _$ImportRecordCopyWith<$Res> {
  __$ImportRecordCopyWithImpl(this._self, this._then);

  final _ImportRecord _self;
  final $Res Function(_ImportRecord) _then;

/// Create a copy of ImportRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? report = freezed,}) {
  return _then(_ImportRecord(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ImportState,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ImportReport?,
  ));
}

/// Create a copy of ImportRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportReportCopyWith<$Res>? get report {
    if (_self.report == null) {
    return null;
  }

  return $ImportReportCopyWith<$Res>(_self.report!, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}

// dart format on
