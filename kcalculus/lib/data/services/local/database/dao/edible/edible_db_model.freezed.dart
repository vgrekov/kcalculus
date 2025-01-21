// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EdibleDbModel _$EdibleDbModelFromJson(Map<String, dynamic> json) {
  return FoodDbModel.fromJson(json);
}

/// @nodoc
mixin _$EdibleDbModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get created_at => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get updated_at => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at => throw _privateConstructorUsedError;

  /// Serializes this EdibleDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EdibleDbModelCopyWith<EdibleDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EdibleDbModelCopyWith<$Res> {
  factory $EdibleDbModelCopyWith(
          EdibleDbModel value, $Res Function(EdibleDbModel) then) =
      _$EdibleDbModelCopyWithImpl<$Res, EdibleDbModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class _$EdibleDbModelCopyWithImpl<$Res, $Val extends EdibleDbModel>
    implements $EdibleDbModelCopyWith<$Res> {
  _$EdibleDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodDbModelImplCopyWith<$Res>
    implements $EdibleDbModelCopyWith<$Res> {
  factory _$$FoodDbModelImplCopyWith(
          _$FoodDbModelImpl value, $Res Function(_$FoodDbModelImpl) then) =
      __$$FoodDbModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class __$$FoodDbModelImplCopyWithImpl<$Res>
    extends _$EdibleDbModelCopyWithImpl<$Res, _$FoodDbModelImpl>
    implements _$$FoodDbModelImplCopyWith<$Res> {
  __$$FoodDbModelImplCopyWithImpl(
      _$FoodDbModelImpl _value, $Res Function(_$FoodDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
  }) {
    return _then(_$FoodDbModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodDbModelImpl implements FoodDbModel {
  _$FoodDbModelImpl(
      {required this.id,
      required this.name,
      this.description,
      @JsonKey(includeToJson: false, includeFromJson: true) this.created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at});

  factory _$FoodDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodDbModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? created_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? updated_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? deleted_at;

  @override
  String toString() {
    return 'EdibleDbModel(id: $id, name: $name, description: $description, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodDbModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
      runtimeType, id, name, description, created_at, updated_at, deleted_at);

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodDbModelImplCopyWith<_$FoodDbModelImpl> get copyWith =>
      __$$FoodDbModelImplCopyWithImpl<_$FoodDbModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodDbModelImplToJson(
      this,
    );
  }
}

abstract class FoodDbModel implements EdibleDbModel {
  factory FoodDbModel(
      {required final String id,
      required final String name,
      final String? description,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? deleted_at}) = _$FoodDbModelImpl;

  factory FoodDbModel.fromJson(Map<String, dynamic> json) =
      _$FoodDbModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get created_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get updated_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at;

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodDbModelImplCopyWith<_$FoodDbModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
