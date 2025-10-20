// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_config_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchConfigFirestoreModel {
  String get appId;
  String get apiKey;

  /// Create a copy of SearchConfigFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchConfigFirestoreModelCopyWith<SearchConfigFirestoreModel>
      get copyWith =>
          _$SearchConfigFirestoreModelCopyWithImpl<SearchConfigFirestoreModel>(
              this as SearchConfigFirestoreModel, _$identity);

  /// Serializes this SearchConfigFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchConfigFirestoreModel &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appId, apiKey);

  @override
  String toString() {
    return 'SearchConfigFirestoreModel(appId: $appId, apiKey: $apiKey)';
  }
}

/// @nodoc
abstract mixin class $SearchConfigFirestoreModelCopyWith<$Res> {
  factory $SearchConfigFirestoreModelCopyWith(SearchConfigFirestoreModel value,
          $Res Function(SearchConfigFirestoreModel) _then) =
      _$SearchConfigFirestoreModelCopyWithImpl;
  @useResult
  $Res call({String appId, String apiKey});
}

/// @nodoc
class _$SearchConfigFirestoreModelCopyWithImpl<$Res>
    implements $SearchConfigFirestoreModelCopyWith<$Res> {
  _$SearchConfigFirestoreModelCopyWithImpl(this._self, this._then);

  final SearchConfigFirestoreModel _self;
  final $Res Function(SearchConfigFirestoreModel) _then;

  /// Create a copy of SearchConfigFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? apiKey = null,
  }) {
    return _then(_self.copyWith(
      appId: null == appId
          ? _self.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _self.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SearchConfigFirestoreModel implements SearchConfigFirestoreModel {
  const _SearchConfigFirestoreModel(
      {required this.appId, required this.apiKey});
  factory _SearchConfigFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$SearchConfigFirestoreModelFromJson(json);

  @override
  final String appId;
  @override
  final String apiKey;

  /// Create a copy of SearchConfigFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchConfigFirestoreModelCopyWith<_SearchConfigFirestoreModel>
      get copyWith => __$SearchConfigFirestoreModelCopyWithImpl<
          _SearchConfigFirestoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchConfigFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchConfigFirestoreModel &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appId, apiKey);

  @override
  String toString() {
    return 'SearchConfigFirestoreModel(appId: $appId, apiKey: $apiKey)';
  }
}

/// @nodoc
abstract mixin class _$SearchConfigFirestoreModelCopyWith<$Res>
    implements $SearchConfigFirestoreModelCopyWith<$Res> {
  factory _$SearchConfigFirestoreModelCopyWith(
          _SearchConfigFirestoreModel value,
          $Res Function(_SearchConfigFirestoreModel) _then) =
      __$SearchConfigFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call({String appId, String apiKey});
}

/// @nodoc
class __$SearchConfigFirestoreModelCopyWithImpl<$Res>
    implements _$SearchConfigFirestoreModelCopyWith<$Res> {
  __$SearchConfigFirestoreModelCopyWithImpl(this._self, this._then);

  final _SearchConfigFirestoreModel _self;
  final $Res Function(_SearchConfigFirestoreModel) _then;

  /// Create a copy of SearchConfigFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appId = null,
    Object? apiKey = null,
  }) {
    return _then(_SearchConfigFirestoreModel(
      appId: null == appId
          ? _self.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _self.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
