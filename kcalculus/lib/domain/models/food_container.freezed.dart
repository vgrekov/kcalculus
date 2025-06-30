// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodContainer {
  String? get id;
  String get name;
  String get description;
  Amount get weight;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FoodContainerCopyWith<FoodContainer> get copyWith =>
      _$FoodContainerCopyWithImpl<FoodContainer>(
          this as FoodContainer, _$identity);

  /// Serializes this FoodContainer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodContainer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, weight, createdAt, updatedAt);

  @override
  String toString() {
    return 'FoodContainer(id: $id, name: $name, description: $description, weight: $weight, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $FoodContainerCopyWith<$Res> {
  factory $FoodContainerCopyWith(
          FoodContainer value, $Res Function(FoodContainer) _then) =
      _$FoodContainerCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      Amount weight,
      DateTime? createdAt,
      DateTime? updatedAt});

  $AmountCopyWith<$Res> get weight;
}

/// @nodoc
class _$FoodContainerCopyWithImpl<$Res>
    implements $FoodContainerCopyWith<$Res> {
  _$FoodContainerCopyWithImpl(this._self, this._then);

  final FoodContainer _self;
  final $Res Function(FoodContainer) _then;

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? weight = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
              as Amount,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get weight {
    return $AmountCopyWith<$Res>(_self.weight, (value) {
      return _then(_self.copyWith(weight: value));
    });
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _FoodContainer implements FoodContainer {
  const _FoodContainer(
      {this.id,
      required this.name,
      required this.description,
      required this.weight,
      this.createdAt,
      this.updatedAt});

  @override
  final String? id;
  @override
  final String name;
  @override
  final String description;
  @override
  final Amount weight;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FoodContainerCopyWith<_FoodContainer> get copyWith =>
      __$FoodContainerCopyWithImpl<_FoodContainer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FoodContainerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodContainer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, weight, createdAt, updatedAt);

  @override
  String toString() {
    return 'FoodContainer(id: $id, name: $name, description: $description, weight: $weight, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$FoodContainerCopyWith<$Res>
    implements $FoodContainerCopyWith<$Res> {
  factory _$FoodContainerCopyWith(
          _FoodContainer value, $Res Function(_FoodContainer) _then) =
      __$FoodContainerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      Amount weight,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $AmountCopyWith<$Res> get weight;
}

/// @nodoc
class __$FoodContainerCopyWithImpl<$Res>
    implements _$FoodContainerCopyWith<$Res> {
  __$FoodContainerCopyWithImpl(this._self, this._then);

  final _FoodContainer _self;
  final $Res Function(_FoodContainer) _then;

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? weight = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_FoodContainer(
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
              as Amount,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get weight {
    return $AmountCopyWith<$Res>(_self.weight, (value) {
      return _then(_self.copyWith(weight: value));
    });
  }
}

// dart format on
