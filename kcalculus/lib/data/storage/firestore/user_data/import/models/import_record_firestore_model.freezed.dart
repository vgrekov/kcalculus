// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_record_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImportRecordFirestoreModel {

 ImportState get state; ImportReport? get report;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? get createdAt;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? get updatedAt;
/// Create a copy of ImportRecordFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportRecordFirestoreModelCopyWith<ImportRecordFirestoreModel> get copyWith => _$ImportRecordFirestoreModelCopyWithImpl<ImportRecordFirestoreModel>(this as ImportRecordFirestoreModel, _$identity);

  /// Serializes this ImportRecordFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportRecordFirestoreModel&&(identical(other.state, state) || other.state == state)&&(identical(other.report, report) || other.report == report)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,report,createdAt,updatedAt);

@override
String toString() {
  return 'ImportRecordFirestoreModel(state: $state, report: $report, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ImportRecordFirestoreModelCopyWith<$Res>  {
  factory $ImportRecordFirestoreModelCopyWith(ImportRecordFirestoreModel value, $Res Function(ImportRecordFirestoreModel) _then) = _$ImportRecordFirestoreModelCopyWithImpl;
@useResult
$Res call({
 ImportState state, ImportReport? report,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? createdAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? updatedAt
});


$ImportReportCopyWith<$Res>? get report;

}
/// @nodoc
class _$ImportRecordFirestoreModelCopyWithImpl<$Res>
    implements $ImportRecordFirestoreModelCopyWith<$Res> {
  _$ImportRecordFirestoreModelCopyWithImpl(this._self, this._then);

  final ImportRecordFirestoreModel _self;
  final $Res Function(ImportRecordFirestoreModel) _then;

/// Create a copy of ImportRecordFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? report = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ImportState,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ImportReport?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ImportRecordFirestoreModel
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


/// Adds pattern-matching-related methods to [ImportRecordFirestoreModel].
extension ImportRecordFirestoreModelPatterns on ImportRecordFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportRecordFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportRecordFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportRecordFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _ImportRecordFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportRecordFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImportRecordFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImportState state,  ImportReport? report, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportRecordFirestoreModel() when $default != null:
return $default(_that.state,_that.report,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImportState state,  ImportReport? report, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ImportRecordFirestoreModel():
return $default(_that.state,_that.report,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImportState state,  ImportReport? report, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ImportRecordFirestoreModel() when $default != null:
return $default(_that.state,_that.report,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImportRecordFirestoreModel extends ImportRecordFirestoreModel {
  const _ImportRecordFirestoreModel({required this.state, this.report, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() this.createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() this.updatedAt}): super._();
  factory _ImportRecordFirestoreModel.fromJson(Map<String, dynamic> json) => _$ImportRecordFirestoreModelFromJson(json);

@override final  ImportState state;
@override final  ImportReport? report;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() final  DateTime? createdAt;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() final  DateTime? updatedAt;

/// Create a copy of ImportRecordFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportRecordFirestoreModelCopyWith<_ImportRecordFirestoreModel> get copyWith => __$ImportRecordFirestoreModelCopyWithImpl<_ImportRecordFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImportRecordFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportRecordFirestoreModel&&(identical(other.state, state) || other.state == state)&&(identical(other.report, report) || other.report == report)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,report,createdAt,updatedAt);

@override
String toString() {
  return 'ImportRecordFirestoreModel(state: $state, report: $report, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ImportRecordFirestoreModelCopyWith<$Res> implements $ImportRecordFirestoreModelCopyWith<$Res> {
  factory _$ImportRecordFirestoreModelCopyWith(_ImportRecordFirestoreModel value, $Res Function(_ImportRecordFirestoreModel) _then) = __$ImportRecordFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
 ImportState state, ImportReport? report,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? createdAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? updatedAt
});


@override $ImportReportCopyWith<$Res>? get report;

}
/// @nodoc
class __$ImportRecordFirestoreModelCopyWithImpl<$Res>
    implements _$ImportRecordFirestoreModelCopyWith<$Res> {
  __$ImportRecordFirestoreModelCopyWithImpl(this._self, this._then);

  final _ImportRecordFirestoreModel _self;
  final $Res Function(_ImportRecordFirestoreModel) _then;

/// Create a copy of ImportRecordFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? report = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ImportRecordFirestoreModel(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ImportState,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ImportReport?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ImportRecordFirestoreModel
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
