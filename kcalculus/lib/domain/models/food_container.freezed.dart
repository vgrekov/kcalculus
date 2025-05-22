// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodContainer {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Amount get weight => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FoodContainer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodContainerCopyWith<FoodContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodContainerCopyWith<$Res> {
  factory $FoodContainerCopyWith(
          FoodContainer value, $Res Function(FoodContainer) then) =
      _$FoodContainerCopyWithImpl<$Res, FoodContainer>;
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
class _$FoodContainerCopyWithImpl<$Res, $Val extends FoodContainer>
    implements $FoodContainerCopyWith<$Res> {
  _$FoodContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Amount,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get weight {
    return $AmountCopyWith<$Res>(_value.weight, (value) {
      return _then(_value.copyWith(weight: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodContainerImplCopyWith<$Res>
    implements $FoodContainerCopyWith<$Res> {
  factory _$$FoodContainerImplCopyWith(
          _$FoodContainerImpl value, $Res Function(_$FoodContainerImpl) then) =
      __$$FoodContainerImplCopyWithImpl<$Res>;
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
class __$$FoodContainerImplCopyWithImpl<$Res>
    extends _$FoodContainerCopyWithImpl<$Res, _$FoodContainerImpl>
    implements _$$FoodContainerImplCopyWith<$Res> {
  __$$FoodContainerImplCopyWithImpl(
      _$FoodContainerImpl _value, $Res Function(_$FoodContainerImpl) _then)
      : super(_value, _then);

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
    return _then(_$FoodContainerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Amount,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$FoodContainerImpl implements _FoodContainer {
  const _$FoodContainerImpl(
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

  @override
  String toString() {
    return 'FoodContainer(id: $id, name: $name, description: $description, weight: $weight, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodContainerImpl &&
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

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodContainerImplCopyWith<_$FoodContainerImpl> get copyWith =>
      __$$FoodContainerImplCopyWithImpl<_$FoodContainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodContainerImplToJson(
      this,
    );
  }
}

abstract class _FoodContainer implements FoodContainer {
  const factory _FoodContainer(
      {final String? id,
      required final String name,
      required final String description,
      required final Amount weight,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$FoodContainerImpl;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  Amount get weight;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of FoodContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodContainerImplCopyWith<_$FoodContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
