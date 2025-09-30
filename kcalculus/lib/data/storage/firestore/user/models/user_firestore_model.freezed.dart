// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserFirestoreModel {
  @JsonKey(includeToJson: false)
  String get id;
  AppSettingsFirestoreModel? get settings;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get createdAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get updatedAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get deletedAt;

  /// Create a copy of UserFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserFirestoreModelCopyWith<UserFirestoreModel> get copyWith =>
      _$UserFirestoreModelCopyWithImpl<UserFirestoreModel>(
          this as UserFirestoreModel, _$identity);

  /// Serializes this UserFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, settings, createdAt, updatedAt, deletedAt);

  @override
  String toString() {
    return 'UserFirestoreModel(id: $id, settings: $settings, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $UserFirestoreModelCopyWith<$Res> {
  factory $UserFirestoreModelCopyWith(
          UserFirestoreModel value, $Res Function(UserFirestoreModel) _then) =
      _$UserFirestoreModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      AppSettingsFirestoreModel? settings,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? deletedAt});

  $AppSettingsFirestoreModelCopyWith<$Res>? get settings;
}

/// @nodoc
class _$UserFirestoreModelCopyWithImpl<$Res>
    implements $UserFirestoreModelCopyWith<$Res> {
  _$UserFirestoreModelCopyWithImpl(this._self, this._then);

  final UserFirestoreModel _self;
  final $Res Function(UserFirestoreModel) _then;

  /// Create a copy of UserFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? settings = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettingsFirestoreModel?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of UserFirestoreModel
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
  }
}

/// @nodoc
@JsonSerializable()
class _UserFirestoreModel extends UserFirestoreModel {
  const _UserFirestoreModel(
      {@JsonKey(includeToJson: false) required this.id,
      this.settings,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.deletedAt})
      : super._();
  factory _UserFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$UserFirestoreModelFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String id;
  @override
  final AppSettingsFirestoreModel? settings;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? createdAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? updatedAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? deletedAt;

  /// Create a copy of UserFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserFirestoreModelCopyWith<_UserFirestoreModel> get copyWith =>
      __$UserFirestoreModelCopyWithImpl<_UserFirestoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, settings, createdAt, updatedAt, deletedAt);

  @override
  String toString() {
    return 'UserFirestoreModel(id: $id, settings: $settings, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserFirestoreModelCopyWith<$Res>
    implements $UserFirestoreModelCopyWith<$Res> {
  factory _$UserFirestoreModelCopyWith(
          _UserFirestoreModel value, $Res Function(_UserFirestoreModel) _then) =
      __$UserFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      AppSettingsFirestoreModel? settings,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? deletedAt});

  @override
  $AppSettingsFirestoreModelCopyWith<$Res>? get settings;
}

/// @nodoc
class __$UserFirestoreModelCopyWithImpl<$Res>
    implements _$UserFirestoreModelCopyWith<$Res> {
  __$UserFirestoreModelCopyWithImpl(this._self, this._then);

  final _UserFirestoreModel _self;
  final $Res Function(_UserFirestoreModel) _then;

  /// Create a copy of UserFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? settings = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_UserFirestoreModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettingsFirestoreModel?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of UserFirestoreModel
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
  }
}

// dart format on
