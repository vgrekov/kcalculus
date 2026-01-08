// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDataFirestoreModel {

@JsonKey(includeToJson: false) String get id; AppSettingsFirestoreModel? get settings; List<String>? get defaultNutrients;@JsonKey(includeToJson: false) SearchConfigFirestoreModel? get searchConfig;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get createdAt;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get updatedAt;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get deletedAt;
/// Create a copy of UserDataFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataFirestoreModelCopyWith<UserDataFirestoreModel> get copyWith => _$UserDataFirestoreModelCopyWithImpl<UserDataFirestoreModel>(this as UserDataFirestoreModel, _$identity);

  /// Serializes this UserDataFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDataFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.settings, settings) || other.settings == settings)&&const DeepCollectionEquality().equals(other.defaultNutrients, defaultNutrients)&&(identical(other.searchConfig, searchConfig) || other.searchConfig == searchConfig)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,settings,const DeepCollectionEquality().hash(defaultNutrients),searchConfig,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'UserDataFirestoreModel(id: $id, settings: $settings, defaultNutrients: $defaultNutrients, searchConfig: $searchConfig, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $UserDataFirestoreModelCopyWith<$Res>  {
  factory $UserDataFirestoreModelCopyWith(UserDataFirestoreModel value, $Res Function(UserDataFirestoreModel) _then) = _$UserDataFirestoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, AppSettingsFirestoreModel? settings, List<String>? defaultNutrients,@JsonKey(includeToJson: false) SearchConfigFirestoreModel? searchConfig,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? createdAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? updatedAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? deletedAt
});


$AppSettingsFirestoreModelCopyWith<$Res>? get settings;$SearchConfigFirestoreModelCopyWith<$Res>? get searchConfig;

}
/// @nodoc
class _$UserDataFirestoreModelCopyWithImpl<$Res>
    implements $UserDataFirestoreModelCopyWith<$Res> {
  _$UserDataFirestoreModelCopyWithImpl(this._self, this._then);

  final UserDataFirestoreModel _self;
  final $Res Function(UserDataFirestoreModel) _then;

/// Create a copy of UserDataFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? settings = freezed,Object? defaultNutrients = freezed,Object? searchConfig = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettingsFirestoreModel?,defaultNutrients: freezed == defaultNutrients ? _self.defaultNutrients : defaultNutrients // ignore: cast_nullable_to_non_nullable
as List<String>?,searchConfig: freezed == searchConfig ? _self.searchConfig : searchConfig // ignore: cast_nullable_to_non_nullable
as SearchConfigFirestoreModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of UserDataFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSettingsFirestoreModelCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $AppSettingsFirestoreModelCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of UserDataFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchConfigFirestoreModelCopyWith<$Res>? get searchConfig {
    if (_self.searchConfig == null) {
    return null;
  }

  return $SearchConfigFirestoreModelCopyWith<$Res>(_self.searchConfig!, (value) {
    return _then(_self.copyWith(searchConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserDataFirestoreModel].
extension UserDataFirestoreModelPatterns on UserDataFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDataFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDataFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDataFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDataFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDataFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDataFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  AppSettingsFirestoreModel? settings,  List<String>? defaultNutrients, @JsonKey(includeToJson: false)  SearchConfigFirestoreModel? searchConfig, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? createdAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? updatedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDataFirestoreModel() when $default != null:
return $default(_that.id,_that.settings,_that.defaultNutrients,_that.searchConfig,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  AppSettingsFirestoreModel? settings,  List<String>? defaultNutrients, @JsonKey(includeToJson: false)  SearchConfigFirestoreModel? searchConfig, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? createdAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? updatedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _UserDataFirestoreModel():
return $default(_that.id,_that.settings,_that.defaultNutrients,_that.searchConfig,_that.createdAt,_that.updatedAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id,  AppSettingsFirestoreModel? settings,  List<String>? defaultNutrients, @JsonKey(includeToJson: false)  SearchConfigFirestoreModel? searchConfig, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? createdAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? updatedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserDataFirestoreModel() when $default != null:
return $default(_that.id,_that.settings,_that.defaultNutrients,_that.searchConfig,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDataFirestoreModel extends UserDataFirestoreModel {
  const _UserDataFirestoreModel({@JsonKey(includeToJson: false) required this.id, this.settings, final  List<String>? defaultNutrients, @JsonKey(includeToJson: false) this.searchConfig, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.createdAt, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.updatedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.deletedAt}): _defaultNutrients = defaultNutrients,super._();
  factory _UserDataFirestoreModel.fromJson(Map<String, dynamic> json) => _$UserDataFirestoreModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override final  AppSettingsFirestoreModel? settings;
 final  List<String>? _defaultNutrients;
@override List<String>? get defaultNutrients {
  final value = _defaultNutrients;
  if (value == null) return null;
  if (_defaultNutrients is EqualUnmodifiableListView) return _defaultNutrients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(includeToJson: false) final  SearchConfigFirestoreModel? searchConfig;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? createdAt;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? updatedAt;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? deletedAt;

/// Create a copy of UserDataFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataFirestoreModelCopyWith<_UserDataFirestoreModel> get copyWith => __$UserDataFirestoreModelCopyWithImpl<_UserDataFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDataFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.settings, settings) || other.settings == settings)&&const DeepCollectionEquality().equals(other._defaultNutrients, _defaultNutrients)&&(identical(other.searchConfig, searchConfig) || other.searchConfig == searchConfig)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,settings,const DeepCollectionEquality().hash(_defaultNutrients),searchConfig,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'UserDataFirestoreModel(id: $id, settings: $settings, defaultNutrients: $defaultNutrients, searchConfig: $searchConfig, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$UserDataFirestoreModelCopyWith<$Res> implements $UserDataFirestoreModelCopyWith<$Res> {
  factory _$UserDataFirestoreModelCopyWith(_UserDataFirestoreModel value, $Res Function(_UserDataFirestoreModel) _then) = __$UserDataFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, AppSettingsFirestoreModel? settings, List<String>? defaultNutrients,@JsonKey(includeToJson: false) SearchConfigFirestoreModel? searchConfig,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? createdAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? updatedAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? deletedAt
});


@override $AppSettingsFirestoreModelCopyWith<$Res>? get settings;@override $SearchConfigFirestoreModelCopyWith<$Res>? get searchConfig;

}
/// @nodoc
class __$UserDataFirestoreModelCopyWithImpl<$Res>
    implements _$UserDataFirestoreModelCopyWith<$Res> {
  __$UserDataFirestoreModelCopyWithImpl(this._self, this._then);

  final _UserDataFirestoreModel _self;
  final $Res Function(_UserDataFirestoreModel) _then;

/// Create a copy of UserDataFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? settings = freezed,Object? defaultNutrients = freezed,Object? searchConfig = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_UserDataFirestoreModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettingsFirestoreModel?,defaultNutrients: freezed == defaultNutrients ? _self._defaultNutrients : defaultNutrients // ignore: cast_nullable_to_non_nullable
as List<String>?,searchConfig: freezed == searchConfig ? _self.searchConfig : searchConfig // ignore: cast_nullable_to_non_nullable
as SearchConfigFirestoreModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of UserDataFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSettingsFirestoreModelCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $AppSettingsFirestoreModelCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of UserDataFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchConfigFirestoreModelCopyWith<$Res>? get searchConfig {
    if (_self.searchConfig == null) {
    return null;
  }

  return $SearchConfigFirestoreModelCopyWith<$Res>(_self.searchConfig!, (value) {
    return _then(_self.copyWith(searchConfig: value));
  });
}
}

// dart format on
