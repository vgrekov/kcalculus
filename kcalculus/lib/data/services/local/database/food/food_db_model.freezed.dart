// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodDbModel {
  String get id;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String get name;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get description;
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get nf_preview_per_unit;
  @JsonKey(includeToJson: false, includeFromJson: false)
  double? get nf_preview_per_value;
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get nf_preview_calories_unit;
  @JsonKey(includeToJson: false, includeFromJson: false)
  double? get nf_preview_calories_value;
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get nf_preview_fat_unit;
  @JsonKey(includeToJson: false, includeFromJson: false)
  double? get nf_preview_fat_value;
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get nf_preview_carbs_unit;
  @JsonKey(includeToJson: false, includeFromJson: false)
  double? get nf_preview_carbs_value;
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get nf_preview_protein_unit;
  @JsonKey(includeToJson: false, includeFromJson: false)
  double? get nf_preview_protein_value;
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get nf_preview_fiber_unit;
  @JsonKey(includeToJson: false, includeFromJson: false)
  double? get nf_preview_fiber_value;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get created_at;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get updated_at;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at;

  /// Create a copy of FoodDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FoodDbModelCopyWith<FoodDbModel> get copyWith =>
      _$FoodDbModelCopyWithImpl<FoodDbModel>(this as FoodDbModel, _$identity);

  /// Serializes this FoodDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodDbModel &&
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
    return 'FoodDbModel(id: $id, name: $name, description: $description, nf_preview_per_unit: $nf_preview_per_unit, nf_preview_per_value: $nf_preview_per_value, nf_preview_calories_unit: $nf_preview_calories_unit, nf_preview_calories_value: $nf_preview_calories_value, nf_preview_fat_unit: $nf_preview_fat_unit, nf_preview_fat_value: $nf_preview_fat_value, nf_preview_carbs_unit: $nf_preview_carbs_unit, nf_preview_carbs_value: $nf_preview_carbs_value, nf_preview_protein_unit: $nf_preview_protein_unit, nf_preview_protein_value: $nf_preview_protein_value, nf_preview_fiber_unit: $nf_preview_fiber_unit, nf_preview_fiber_value: $nf_preview_fiber_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }
}

/// @nodoc
abstract mixin class $FoodDbModelCopyWith<$Res> {
  factory $FoodDbModelCopyWith(
          FoodDbModel value, $Res Function(FoodDbModel) _then) =
      _$FoodDbModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(includeToJson: false, includeFromJson: true) String name,
      @JsonKey(includeToJson: false, includeFromJson: true) String? description,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_per_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_per_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_calories_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_calories_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_fat_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_fat_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_carbs_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_carbs_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_protein_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_protein_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_fiber_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_fiber_value,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class _$FoodDbModelCopyWithImpl<$Res> implements $FoodDbModelCopyWith<$Res> {
  _$FoodDbModelCopyWithImpl(this._self, this._then);

  final FoodDbModel _self;
  final $Res Function(FoodDbModel) _then;

  /// Create a copy of FoodDbModel
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
class _FoodDbModel extends FoodDbModel {
  const _FoodDbModel(
      {required this.id,
      @JsonKey(includeToJson: false, includeFromJson: true) required this.name,
      @JsonKey(includeToJson: false, includeFromJson: true) this.description,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_per_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_per_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_calories_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_calories_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_fat_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_fat_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_carbs_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_carbs_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_protein_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_protein_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_fiber_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.nf_preview_fiber_value,
      @JsonKey(includeToJson: false, includeFromJson: true) this.created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at})
      : super._();
  factory _FoodDbModel.fromJson(Map<String, dynamic> json) =>
      _$FoodDbModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String name;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? description;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? nf_preview_per_unit;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final double? nf_preview_per_value;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? nf_preview_calories_unit;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final double? nf_preview_calories_value;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? nf_preview_fat_unit;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final double? nf_preview_fat_value;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? nf_preview_carbs_unit;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final double? nf_preview_carbs_value;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? nf_preview_protein_unit;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final double? nf_preview_protein_value;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? nf_preview_fiber_unit;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
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

  /// Create a copy of FoodDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FoodDbModelCopyWith<_FoodDbModel> get copyWith =>
      __$FoodDbModelCopyWithImpl<_FoodDbModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FoodDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodDbModel &&
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
    return 'FoodDbModel(id: $id, name: $name, description: $description, nf_preview_per_unit: $nf_preview_per_unit, nf_preview_per_value: $nf_preview_per_value, nf_preview_calories_unit: $nf_preview_calories_unit, nf_preview_calories_value: $nf_preview_calories_value, nf_preview_fat_unit: $nf_preview_fat_unit, nf_preview_fat_value: $nf_preview_fat_value, nf_preview_carbs_unit: $nf_preview_carbs_unit, nf_preview_carbs_value: $nf_preview_carbs_value, nf_preview_protein_unit: $nf_preview_protein_unit, nf_preview_protein_value: $nf_preview_protein_value, nf_preview_fiber_unit: $nf_preview_fiber_unit, nf_preview_fiber_value: $nf_preview_fiber_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }
}

/// @nodoc
abstract mixin class _$FoodDbModelCopyWith<$Res>
    implements $FoodDbModelCopyWith<$Res> {
  factory _$FoodDbModelCopyWith(
          _FoodDbModel value, $Res Function(_FoodDbModel) _then) =
      __$FoodDbModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(includeToJson: false, includeFromJson: true) String name,
      @JsonKey(includeToJson: false, includeFromJson: true) String? description,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_per_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_per_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_calories_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_calories_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_fat_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_fat_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_carbs_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_carbs_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_protein_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_protein_value,
      @JsonKey(includeToJson: false, includeFromJson: false)
      String? nf_preview_fiber_unit,
      @JsonKey(includeToJson: false, includeFromJson: false)
      double? nf_preview_fiber_value,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class __$FoodDbModelCopyWithImpl<$Res> implements _$FoodDbModelCopyWith<$Res> {
  __$FoodDbModelCopyWithImpl(this._self, this._then);

  final _FoodDbModel _self;
  final $Res Function(_FoodDbModel) _then;

  /// Create a copy of FoodDbModel
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
    return _then(_FoodDbModel(
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
