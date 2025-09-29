// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_container_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodContainerDbModel {
  String get id;
  String get name;
  String? get description;
  String get weight_unit;
  double get weight_value;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get created_at;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get updated_at;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at;

  /// Create a copy of FoodContainerDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FoodContainerDbModelCopyWith<FoodContainerDbModel> get copyWith =>
      _$FoodContainerDbModelCopyWithImpl<FoodContainerDbModel>(
          this as FoodContainerDbModel, _$identity);

  /// Serializes this FoodContainerDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodContainerDbModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weight_unit, weight_unit) ||
                other.weight_unit == weight_unit) &&
            (identical(other.weight_value, weight_value) ||
                other.weight_value == weight_value) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.deleted_at, deleted_at) ||
                other.deleted_at == deleted_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      weight_unit, weight_value, created_at, updated_at, deleted_at);

  @override
  String toString() {
    return 'FoodContainerDbModel(id: $id, name: $name, description: $description, weight_unit: $weight_unit, weight_value: $weight_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }
}

/// @nodoc
abstract mixin class $FoodContainerDbModelCopyWith<$Res> {
  factory $FoodContainerDbModelCopyWith(FoodContainerDbModel value,
          $Res Function(FoodContainerDbModel) _then) =
      _$FoodContainerDbModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String weight_unit,
      double weight_value,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class _$FoodContainerDbModelCopyWithImpl<$Res>
    implements $FoodContainerDbModelCopyWith<$Res> {
  _$FoodContainerDbModelCopyWithImpl(this._self, this._then);

  final FoodContainerDbModel _self;
  final $Res Function(FoodContainerDbModel) _then;

  /// Create a copy of FoodContainerDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? weight_unit = null,
    Object? weight_value = null,
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
      weight_unit: null == weight_unit
          ? _self.weight_unit
          : weight_unit // ignore: cast_nullable_to_non_nullable
              as String,
      weight_value: null == weight_value
          ? _self.weight_value
          : weight_value // ignore: cast_nullable_to_non_nullable
              as double,
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
class _FoodContainerDbModel implements FoodContainerDbModel {
  _FoodContainerDbModel(
      {required this.id,
      required this.name,
      this.description,
      required this.weight_unit,
      required this.weight_value,
      @JsonKey(includeToJson: false, includeFromJson: true) this.created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at});
  factory _FoodContainerDbModel.fromJson(Map<String, dynamic> json) =>
      _$FoodContainerDbModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String weight_unit;
  @override
  final double weight_value;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? created_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? updated_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? deleted_at;

  /// Create a copy of FoodContainerDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FoodContainerDbModelCopyWith<_FoodContainerDbModel> get copyWith =>
      __$FoodContainerDbModelCopyWithImpl<_FoodContainerDbModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FoodContainerDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodContainerDbModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weight_unit, weight_unit) ||
                other.weight_unit == weight_unit) &&
            (identical(other.weight_value, weight_value) ||
                other.weight_value == weight_value) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.deleted_at, deleted_at) ||
                other.deleted_at == deleted_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      weight_unit, weight_value, created_at, updated_at, deleted_at);

  @override
  String toString() {
    return 'FoodContainerDbModel(id: $id, name: $name, description: $description, weight_unit: $weight_unit, weight_value: $weight_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }
}

/// @nodoc
abstract mixin class _$FoodContainerDbModelCopyWith<$Res>
    implements $FoodContainerDbModelCopyWith<$Res> {
  factory _$FoodContainerDbModelCopyWith(_FoodContainerDbModel value,
          $Res Function(_FoodContainerDbModel) _then) =
      __$FoodContainerDbModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String weight_unit,
      double weight_value,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class __$FoodContainerDbModelCopyWithImpl<$Res>
    implements _$FoodContainerDbModelCopyWith<$Res> {
  __$FoodContainerDbModelCopyWithImpl(this._self, this._then);

  final _FoodContainerDbModel _self;
  final $Res Function(_FoodContainerDbModel) _then;

  /// Create a copy of FoodContainerDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? weight_unit = null,
    Object? weight_value = null,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
  }) {
    return _then(_FoodContainerDbModel(
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
      weight_unit: null == weight_unit
          ? _self.weight_unit
          : weight_unit // ignore: cast_nullable_to_non_nullable
              as String,
      weight_value: null == weight_value
          ? _self.weight_value
          : weight_value // ignore: cast_nullable_to_non_nullable
              as double,
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
