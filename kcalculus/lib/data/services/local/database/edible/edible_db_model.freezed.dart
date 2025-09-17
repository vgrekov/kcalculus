// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdibleDbModel {
  String get id;
  String get name;
  String? get description;
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
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get created_at;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get updated_at;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at;

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EdibleDbModelCopyWith<EdibleDbModel> get copyWith =>
      _$EdibleDbModelCopyWithImpl<EdibleDbModel>(
          this as EdibleDbModel, _$identity);

  /// Serializes this EdibleDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EdibleDbModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
                other.nf_preview_fiber_value == nf_preview_fiber_value) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.deleted_at, deleted_at) ||
                other.deleted_at == deleted_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
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
      nf_preview_fiber_value,
      created_at,
      updated_at,
      deleted_at);

  @override
  String toString() {
    return 'EdibleDbModel(id: $id, name: $name, description: $description, nf_preview_per_unit: $nf_preview_per_unit, nf_preview_per_value: $nf_preview_per_value, nf_preview_calories_unit: $nf_preview_calories_unit, nf_preview_calories_value: $nf_preview_calories_value, nf_preview_fat_unit: $nf_preview_fat_unit, nf_preview_fat_value: $nf_preview_fat_value, nf_preview_carbs_unit: $nf_preview_carbs_unit, nf_preview_carbs_value: $nf_preview_carbs_value, nf_preview_protein_unit: $nf_preview_protein_unit, nf_preview_protein_value: $nf_preview_protein_value, nf_preview_fiber_unit: $nf_preview_fiber_unit, nf_preview_fiber_value: $nf_preview_fiber_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }
}

/// @nodoc
abstract mixin class $EdibleDbModelCopyWith<$Res> {
  factory $EdibleDbModelCopyWith(
          EdibleDbModel value, $Res Function(EdibleDbModel) _then) =
      _$EdibleDbModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
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
      double? nf_preview_fiber_value,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class _$EdibleDbModelCopyWithImpl<$Res>
    implements $EdibleDbModelCopyWith<$Res> {
  _$EdibleDbModelCopyWithImpl(this._self, this._then);

  final EdibleDbModel _self;
  final $Res Function(EdibleDbModel) _then;

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
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
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
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
      created_at: freezed == created_at
          ? _self.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _self.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted_at: freezed == deleted_at
          ? _self.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EdibleDbModel implements EdibleDbModel {
  const _EdibleDbModel(
      {required this.id,
      required this.name,
      this.description,
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
      this.nf_preview_fiber_value,
      @JsonKey(includeToJson: false, includeFromJson: true) this.created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at});
  factory _EdibleDbModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleDbModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
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
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? created_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? updated_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? deleted_at;

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EdibleDbModelCopyWith<_EdibleDbModel> get copyWith =>
      __$EdibleDbModelCopyWithImpl<_EdibleDbModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EdibleDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EdibleDbModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
                other.nf_preview_fiber_value == nf_preview_fiber_value) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.deleted_at, deleted_at) ||
                other.deleted_at == deleted_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
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
      nf_preview_fiber_value,
      created_at,
      updated_at,
      deleted_at);

  @override
  String toString() {
    return 'EdibleDbModel(id: $id, name: $name, description: $description, nf_preview_per_unit: $nf_preview_per_unit, nf_preview_per_value: $nf_preview_per_value, nf_preview_calories_unit: $nf_preview_calories_unit, nf_preview_calories_value: $nf_preview_calories_value, nf_preview_fat_unit: $nf_preview_fat_unit, nf_preview_fat_value: $nf_preview_fat_value, nf_preview_carbs_unit: $nf_preview_carbs_unit, nf_preview_carbs_value: $nf_preview_carbs_value, nf_preview_protein_unit: $nf_preview_protein_unit, nf_preview_protein_value: $nf_preview_protein_value, nf_preview_fiber_unit: $nf_preview_fiber_unit, nf_preview_fiber_value: $nf_preview_fiber_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }
}

/// @nodoc
abstract mixin class _$EdibleDbModelCopyWith<$Res>
    implements $EdibleDbModelCopyWith<$Res> {
  factory _$EdibleDbModelCopyWith(
          _EdibleDbModel value, $Res Function(_EdibleDbModel) _then) =
      __$EdibleDbModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
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
      double? nf_preview_fiber_value,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class __$EdibleDbModelCopyWithImpl<$Res>
    implements _$EdibleDbModelCopyWith<$Res> {
  __$EdibleDbModelCopyWithImpl(this._self, this._then);

  final _EdibleDbModel _self;
  final $Res Function(_EdibleDbModel) _then;

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
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
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
  }) {
    return _then(_EdibleDbModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
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
      created_at: freezed == created_at
          ? _self.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _self.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted_at: freezed == deleted_at
          ? _self.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
