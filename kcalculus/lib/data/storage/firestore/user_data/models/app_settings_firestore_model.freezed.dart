// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingsFirestoreModel {

 String? get themeName; bool? get crashlyticsEnabled; bool? get analyticsEnabled; int? get signedAgreementVersion; bool? get scannerDisclaimerEnabled;
/// Create a copy of AppSettingsFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsFirestoreModelCopyWith<AppSettingsFirestoreModel> get copyWith => _$AppSettingsFirestoreModelCopyWithImpl<AppSettingsFirestoreModel>(this as AppSettingsFirestoreModel, _$identity);

  /// Serializes this AppSettingsFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsFirestoreModel&&(identical(other.themeName, themeName) || other.themeName == themeName)&&(identical(other.crashlyticsEnabled, crashlyticsEnabled) || other.crashlyticsEnabled == crashlyticsEnabled)&&(identical(other.analyticsEnabled, analyticsEnabled) || other.analyticsEnabled == analyticsEnabled)&&(identical(other.signedAgreementVersion, signedAgreementVersion) || other.signedAgreementVersion == signedAgreementVersion)&&(identical(other.scannerDisclaimerEnabled, scannerDisclaimerEnabled) || other.scannerDisclaimerEnabled == scannerDisclaimerEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeName,crashlyticsEnabled,analyticsEnabled,signedAgreementVersion,scannerDisclaimerEnabled);

@override
String toString() {
  return 'AppSettingsFirestoreModel(themeName: $themeName, crashlyticsEnabled: $crashlyticsEnabled, analyticsEnabled: $analyticsEnabled, signedAgreementVersion: $signedAgreementVersion, scannerDisclaimerEnabled: $scannerDisclaimerEnabled)';
}


}

/// @nodoc
abstract mixin class $AppSettingsFirestoreModelCopyWith<$Res>  {
  factory $AppSettingsFirestoreModelCopyWith(AppSettingsFirestoreModel value, $Res Function(AppSettingsFirestoreModel) _then) = _$AppSettingsFirestoreModelCopyWithImpl;
@useResult
$Res call({
 String? themeName, bool? crashlyticsEnabled, bool? analyticsEnabled, int? signedAgreementVersion, bool? scannerDisclaimerEnabled
});




}
/// @nodoc
class _$AppSettingsFirestoreModelCopyWithImpl<$Res>
    implements $AppSettingsFirestoreModelCopyWith<$Res> {
  _$AppSettingsFirestoreModelCopyWithImpl(this._self, this._then);

  final AppSettingsFirestoreModel _self;
  final $Res Function(AppSettingsFirestoreModel) _then;

/// Create a copy of AppSettingsFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeName = freezed,Object? crashlyticsEnabled = freezed,Object? analyticsEnabled = freezed,Object? signedAgreementVersion = freezed,Object? scannerDisclaimerEnabled = freezed,}) {
  return _then(_self.copyWith(
themeName: freezed == themeName ? _self.themeName : themeName // ignore: cast_nullable_to_non_nullable
as String?,crashlyticsEnabled: freezed == crashlyticsEnabled ? _self.crashlyticsEnabled : crashlyticsEnabled // ignore: cast_nullable_to_non_nullable
as bool?,analyticsEnabled: freezed == analyticsEnabled ? _self.analyticsEnabled : analyticsEnabled // ignore: cast_nullable_to_non_nullable
as bool?,signedAgreementVersion: freezed == signedAgreementVersion ? _self.signedAgreementVersion : signedAgreementVersion // ignore: cast_nullable_to_non_nullable
as int?,scannerDisclaimerEnabled: freezed == scannerDisclaimerEnabled ? _self.scannerDisclaimerEnabled : scannerDisclaimerEnabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingsFirestoreModel].
extension AppSettingsFirestoreModelPatterns on AppSettingsFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingsFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingsFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingsFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingsFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingsFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingsFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? themeName,  bool? crashlyticsEnabled,  bool? analyticsEnabled,  int? signedAgreementVersion,  bool? scannerDisclaimerEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingsFirestoreModel() when $default != null:
return $default(_that.themeName,_that.crashlyticsEnabled,_that.analyticsEnabled,_that.signedAgreementVersion,_that.scannerDisclaimerEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? themeName,  bool? crashlyticsEnabled,  bool? analyticsEnabled,  int? signedAgreementVersion,  bool? scannerDisclaimerEnabled)  $default,) {final _that = this;
switch (_that) {
case _AppSettingsFirestoreModel():
return $default(_that.themeName,_that.crashlyticsEnabled,_that.analyticsEnabled,_that.signedAgreementVersion,_that.scannerDisclaimerEnabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? themeName,  bool? crashlyticsEnabled,  bool? analyticsEnabled,  int? signedAgreementVersion,  bool? scannerDisclaimerEnabled)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingsFirestoreModel() when $default != null:
return $default(_that.themeName,_that.crashlyticsEnabled,_that.analyticsEnabled,_that.signedAgreementVersion,_that.scannerDisclaimerEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettingsFirestoreModel extends AppSettingsFirestoreModel {
  const _AppSettingsFirestoreModel({this.themeName, this.crashlyticsEnabled, this.analyticsEnabled, this.signedAgreementVersion, this.scannerDisclaimerEnabled}): super._();
  factory _AppSettingsFirestoreModel.fromJson(Map<String, dynamic> json) => _$AppSettingsFirestoreModelFromJson(json);

@override final  String? themeName;
@override final  bool? crashlyticsEnabled;
@override final  bool? analyticsEnabled;
@override final  int? signedAgreementVersion;
@override final  bool? scannerDisclaimerEnabled;

/// Create a copy of AppSettingsFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsFirestoreModelCopyWith<_AppSettingsFirestoreModel> get copyWith => __$AppSettingsFirestoreModelCopyWithImpl<_AppSettingsFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsFirestoreModel&&(identical(other.themeName, themeName) || other.themeName == themeName)&&(identical(other.crashlyticsEnabled, crashlyticsEnabled) || other.crashlyticsEnabled == crashlyticsEnabled)&&(identical(other.analyticsEnabled, analyticsEnabled) || other.analyticsEnabled == analyticsEnabled)&&(identical(other.signedAgreementVersion, signedAgreementVersion) || other.signedAgreementVersion == signedAgreementVersion)&&(identical(other.scannerDisclaimerEnabled, scannerDisclaimerEnabled) || other.scannerDisclaimerEnabled == scannerDisclaimerEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeName,crashlyticsEnabled,analyticsEnabled,signedAgreementVersion,scannerDisclaimerEnabled);

@override
String toString() {
  return 'AppSettingsFirestoreModel(themeName: $themeName, crashlyticsEnabled: $crashlyticsEnabled, analyticsEnabled: $analyticsEnabled, signedAgreementVersion: $signedAgreementVersion, scannerDisclaimerEnabled: $scannerDisclaimerEnabled)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsFirestoreModelCopyWith<$Res> implements $AppSettingsFirestoreModelCopyWith<$Res> {
  factory _$AppSettingsFirestoreModelCopyWith(_AppSettingsFirestoreModel value, $Res Function(_AppSettingsFirestoreModel) _then) = __$AppSettingsFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
 String? themeName, bool? crashlyticsEnabled, bool? analyticsEnabled, int? signedAgreementVersion, bool? scannerDisclaimerEnabled
});




}
/// @nodoc
class __$AppSettingsFirestoreModelCopyWithImpl<$Res>
    implements _$AppSettingsFirestoreModelCopyWith<$Res> {
  __$AppSettingsFirestoreModelCopyWithImpl(this._self, this._then);

  final _AppSettingsFirestoreModel _self;
  final $Res Function(_AppSettingsFirestoreModel) _then;

/// Create a copy of AppSettingsFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeName = freezed,Object? crashlyticsEnabled = freezed,Object? analyticsEnabled = freezed,Object? signedAgreementVersion = freezed,Object? scannerDisclaimerEnabled = freezed,}) {
  return _then(_AppSettingsFirestoreModel(
themeName: freezed == themeName ? _self.themeName : themeName // ignore: cast_nullable_to_non_nullable
as String?,crashlyticsEnabled: freezed == crashlyticsEnabled ? _self.crashlyticsEnabled : crashlyticsEnabled // ignore: cast_nullable_to_non_nullable
as bool?,analyticsEnabled: freezed == analyticsEnabled ? _self.analyticsEnabled : analyticsEnabled // ignore: cast_nullable_to_non_nullable
as bool?,signedAgreementVersion: freezed == signedAgreementVersion ? _self.signedAgreementVersion : signedAgreementVersion // ignore: cast_nullable_to_non_nullable
as int?,scannerDisclaimerEnabled: freezed == scannerDisclaimerEnabled ? _self.scannerDisclaimerEnabled : scannerDisclaimerEnabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
