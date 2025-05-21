// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_container_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodContainerDbModel _$FoodContainerDbModelFromJson(Map<String, dynamic> json) {
  return _FoodContainerDbModel.fromJson(json);
}

/// @nodoc
mixin _$FoodContainerDbModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get weight_unit => throw _privateConstructorUsedError;
  double get weight_value => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get created_at => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get updated_at => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at => throw _privateConstructorUsedError;

  /// Serializes this FoodContainerDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodContainerDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodContainerDbModelCopyWith<FoodContainerDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodContainerDbModelCopyWith<$Res> {
  factory $FoodContainerDbModelCopyWith(FoodContainerDbModel value,
          $Res Function(FoodContainerDbModel) then) =
      _$FoodContainerDbModelCopyWithImpl<$Res, FoodContainerDbModel>;
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
class _$FoodContainerDbModelCopyWithImpl<$Res,
        $Val extends FoodContainerDbModel>
    implements $FoodContainerDbModelCopyWith<$Res> {
  _$FoodContainerDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      weight_unit: null == weight_unit
          ? _value.weight_unit
          : weight_unit // ignore: cast_nullable_to_non_nullable
              as String,
      weight_value: null == weight_value
          ? _value.weight_value
          : weight_value // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$FoodContainerDbModelImplCopyWith<$Res>
    implements $FoodContainerDbModelCopyWith<$Res> {
  factory _$$FoodContainerDbModelImplCopyWith(_$FoodContainerDbModelImpl value,
          $Res Function(_$FoodContainerDbModelImpl) then) =
      __$$FoodContainerDbModelImplCopyWithImpl<$Res>;
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
class __$$FoodContainerDbModelImplCopyWithImpl<$Res>
    extends _$FoodContainerDbModelCopyWithImpl<$Res, _$FoodContainerDbModelImpl>
    implements _$$FoodContainerDbModelImplCopyWith<$Res> {
  __$$FoodContainerDbModelImplCopyWithImpl(_$FoodContainerDbModelImpl _value,
      $Res Function(_$FoodContainerDbModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$FoodContainerDbModelImpl(
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
      weight_unit: null == weight_unit
          ? _value.weight_unit
          : weight_unit // ignore: cast_nullable_to_non_nullable
              as String,
      weight_value: null == weight_value
          ? _value.weight_value
          : weight_value // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$FoodContainerDbModelImpl implements _FoodContainerDbModel {
  _$FoodContainerDbModelImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.weight_unit,
      required this.weight_value,
      @JsonKey(includeToJson: false, includeFromJson: true) this.created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at});

  factory _$FoodContainerDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodContainerDbModelImplFromJson(json);

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

  @override
  String toString() {
    return 'FoodContainerDbModel(id: $id, name: $name, description: $description, weight_unit: $weight_unit, weight_value: $weight_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodContainerDbModelImpl &&
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

  /// Create a copy of FoodContainerDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodContainerDbModelImplCopyWith<_$FoodContainerDbModelImpl>
      get copyWith =>
          __$$FoodContainerDbModelImplCopyWithImpl<_$FoodContainerDbModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodContainerDbModelImplToJson(
      this,
    );
  }
}

abstract class _FoodContainerDbModel implements FoodContainerDbModel {
  factory _FoodContainerDbModel(
      {required final String id,
      required final String name,
      final String? description,
      required final String weight_unit,
      required final double weight_value,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? deleted_at}) = _$FoodContainerDbModelImpl;

  factory _FoodContainerDbModel.fromJson(Map<String, dynamic> json) =
      _$FoodContainerDbModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get weight_unit;
  @override
  double get weight_value;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get created_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get updated_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at;

  /// Create a copy of FoodContainerDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodContainerDbModelImplCopyWith<_$FoodContainerDbModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
