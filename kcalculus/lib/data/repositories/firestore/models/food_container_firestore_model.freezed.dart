// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_container_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodContainerFirestoreModel {
  @JsonKey(includeToJson: false)
  String? get id;
  String get name;
  String get description;
  AmountFirestoreModel get weight;
  String get ownerId;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get createdAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get updatedAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get deletedAt;

  /// Create a copy of FoodContainerFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FoodContainerFirestoreModelCopyWith<FoodContainerFirestoreModel>
      get copyWith => _$FoodContainerFirestoreModelCopyWithImpl<
              FoodContainerFirestoreModel>(
          this as FoodContainerFirestoreModel, _$identity);

  /// Serializes this FoodContainerFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodContainerFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, weight,
      ownerId, createdAt, updatedAt, deletedAt);

  @override
  String toString() {
    return 'FoodContainerFirestoreModel(id: $id, name: $name, description: $description, weight: $weight, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $FoodContainerFirestoreModelCopyWith<$Res> {
  factory $FoodContainerFirestoreModelCopyWith(
          FoodContainerFirestoreModel value,
          $Res Function(FoodContainerFirestoreModel) _then) =
      _$FoodContainerFirestoreModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      String name,
      String description,
      AmountFirestoreModel weight,
      String ownerId,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? deletedAt});

  $AmountFirestoreModelCopyWith<$Res> get weight;
}

/// @nodoc
class _$FoodContainerFirestoreModelCopyWithImpl<$Res>
    implements $FoodContainerFirestoreModelCopyWith<$Res> {
  _$FoodContainerFirestoreModelCopyWithImpl(this._self, this._then);

  final FoodContainerFirestoreModel _self;
  final $Res Function(FoodContainerFirestoreModel) _then;

  /// Create a copy of FoodContainerFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? weight = null,
    Object? ownerId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as AmountFirestoreModel,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of FoodContainerFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountFirestoreModelCopyWith<$Res> get weight {
    return $AmountFirestoreModelCopyWith<$Res>(_self.weight, (value) {
      return _then(_self.copyWith(weight: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _FoodContainerFirestoreModel extends FoodContainerFirestoreModel {
  const _FoodContainerFirestoreModel(
      {@JsonKey(includeToJson: false) this.id,
      required this.name,
      required this.description,
      required this.weight,
      required this.ownerId,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.deletedAt})
      : super._();
  factory _FoodContainerFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$FoodContainerFirestoreModelFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  final String name;
  @override
  final String description;
  @override
  final AmountFirestoreModel weight;
  @override
  final String ownerId;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? createdAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? updatedAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? deletedAt;

  /// Create a copy of FoodContainerFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FoodContainerFirestoreModelCopyWith<_FoodContainerFirestoreModel>
      get copyWith => __$FoodContainerFirestoreModelCopyWithImpl<
          _FoodContainerFirestoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FoodContainerFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodContainerFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, weight,
      ownerId, createdAt, updatedAt, deletedAt);

  @override
  String toString() {
    return 'FoodContainerFirestoreModel(id: $id, name: $name, description: $description, weight: $weight, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$FoodContainerFirestoreModelCopyWith<$Res>
    implements $FoodContainerFirestoreModelCopyWith<$Res> {
  factory _$FoodContainerFirestoreModelCopyWith(
          _FoodContainerFirestoreModel value,
          $Res Function(_FoodContainerFirestoreModel) _then) =
      __$FoodContainerFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      String name,
      String description,
      AmountFirestoreModel weight,
      String ownerId,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? deletedAt});

  @override
  $AmountFirestoreModelCopyWith<$Res> get weight;
}

/// @nodoc
class __$FoodContainerFirestoreModelCopyWithImpl<$Res>
    implements _$FoodContainerFirestoreModelCopyWith<$Res> {
  __$FoodContainerFirestoreModelCopyWithImpl(this._self, this._then);

  final _FoodContainerFirestoreModel _self;
  final $Res Function(_FoodContainerFirestoreModel) _then;

  /// Create a copy of FoodContainerFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? weight = null,
    Object? ownerId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_FoodContainerFirestoreModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as AmountFirestoreModel,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of FoodContainerFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountFirestoreModelCopyWith<$Res> get weight {
    return $AmountFirestoreModelCopyWith<$Res>(_self.weight, (value) {
      return _then(_self.copyWith(weight: value));
    });
  }
}

// dart format on
