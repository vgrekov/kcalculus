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
  switch (json['runtimeType']) {
    case 'default':
      return _EdibleDbModel.fromJson(json);
    case 'food':
      return FoodDbModel.fromJson(json);
    case 'dish':
      return DishDbModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'EdibleDbModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        $default, {
    required TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        food,
    required TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        dish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        $default, {
    TResult? Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        food,
    TResult? Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        dish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        $default, {
    TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        food,
    TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        dish,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EdibleDbModel value) $default, {
    required TResult Function(FoodDbModel value) food,
    required TResult Function(DishDbModel value) dish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EdibleDbModel value)? $default, {
    TResult? Function(FoodDbModel value)? food,
    TResult? Function(DishDbModel value)? dish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EdibleDbModel value)? $default, {
    TResult Function(FoodDbModel value)? food,
    TResult Function(DishDbModel value)? dish,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

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
abstract class _$$EdibleDbModelImplCopyWith<$Res>
    implements $EdibleDbModelCopyWith<$Res> {
  factory _$$EdibleDbModelImplCopyWith(
          _$EdibleDbModelImpl value, $Res Function(_$EdibleDbModelImpl) then) =
      __$$EdibleDbModelImplCopyWithImpl<$Res>;
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
class __$$EdibleDbModelImplCopyWithImpl<$Res>
    extends _$EdibleDbModelCopyWithImpl<$Res, _$EdibleDbModelImpl>
    implements _$$EdibleDbModelImplCopyWith<$Res> {
  __$$EdibleDbModelImplCopyWithImpl(
      _$EdibleDbModelImpl _value, $Res Function(_$EdibleDbModelImpl) _then)
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
    return _then(_$EdibleDbModelImpl(
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
class _$EdibleDbModelImpl extends _EdibleDbModel {
  _$EdibleDbModelImpl(
      {required this.id,
      required this.name,
      this.description,
      @JsonKey(includeToJson: false, includeFromJson: true) this.created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$EdibleDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EdibleDbModelImplFromJson(json);

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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EdibleDbModel(id: $id, name: $name, description: $description, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EdibleDbModelImpl &&
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
  _$$EdibleDbModelImplCopyWith<_$EdibleDbModelImpl> get copyWith =>
      __$$EdibleDbModelImplCopyWithImpl<_$EdibleDbModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        $default, {
    required TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        food,
    required TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        dish,
  }) {
    return $default(id, name, description, created_at, updated_at, deleted_at);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        $default, {
    TResult? Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        food,
    TResult? Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        dish,
  }) {
    return $default?.call(
        id, name, description, created_at, updated_at, deleted_at);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        $default, {
    TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        food,
    TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        dish,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          id, name, description, created_at, updated_at, deleted_at);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EdibleDbModel value) $default, {
    required TResult Function(FoodDbModel value) food,
    required TResult Function(DishDbModel value) dish,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EdibleDbModel value)? $default, {
    TResult? Function(FoodDbModel value)? food,
    TResult? Function(DishDbModel value)? dish,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EdibleDbModel value)? $default, {
    TResult Function(FoodDbModel value)? food,
    TResult Function(DishDbModel value)? dish,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EdibleDbModelImplToJson(
      this,
    );
  }
}

abstract class _EdibleDbModel extends EdibleDbModel {
  factory _EdibleDbModel(
      {required final String id,
      required final String name,
      final String? description,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? deleted_at}) = _$EdibleDbModelImpl;
  _EdibleDbModel._() : super._();

  factory _EdibleDbModel.fromJson(Map<String, dynamic> json) =
      _$EdibleDbModelImpl.fromJson;

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
  _$$EdibleDbModelImplCopyWith<_$EdibleDbModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
      @JsonKey(includeToJson: false, includeFromJson: true) String name,
      @JsonKey(includeToJson: false, includeFromJson: true) String? description,
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
class _$FoodDbModelImpl extends FoodDbModel {
  _$FoodDbModelImpl(
      {required this.id,
      @JsonKey(includeToJson: false, includeFromJson: true) required this.name,
      @JsonKey(includeToJson: false, includeFromJson: true) this.description,
      @JsonKey(includeToJson: false, includeFromJson: true) this.created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at,
      final String? $type})
      : $type = $type ?? 'food',
        super._();

  factory _$FoodDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodDbModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String name;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EdibleDbModel.food(id: $id, name: $name, description: $description, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        $default, {
    required TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        food,
    required TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        dish,
  }) {
    return food(id, name, description, created_at, updated_at, deleted_at);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        $default, {
    TResult? Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        food,
    TResult? Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        dish,
  }) {
    return food?.call(
        id, name, description, created_at, updated_at, deleted_at);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        $default, {
    TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        food,
    TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        dish,
    required TResult orElse(),
  }) {
    if (food != null) {
      return food(id, name, description, created_at, updated_at, deleted_at);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EdibleDbModel value) $default, {
    required TResult Function(FoodDbModel value) food,
    required TResult Function(DishDbModel value) dish,
  }) {
    return food(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EdibleDbModel value)? $default, {
    TResult? Function(FoodDbModel value)? food,
    TResult? Function(DishDbModel value)? dish,
  }) {
    return food?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EdibleDbModel value)? $default, {
    TResult Function(FoodDbModel value)? food,
    TResult Function(DishDbModel value)? dish,
    required TResult orElse(),
  }) {
    if (food != null) {
      return food(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodDbModelImplToJson(
      this,
    );
  }
}

abstract class FoodDbModel extends EdibleDbModel {
  factory FoodDbModel(
      {required final String id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      required final String name,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? description,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? deleted_at}) = _$FoodDbModelImpl;
  FoodDbModel._() : super._();

  factory FoodDbModel.fromJson(Map<String, dynamic> json) =
      _$FoodDbModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String get name;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
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

/// @nodoc
abstract class _$$DishDbModelImplCopyWith<$Res>
    implements $EdibleDbModelCopyWith<$Res> {
  factory _$$DishDbModelImplCopyWith(
          _$DishDbModelImpl value, $Res Function(_$DishDbModelImpl) then) =
      __$$DishDbModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(includeToJson: false, includeFromJson: true) String name,
      @JsonKey(includeToJson: false, includeFromJson: true) String? description,
      String? mass_per_amount_unit,
      double? mass_per_amount_value,
      String? mass_total_amount_unit,
      double? mass_total_amount_value,
      String? volume_per_amount_unit,
      double? volume_per_amount_value,
      String? volume_total_amount_unit,
      double? volume_total_amount_value,
      String? quantity_per_amount_unit,
      double? quantity_per_amount_value,
      String? quantity_total_amount_unit,
      double? quantity_total_amount_value,
      @JsonKey(includeToJson: false, includeFromJson: true) String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class __$$DishDbModelImplCopyWithImpl<$Res>
    extends _$EdibleDbModelCopyWithImpl<$Res, _$DishDbModelImpl>
    implements _$$DishDbModelImplCopyWith<$Res> {
  __$$DishDbModelImplCopyWithImpl(
      _$DishDbModelImpl _value, $Res Function(_$DishDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? mass_per_amount_unit = freezed,
    Object? mass_per_amount_value = freezed,
    Object? mass_total_amount_unit = freezed,
    Object? mass_total_amount_value = freezed,
    Object? volume_per_amount_unit = freezed,
    Object? volume_per_amount_value = freezed,
    Object? volume_total_amount_unit = freezed,
    Object? volume_total_amount_value = freezed,
    Object? quantity_per_amount_unit = freezed,
    Object? quantity_per_amount_value = freezed,
    Object? quantity_total_amount_unit = freezed,
    Object? quantity_total_amount_value = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
  }) {
    return _then(_$DishDbModelImpl(
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
      mass_per_amount_unit: freezed == mass_per_amount_unit
          ? _value.mass_per_amount_unit
          : mass_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      mass_per_amount_value: freezed == mass_per_amount_value
          ? _value.mass_per_amount_value
          : mass_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      mass_total_amount_unit: freezed == mass_total_amount_unit
          ? _value.mass_total_amount_unit
          : mass_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      mass_total_amount_value: freezed == mass_total_amount_value
          ? _value.mass_total_amount_value
          : mass_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      volume_per_amount_unit: freezed == volume_per_amount_unit
          ? _value.volume_per_amount_unit
          : volume_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      volume_per_amount_value: freezed == volume_per_amount_value
          ? _value.volume_per_amount_value
          : volume_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      volume_total_amount_unit: freezed == volume_total_amount_unit
          ? _value.volume_total_amount_unit
          : volume_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      volume_total_amount_value: freezed == volume_total_amount_value
          ? _value.volume_total_amount_value
          : volume_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity_per_amount_unit: freezed == quantity_per_amount_unit
          ? _value.quantity_per_amount_unit
          : quantity_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity_per_amount_value: freezed == quantity_per_amount_value
          ? _value.quantity_per_amount_value
          : quantity_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity_total_amount_unit: freezed == quantity_total_amount_unit
          ? _value.quantity_total_amount_unit
          : quantity_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity_total_amount_value: freezed == quantity_total_amount_value
          ? _value.quantity_total_amount_value
          : quantity_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$DishDbModelImpl extends DishDbModel {
  _$DishDbModelImpl(
      {required this.id,
      @JsonKey(includeToJson: false, includeFromJson: true) required this.name,
      @JsonKey(includeToJson: false, includeFromJson: true) this.description,
      this.mass_per_amount_unit,
      this.mass_per_amount_value,
      this.mass_total_amount_unit,
      this.mass_total_amount_value,
      this.volume_per_amount_unit,
      this.volume_per_amount_value,
      this.volume_total_amount_unit,
      this.volume_total_amount_value,
      this.quantity_per_amount_unit,
      this.quantity_per_amount_value,
      this.quantity_total_amount_unit,
      this.quantity_total_amount_value,
      @JsonKey(includeToJson: false, includeFromJson: true) this.created_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at,
      final String? $type})
      : $type = $type ?? 'dish',
        super._();

  factory _$DishDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishDbModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String name;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? description;
  @override
  final String? mass_per_amount_unit;
  @override
  final double? mass_per_amount_value;
  @override
  final String? mass_total_amount_unit;
  @override
  final double? mass_total_amount_value;
  @override
  final String? volume_per_amount_unit;
  @override
  final double? volume_per_amount_value;
  @override
  final String? volume_total_amount_unit;
  @override
  final double? volume_total_amount_value;
  @override
  final String? quantity_per_amount_unit;
  @override
  final double? quantity_per_amount_value;
  @override
  final String? quantity_total_amount_unit;
  @override
  final double? quantity_total_amount_value;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? created_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? updated_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? deleted_at;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EdibleDbModel.dish(id: $id, name: $name, description: $description, mass_per_amount_unit: $mass_per_amount_unit, mass_per_amount_value: $mass_per_amount_value, mass_total_amount_unit: $mass_total_amount_unit, mass_total_amount_value: $mass_total_amount_value, volume_per_amount_unit: $volume_per_amount_unit, volume_per_amount_value: $volume_per_amount_value, volume_total_amount_unit: $volume_total_amount_unit, volume_total_amount_value: $volume_total_amount_value, quantity_per_amount_unit: $quantity_per_amount_unit, quantity_per_amount_value: $quantity_per_amount_value, quantity_total_amount_unit: $quantity_total_amount_unit, quantity_total_amount_value: $quantity_total_amount_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishDbModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mass_per_amount_unit, mass_per_amount_unit) ||
                other.mass_per_amount_unit == mass_per_amount_unit) &&
            (identical(other.mass_per_amount_value, mass_per_amount_value) ||
                other.mass_per_amount_value == mass_per_amount_value) &&
            (identical(other.mass_total_amount_unit, mass_total_amount_unit) ||
                other.mass_total_amount_unit == mass_total_amount_unit) &&
            (identical(other.mass_total_amount_value, mass_total_amount_value) ||
                other.mass_total_amount_value == mass_total_amount_value) &&
            (identical(other.volume_per_amount_unit, volume_per_amount_unit) ||
                other.volume_per_amount_unit == volume_per_amount_unit) &&
            (identical(other.volume_per_amount_value, volume_per_amount_value) ||
                other.volume_per_amount_value == volume_per_amount_value) &&
            (identical(other.volume_total_amount_unit, volume_total_amount_unit) ||
                other.volume_total_amount_unit == volume_total_amount_unit) &&
            (identical(other.volume_total_amount_value, volume_total_amount_value) ||
                other.volume_total_amount_value == volume_total_amount_value) &&
            (identical(other.quantity_per_amount_unit, quantity_per_amount_unit) ||
                other.quantity_per_amount_unit == quantity_per_amount_unit) &&
            (identical(other.quantity_per_amount_value, quantity_per_amount_value) ||
                other.quantity_per_amount_value == quantity_per_amount_value) &&
            (identical(other.quantity_total_amount_unit,
                    quantity_total_amount_unit) ||
                other.quantity_total_amount_unit ==
                    quantity_total_amount_unit) &&
            (identical(other.quantity_total_amount_value,
                    quantity_total_amount_value) ||
                other.quantity_total_amount_value ==
                    quantity_total_amount_value) &&
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
      mass_per_amount_unit,
      mass_per_amount_value,
      mass_total_amount_unit,
      mass_total_amount_value,
      volume_per_amount_unit,
      volume_per_amount_value,
      volume_total_amount_unit,
      volume_total_amount_value,
      quantity_per_amount_unit,
      quantity_per_amount_value,
      quantity_total_amount_unit,
      quantity_total_amount_value,
      created_at,
      updated_at,
      deleted_at);

  /// Create a copy of EdibleDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DishDbModelImplCopyWith<_$DishDbModelImpl> get copyWith =>
      __$$DishDbModelImplCopyWithImpl<_$DishDbModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        $default, {
    required TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        food,
    required TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)
        dish,
  }) {
    return dish(
        id,
        name,
        description,
        mass_per_amount_unit,
        mass_per_amount_value,
        mass_total_amount_unit,
        mass_total_amount_value,
        volume_per_amount_unit,
        volume_per_amount_value,
        volume_total_amount_unit,
        volume_total_amount_value,
        quantity_per_amount_unit,
        quantity_per_amount_value,
        quantity_total_amount_unit,
        quantity_total_amount_value,
        created_at,
        updated_at,
        deleted_at);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        $default, {
    TResult? Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        food,
    TResult? Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        dish,
  }) {
    return dish?.call(
        id,
        name,
        description,
        mass_per_amount_unit,
        mass_per_amount_value,
        mass_total_amount_unit,
        mass_total_amount_value,
        volume_per_amount_unit,
        volume_per_amount_value,
        volume_total_amount_unit,
        volume_total_amount_value,
        quantity_per_amount_unit,
        quantity_per_amount_value,
        quantity_total_amount_unit,
        quantity_total_amount_value,
        created_at,
        updated_at,
        deleted_at);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        $default, {
    TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        food,
    TResult Function(
            String id,
            @JsonKey(includeToJson: false, includeFromJson: true) String name,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? description,
            String? mass_per_amount_unit,
            double? mass_per_amount_value,
            String? mass_total_amount_unit,
            double? mass_total_amount_value,
            String? volume_per_amount_unit,
            double? volume_per_amount_value,
            String? volume_total_amount_unit,
            double? volume_total_amount_value,
            String? quantity_per_amount_unit,
            double? quantity_per_amount_value,
            String? quantity_total_amount_unit,
            double? quantity_total_amount_value,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? created_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? updated_at,
            @JsonKey(includeToJson: false, includeFromJson: true)
            String? deleted_at)?
        dish,
    required TResult orElse(),
  }) {
    if (dish != null) {
      return dish(
          id,
          name,
          description,
          mass_per_amount_unit,
          mass_per_amount_value,
          mass_total_amount_unit,
          mass_total_amount_value,
          volume_per_amount_unit,
          volume_per_amount_value,
          volume_total_amount_unit,
          volume_total_amount_value,
          quantity_per_amount_unit,
          quantity_per_amount_value,
          quantity_total_amount_unit,
          quantity_total_amount_value,
          created_at,
          updated_at,
          deleted_at);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EdibleDbModel value) $default, {
    required TResult Function(FoodDbModel value) food,
    required TResult Function(DishDbModel value) dish,
  }) {
    return dish(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EdibleDbModel value)? $default, {
    TResult? Function(FoodDbModel value)? food,
    TResult? Function(DishDbModel value)? dish,
  }) {
    return dish?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EdibleDbModel value)? $default, {
    TResult Function(FoodDbModel value)? food,
    TResult Function(DishDbModel value)? dish,
    required TResult orElse(),
  }) {
    if (dish != null) {
      return dish(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DishDbModelImplToJson(
      this,
    );
  }
}

abstract class DishDbModel extends EdibleDbModel {
  factory DishDbModel(
      {required final String id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      required final String name,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? description,
      final String? mass_per_amount_unit,
      final double? mass_per_amount_value,
      final String? mass_total_amount_unit,
      final double? mass_total_amount_value,
      final String? volume_per_amount_unit,
      final double? volume_per_amount_value,
      final String? volume_total_amount_unit,
      final double? volume_total_amount_value,
      final String? quantity_per_amount_unit,
      final double? quantity_per_amount_value,
      final String? quantity_total_amount_unit,
      final double? quantity_total_amount_value,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? created_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? updated_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? deleted_at}) = _$DishDbModelImpl;
  DishDbModel._() : super._();

  factory DishDbModel.fromJson(Map<String, dynamic> json) =
      _$DishDbModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String get name;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get description;
  String? get mass_per_amount_unit;
  double? get mass_per_amount_value;
  String? get mass_total_amount_unit;
  double? get mass_total_amount_value;
  String? get volume_per_amount_unit;
  double? get volume_per_amount_value;
  String? get volume_total_amount_unit;
  double? get volume_total_amount_value;
  String? get quantity_per_amount_unit;
  double? get quantity_per_amount_value;
  String? get quantity_total_amount_unit;
  double? get quantity_total_amount_value;
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
  _$$DishDbModelImplCopyWith<_$DishDbModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
