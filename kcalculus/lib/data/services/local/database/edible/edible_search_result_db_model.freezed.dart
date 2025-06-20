// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_search_result_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdibleSearchResultDbModel {
  String get id;
  String? get food_id;
  String? get dish_id;
  String get name;
  String? get description;
  String get created_at;
  String? get updated_at;
  String? get last_eaten_at;

  /// Create a copy of EdibleSearchResultDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EdibleSearchResultDbModelCopyWith<EdibleSearchResultDbModel> get copyWith =>
      _$EdibleSearchResultDbModelCopyWithImpl<EdibleSearchResultDbModel>(
          this as EdibleSearchResultDbModel, _$identity);

  /// Serializes this EdibleSearchResultDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EdibleSearchResultDbModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.food_id, food_id) || other.food_id == food_id) &&
            (identical(other.dish_id, dish_id) || other.dish_id == dish_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.last_eaten_at, last_eaten_at) ||
                other.last_eaten_at == last_eaten_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, food_id, dish_id, name,
      description, created_at, updated_at, last_eaten_at);

  @override
  String toString() {
    return 'EdibleSearchResultDbModel(id: $id, food_id: $food_id, dish_id: $dish_id, name: $name, description: $description, created_at: $created_at, updated_at: $updated_at, last_eaten_at: $last_eaten_at)';
  }
}

/// @nodoc
abstract mixin class $EdibleSearchResultDbModelCopyWith<$Res> {
  factory $EdibleSearchResultDbModelCopyWith(EdibleSearchResultDbModel value,
          $Res Function(EdibleSearchResultDbModel) _then) =
      _$EdibleSearchResultDbModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? food_id,
      String? dish_id,
      String name,
      String? description,
      String created_at,
      String? updated_at,
      String? last_eaten_at});
}

/// @nodoc
class _$EdibleSearchResultDbModelCopyWithImpl<$Res>
    implements $EdibleSearchResultDbModelCopyWith<$Res> {
  _$EdibleSearchResultDbModelCopyWithImpl(this._self, this._then);

  final EdibleSearchResultDbModel _self;
  final $Res Function(EdibleSearchResultDbModel) _then;

  /// Create a copy of EdibleSearchResultDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? food_id = freezed,
    Object? dish_id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? created_at = null,
    Object? updated_at = freezed,
    Object? last_eaten_at = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      food_id: freezed == food_id
          ? _self.food_id
          : food_id // ignore: cast_nullable_to_non_nullable
              as String?,
      dish_id: freezed == dish_id
          ? _self.dish_id
          : dish_id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: null == created_at
          ? _self.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: freezed == updated_at
          ? _self.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      last_eaten_at: freezed == last_eaten_at
          ? _self.last_eaten_at
          : last_eaten_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EdibleSearchResultDbModel implements EdibleSearchResultDbModel {
  _EdibleSearchResultDbModel(
      {required this.id,
      this.food_id,
      this.dish_id,
      required this.name,
      this.description,
      required this.created_at,
      this.updated_at,
      this.last_eaten_at});
  factory _EdibleSearchResultDbModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleSearchResultDbModelFromJson(json);

  @override
  final String id;
  @override
  final String? food_id;
  @override
  final String? dish_id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String created_at;
  @override
  final String? updated_at;
  @override
  final String? last_eaten_at;

  /// Create a copy of EdibleSearchResultDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EdibleSearchResultDbModelCopyWith<_EdibleSearchResultDbModel>
      get copyWith =>
          __$EdibleSearchResultDbModelCopyWithImpl<_EdibleSearchResultDbModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EdibleSearchResultDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EdibleSearchResultDbModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.food_id, food_id) || other.food_id == food_id) &&
            (identical(other.dish_id, dish_id) || other.dish_id == dish_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.last_eaten_at, last_eaten_at) ||
                other.last_eaten_at == last_eaten_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, food_id, dish_id, name,
      description, created_at, updated_at, last_eaten_at);

  @override
  String toString() {
    return 'EdibleSearchResultDbModel(id: $id, food_id: $food_id, dish_id: $dish_id, name: $name, description: $description, created_at: $created_at, updated_at: $updated_at, last_eaten_at: $last_eaten_at)';
  }
}

/// @nodoc
abstract mixin class _$EdibleSearchResultDbModelCopyWith<$Res>
    implements $EdibleSearchResultDbModelCopyWith<$Res> {
  factory _$EdibleSearchResultDbModelCopyWith(_EdibleSearchResultDbModel value,
          $Res Function(_EdibleSearchResultDbModel) _then) =
      __$EdibleSearchResultDbModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? food_id,
      String? dish_id,
      String name,
      String? description,
      String created_at,
      String? updated_at,
      String? last_eaten_at});
}

/// @nodoc
class __$EdibleSearchResultDbModelCopyWithImpl<$Res>
    implements _$EdibleSearchResultDbModelCopyWith<$Res> {
  __$EdibleSearchResultDbModelCopyWithImpl(this._self, this._then);

  final _EdibleSearchResultDbModel _self;
  final $Res Function(_EdibleSearchResultDbModel) _then;

  /// Create a copy of EdibleSearchResultDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? food_id = freezed,
    Object? dish_id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? created_at = null,
    Object? updated_at = freezed,
    Object? last_eaten_at = freezed,
  }) {
    return _then(_EdibleSearchResultDbModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      food_id: freezed == food_id
          ? _self.food_id
          : food_id // ignore: cast_nullable_to_non_nullable
              as String?,
      dish_id: freezed == dish_id
          ? _self.dish_id
          : dish_id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: null == created_at
          ? _self.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: freezed == updated_at
          ? _self.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      last_eaten_at: freezed == last_eaten_at
          ? _self.last_eaten_at
          : last_eaten_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
