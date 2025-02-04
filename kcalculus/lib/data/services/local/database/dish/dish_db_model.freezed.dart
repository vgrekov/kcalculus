// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DishDbModel _$DishDbModelFromJson(Map<String, dynamic> json) {
  return _DishDbModel.fromJson(json);
}

/// @nodoc
mixin _$DishDbModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get description => throw _privateConstructorUsedError;
  String? get mass_per_amount_unit => throw _privateConstructorUsedError;
  double? get mass_per_amount_value => throw _privateConstructorUsedError;
  String? get mass_total_amount_unit => throw _privateConstructorUsedError;
  double? get mass_total_amount_value => throw _privateConstructorUsedError;
  String? get volume_per_amount_unit => throw _privateConstructorUsedError;
  double? get volume_per_amount_value => throw _privateConstructorUsedError;
  String? get volume_total_amount_unit => throw _privateConstructorUsedError;
  double? get volume_total_amount_value => throw _privateConstructorUsedError;
  String? get quantity_per_amount_unit => throw _privateConstructorUsedError;
  double? get quantity_per_amount_value => throw _privateConstructorUsedError;
  String? get quantity_total_amount_unit => throw _privateConstructorUsedError;
  double? get quantity_total_amount_value => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get created_at => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get updated_at => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at => throw _privateConstructorUsedError;

  /// Serializes this DishDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DishDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DishDbModelCopyWith<DishDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishDbModelCopyWith<$Res> {
  factory $DishDbModelCopyWith(
          DishDbModel value, $Res Function(DishDbModel) then) =
      _$DishDbModelCopyWithImpl<$Res, DishDbModel>;
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
class _$DishDbModelCopyWithImpl<$Res, $Val extends DishDbModel>
    implements $DishDbModelCopyWith<$Res> {
  _$DishDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DishDbModel
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishDbModelImplCopyWith<$Res>
    implements $DishDbModelCopyWith<$Res> {
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
    extends _$DishDbModelCopyWithImpl<$Res, _$DishDbModelImpl>
    implements _$$DishDbModelImplCopyWith<$Res> {
  __$$DishDbModelImplCopyWithImpl(
      _$DishDbModelImpl _value, $Res Function(_$DishDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DishDbModel
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
class _$DishDbModelImpl extends _DishDbModel {
  const _$DishDbModelImpl(
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
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at})
      : super._();

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

  @override
  String toString() {
    return 'DishDbModel(id: $id, name: $name, description: $description, mass_per_amount_unit: $mass_per_amount_unit, mass_per_amount_value: $mass_per_amount_value, mass_total_amount_unit: $mass_total_amount_unit, mass_total_amount_value: $mass_total_amount_value, volume_per_amount_unit: $volume_per_amount_unit, volume_per_amount_value: $volume_per_amount_value, volume_total_amount_unit: $volume_total_amount_unit, volume_total_amount_value: $volume_total_amount_value, quantity_per_amount_unit: $quantity_per_amount_unit, quantity_per_amount_value: $quantity_per_amount_value, quantity_total_amount_unit: $quantity_total_amount_unit, quantity_total_amount_value: $quantity_total_amount_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
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

  /// Create a copy of DishDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DishDbModelImplCopyWith<_$DishDbModelImpl> get copyWith =>
      __$$DishDbModelImplCopyWithImpl<_$DishDbModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishDbModelImplToJson(
      this,
    );
  }
}

abstract class _DishDbModel extends DishDbModel {
  const factory _DishDbModel(
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
  const _DishDbModel._() : super._();

  factory _DishDbModel.fromJson(Map<String, dynamic> json) =
      _$DishDbModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String get name;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get description;
  @override
  String? get mass_per_amount_unit;
  @override
  double? get mass_per_amount_value;
  @override
  String? get mass_total_amount_unit;
  @override
  double? get mass_total_amount_value;
  @override
  String? get volume_per_amount_unit;
  @override
  double? get volume_per_amount_value;
  @override
  String? get volume_total_amount_unit;
  @override
  double? get volume_total_amount_value;
  @override
  String? get quantity_per_amount_unit;
  @override
  double? get quantity_per_amount_value;
  @override
  String? get quantity_total_amount_unit;
  @override
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

  /// Create a copy of DishDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DishDbModelImplCopyWith<_$DishDbModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
