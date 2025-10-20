// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_preview_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdiblePreviewDbModel {
  String get id;
  String? get food_id;
  String? get dish_id;
  String get name;
  String? get description;
  String get created_at;
  String? get updated_at;
  String? get last_eaten_at;
  String? get nf_preview_per_unit;
  double? get nf_preview_per_value;
  String? get nf_preview_calories_unit;
  double? get nf_preview_calories_value;
  String? get nf_preview_fat_unit;
  double? get nf_preview_fat_value;
  String? get nf_preview_carbs_unit;
  double? get nf_preview_carbs_value;
  String? get nf_preview_protein_unit;
  double? get nf_preview_protein_value;
  String? get nf_preview_fiber_unit;
  double? get nf_preview_fiber_value;

  /// Create a copy of EdiblePreviewDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EdiblePreviewDbModelCopyWith<EdiblePreviewDbModel> get copyWith =>
      _$EdiblePreviewDbModelCopyWithImpl<EdiblePreviewDbModel>(
          this as EdiblePreviewDbModel, _$identity);

  /// Serializes this EdiblePreviewDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EdiblePreviewDbModel &&
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
                other.last_eaten_at == last_eaten_at) &&
            (identical(other.nf_preview_per_unit, nf_preview_per_unit) ||
                other.nf_preview_per_unit == nf_preview_per_unit) &&
            (identical(other.nf_preview_per_value, nf_preview_per_value) ||
                other.nf_preview_per_value == nf_preview_per_value) &&
            (identical(
                    other.nf_preview_calories_unit, nf_preview_calories_unit) ||
                other.nf_preview_calories_unit == nf_preview_calories_unit) &&
            (identical(other.nf_preview_calories_value,
                    nf_preview_calories_value) ||
                other.nf_preview_calories_value == nf_preview_calories_value) &&
            (identical(other.nf_preview_fat_unit, nf_preview_fat_unit) ||
                other.nf_preview_fat_unit == nf_preview_fat_unit) &&
            (identical(other.nf_preview_fat_value, nf_preview_fat_value) ||
                other.nf_preview_fat_value == nf_preview_fat_value) &&
            (identical(other.nf_preview_carbs_unit, nf_preview_carbs_unit) ||
                other.nf_preview_carbs_unit == nf_preview_carbs_unit) &&
            (identical(other.nf_preview_carbs_value, nf_preview_carbs_value) ||
                other.nf_preview_carbs_value == nf_preview_carbs_value) &&
            (identical(
                    other.nf_preview_protein_unit, nf_preview_protein_unit) ||
                other.nf_preview_protein_unit == nf_preview_protein_unit) &&
            (identical(
                    other.nf_preview_protein_value, nf_preview_protein_value) ||
                other.nf_preview_protein_value == nf_preview_protein_value) &&
            (identical(other.nf_preview_fiber_unit, nf_preview_fiber_unit) ||
                other.nf_preview_fiber_unit == nf_preview_fiber_unit) &&
            (identical(other.nf_preview_fiber_value, nf_preview_fiber_value) ||
                other.nf_preview_fiber_value == nf_preview_fiber_value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        food_id,
        dish_id,
        name,
        description,
        created_at,
        updated_at,
        last_eaten_at,
        nf_preview_per_unit,
        nf_preview_per_value,
        nf_preview_calories_unit,
        nf_preview_calories_value,
        nf_preview_fat_unit,
        nf_preview_fat_value,
        nf_preview_carbs_unit,
        nf_preview_carbs_value,
        nf_preview_protein_unit,
        nf_preview_protein_value,
        nf_preview_fiber_unit,
        nf_preview_fiber_value
      ]);

  @override
  String toString() {
    return 'EdiblePreviewDbModel(id: $id, food_id: $food_id, dish_id: $dish_id, name: $name, description: $description, created_at: $created_at, updated_at: $updated_at, last_eaten_at: $last_eaten_at, nf_preview_per_unit: $nf_preview_per_unit, nf_preview_per_value: $nf_preview_per_value, nf_preview_calories_unit: $nf_preview_calories_unit, nf_preview_calories_value: $nf_preview_calories_value, nf_preview_fat_unit: $nf_preview_fat_unit, nf_preview_fat_value: $nf_preview_fat_value, nf_preview_carbs_unit: $nf_preview_carbs_unit, nf_preview_carbs_value: $nf_preview_carbs_value, nf_preview_protein_unit: $nf_preview_protein_unit, nf_preview_protein_value: $nf_preview_protein_value, nf_preview_fiber_unit: $nf_preview_fiber_unit, nf_preview_fiber_value: $nf_preview_fiber_value)';
  }
}

/// @nodoc
abstract mixin class $EdiblePreviewDbModelCopyWith<$Res> {
  factory $EdiblePreviewDbModelCopyWith(EdiblePreviewDbModel value,
          $Res Function(EdiblePreviewDbModel) _then) =
      _$EdiblePreviewDbModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? food_id,
      String? dish_id,
      String name,
      String? description,
      String created_at,
      String? updated_at,
      String? last_eaten_at,
      String? nf_preview_per_unit,
      double? nf_preview_per_value,
      String? nf_preview_calories_unit,
      double? nf_preview_calories_value,
      String? nf_preview_fat_unit,
      double? nf_preview_fat_value,
      String? nf_preview_carbs_unit,
      double? nf_preview_carbs_value,
      String? nf_preview_protein_unit,
      double? nf_preview_protein_value,
      String? nf_preview_fiber_unit,
      double? nf_preview_fiber_value});
}

/// @nodoc
class _$EdiblePreviewDbModelCopyWithImpl<$Res>
    implements $EdiblePreviewDbModelCopyWith<$Res> {
  _$EdiblePreviewDbModelCopyWithImpl(this._self, this._then);

  final EdiblePreviewDbModel _self;
  final $Res Function(EdiblePreviewDbModel) _then;

  /// Create a copy of EdiblePreviewDbModel
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
    Object? nf_preview_per_unit = freezed,
    Object? nf_preview_per_value = freezed,
    Object? nf_preview_calories_unit = freezed,
    Object? nf_preview_calories_value = freezed,
    Object? nf_preview_fat_unit = freezed,
    Object? nf_preview_fat_value = freezed,
    Object? nf_preview_carbs_unit = freezed,
    Object? nf_preview_carbs_value = freezed,
    Object? nf_preview_protein_unit = freezed,
    Object? nf_preview_protein_value = freezed,
    Object? nf_preview_fiber_unit = freezed,
    Object? nf_preview_fiber_value = freezed,
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
      nf_preview_per_unit: freezed == nf_preview_per_unit
          ? _self.nf_preview_per_unit
          : nf_preview_per_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_per_value: freezed == nf_preview_per_value
          ? _self.nf_preview_per_value
          : nf_preview_per_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_calories_unit: freezed == nf_preview_calories_unit
          ? _self.nf_preview_calories_unit
          : nf_preview_calories_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_calories_value: freezed == nf_preview_calories_value
          ? _self.nf_preview_calories_value
          : nf_preview_calories_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_fat_unit: freezed == nf_preview_fat_unit
          ? _self.nf_preview_fat_unit
          : nf_preview_fat_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_fat_value: freezed == nf_preview_fat_value
          ? _self.nf_preview_fat_value
          : nf_preview_fat_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_carbs_unit: freezed == nf_preview_carbs_unit
          ? _self.nf_preview_carbs_unit
          : nf_preview_carbs_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_carbs_value: freezed == nf_preview_carbs_value
          ? _self.nf_preview_carbs_value
          : nf_preview_carbs_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_protein_unit: freezed == nf_preview_protein_unit
          ? _self.nf_preview_protein_unit
          : nf_preview_protein_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_protein_value: freezed == nf_preview_protein_value
          ? _self.nf_preview_protein_value
          : nf_preview_protein_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_fiber_unit: freezed == nf_preview_fiber_unit
          ? _self.nf_preview_fiber_unit
          : nf_preview_fiber_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_fiber_value: freezed == nf_preview_fiber_value
          ? _self.nf_preview_fiber_value
          : nf_preview_fiber_value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EdiblePreviewDbModel implements EdiblePreviewDbModel {
  _EdiblePreviewDbModel(
      {required this.id,
      this.food_id,
      this.dish_id,
      required this.name,
      this.description,
      required this.created_at,
      this.updated_at,
      this.last_eaten_at,
      this.nf_preview_per_unit,
      this.nf_preview_per_value,
      this.nf_preview_calories_unit,
      this.nf_preview_calories_value,
      this.nf_preview_fat_unit,
      this.nf_preview_fat_value,
      this.nf_preview_carbs_unit,
      this.nf_preview_carbs_value,
      this.nf_preview_protein_unit,
      this.nf_preview_protein_value,
      this.nf_preview_fiber_unit,
      this.nf_preview_fiber_value});
  factory _EdiblePreviewDbModel.fromJson(Map<String, dynamic> json) =>
      _$EdiblePreviewDbModelFromJson(json);

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
  @override
  final String? nf_preview_per_unit;
  @override
  final double? nf_preview_per_value;
  @override
  final String? nf_preview_calories_unit;
  @override
  final double? nf_preview_calories_value;
  @override
  final String? nf_preview_fat_unit;
  @override
  final double? nf_preview_fat_value;
  @override
  final String? nf_preview_carbs_unit;
  @override
  final double? nf_preview_carbs_value;
  @override
  final String? nf_preview_protein_unit;
  @override
  final double? nf_preview_protein_value;
  @override
  final String? nf_preview_fiber_unit;
  @override
  final double? nf_preview_fiber_value;

  /// Create a copy of EdiblePreviewDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EdiblePreviewDbModelCopyWith<_EdiblePreviewDbModel> get copyWith =>
      __$EdiblePreviewDbModelCopyWithImpl<_EdiblePreviewDbModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EdiblePreviewDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EdiblePreviewDbModel &&
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
                other.last_eaten_at == last_eaten_at) &&
            (identical(other.nf_preview_per_unit, nf_preview_per_unit) ||
                other.nf_preview_per_unit == nf_preview_per_unit) &&
            (identical(other.nf_preview_per_value, nf_preview_per_value) ||
                other.nf_preview_per_value == nf_preview_per_value) &&
            (identical(
                    other.nf_preview_calories_unit, nf_preview_calories_unit) ||
                other.nf_preview_calories_unit == nf_preview_calories_unit) &&
            (identical(other.nf_preview_calories_value,
                    nf_preview_calories_value) ||
                other.nf_preview_calories_value == nf_preview_calories_value) &&
            (identical(other.nf_preview_fat_unit, nf_preview_fat_unit) ||
                other.nf_preview_fat_unit == nf_preview_fat_unit) &&
            (identical(other.nf_preview_fat_value, nf_preview_fat_value) ||
                other.nf_preview_fat_value == nf_preview_fat_value) &&
            (identical(other.nf_preview_carbs_unit, nf_preview_carbs_unit) ||
                other.nf_preview_carbs_unit == nf_preview_carbs_unit) &&
            (identical(other.nf_preview_carbs_value, nf_preview_carbs_value) ||
                other.nf_preview_carbs_value == nf_preview_carbs_value) &&
            (identical(
                    other.nf_preview_protein_unit, nf_preview_protein_unit) ||
                other.nf_preview_protein_unit == nf_preview_protein_unit) &&
            (identical(
                    other.nf_preview_protein_value, nf_preview_protein_value) ||
                other.nf_preview_protein_value == nf_preview_protein_value) &&
            (identical(other.nf_preview_fiber_unit, nf_preview_fiber_unit) ||
                other.nf_preview_fiber_unit == nf_preview_fiber_unit) &&
            (identical(other.nf_preview_fiber_value, nf_preview_fiber_value) ||
                other.nf_preview_fiber_value == nf_preview_fiber_value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        food_id,
        dish_id,
        name,
        description,
        created_at,
        updated_at,
        last_eaten_at,
        nf_preview_per_unit,
        nf_preview_per_value,
        nf_preview_calories_unit,
        nf_preview_calories_value,
        nf_preview_fat_unit,
        nf_preview_fat_value,
        nf_preview_carbs_unit,
        nf_preview_carbs_value,
        nf_preview_protein_unit,
        nf_preview_protein_value,
        nf_preview_fiber_unit,
        nf_preview_fiber_value
      ]);

  @override
  String toString() {
    return 'EdiblePreviewDbModel(id: $id, food_id: $food_id, dish_id: $dish_id, name: $name, description: $description, created_at: $created_at, updated_at: $updated_at, last_eaten_at: $last_eaten_at, nf_preview_per_unit: $nf_preview_per_unit, nf_preview_per_value: $nf_preview_per_value, nf_preview_calories_unit: $nf_preview_calories_unit, nf_preview_calories_value: $nf_preview_calories_value, nf_preview_fat_unit: $nf_preview_fat_unit, nf_preview_fat_value: $nf_preview_fat_value, nf_preview_carbs_unit: $nf_preview_carbs_unit, nf_preview_carbs_value: $nf_preview_carbs_value, nf_preview_protein_unit: $nf_preview_protein_unit, nf_preview_protein_value: $nf_preview_protein_value, nf_preview_fiber_unit: $nf_preview_fiber_unit, nf_preview_fiber_value: $nf_preview_fiber_value)';
  }
}

/// @nodoc
abstract mixin class _$EdiblePreviewDbModelCopyWith<$Res>
    implements $EdiblePreviewDbModelCopyWith<$Res> {
  factory _$EdiblePreviewDbModelCopyWith(_EdiblePreviewDbModel value,
          $Res Function(_EdiblePreviewDbModel) _then) =
      __$EdiblePreviewDbModelCopyWithImpl;
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
      String? last_eaten_at,
      String? nf_preview_per_unit,
      double? nf_preview_per_value,
      String? nf_preview_calories_unit,
      double? nf_preview_calories_value,
      String? nf_preview_fat_unit,
      double? nf_preview_fat_value,
      String? nf_preview_carbs_unit,
      double? nf_preview_carbs_value,
      String? nf_preview_protein_unit,
      double? nf_preview_protein_value,
      String? nf_preview_fiber_unit,
      double? nf_preview_fiber_value});
}

/// @nodoc
class __$EdiblePreviewDbModelCopyWithImpl<$Res>
    implements _$EdiblePreviewDbModelCopyWith<$Res> {
  __$EdiblePreviewDbModelCopyWithImpl(this._self, this._then);

  final _EdiblePreviewDbModel _self;
  final $Res Function(_EdiblePreviewDbModel) _then;

  /// Create a copy of EdiblePreviewDbModel
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
    Object? nf_preview_per_unit = freezed,
    Object? nf_preview_per_value = freezed,
    Object? nf_preview_calories_unit = freezed,
    Object? nf_preview_calories_value = freezed,
    Object? nf_preview_fat_unit = freezed,
    Object? nf_preview_fat_value = freezed,
    Object? nf_preview_carbs_unit = freezed,
    Object? nf_preview_carbs_value = freezed,
    Object? nf_preview_protein_unit = freezed,
    Object? nf_preview_protein_value = freezed,
    Object? nf_preview_fiber_unit = freezed,
    Object? nf_preview_fiber_value = freezed,
  }) {
    return _then(_EdiblePreviewDbModel(
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
      nf_preview_per_unit: freezed == nf_preview_per_unit
          ? _self.nf_preview_per_unit
          : nf_preview_per_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_per_value: freezed == nf_preview_per_value
          ? _self.nf_preview_per_value
          : nf_preview_per_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_calories_unit: freezed == nf_preview_calories_unit
          ? _self.nf_preview_calories_unit
          : nf_preview_calories_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_calories_value: freezed == nf_preview_calories_value
          ? _self.nf_preview_calories_value
          : nf_preview_calories_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_fat_unit: freezed == nf_preview_fat_unit
          ? _self.nf_preview_fat_unit
          : nf_preview_fat_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_fat_value: freezed == nf_preview_fat_value
          ? _self.nf_preview_fat_value
          : nf_preview_fat_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_carbs_unit: freezed == nf_preview_carbs_unit
          ? _self.nf_preview_carbs_unit
          : nf_preview_carbs_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_carbs_value: freezed == nf_preview_carbs_value
          ? _self.nf_preview_carbs_value
          : nf_preview_carbs_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_protein_unit: freezed == nf_preview_protein_unit
          ? _self.nf_preview_protein_unit
          : nf_preview_protein_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_protein_value: freezed == nf_preview_protein_value
          ? _self.nf_preview_protein_value
          : nf_preview_protein_value // ignore: cast_nullable_to_non_nullable
              as double?,
      nf_preview_fiber_unit: freezed == nf_preview_fiber_unit
          ? _self.nf_preview_fiber_unit
          : nf_preview_fiber_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      nf_preview_fiber_value: freezed == nf_preview_fiber_value
          ? _self.nf_preview_fiber_value
          : nf_preview_fiber_value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
