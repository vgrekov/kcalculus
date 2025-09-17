// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DishDbModel {
  String get id;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String get name;
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

  /// Create a copy of DishDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DishDbModelCopyWith<DishDbModel> get copyWith =>
      _$DishDbModelCopyWithImpl<DishDbModel>(this as DishDbModel, _$identity);

  /// Serializes this DishDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DishDbModel &&
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
            (identical(other.quantity_total_amount_unit, quantity_total_amount_unit) ||
                other.quantity_total_amount_unit ==
                    quantity_total_amount_unit) &&
            (identical(other.quantity_total_amount_value, quantity_total_amount_value) ||
                other.quantity_total_amount_value ==
                    quantity_total_amount_value) &&
            (identical(other.nf_preview_per_unit, nf_preview_per_unit) ||
                other.nf_preview_per_unit == nf_preview_per_unit) &&
            (identical(other.nf_preview_per_value, nf_preview_per_value) ||
                other.nf_preview_per_value == nf_preview_per_value) &&
            (identical(other.nf_preview_calories_unit, nf_preview_calories_unit) ||
                other.nf_preview_calories_unit == nf_preview_calories_unit) &&
            (identical(other.nf_preview_calories_value, nf_preview_calories_value) ||
                other.nf_preview_calories_value == nf_preview_calories_value) &&
            (identical(other.nf_preview_fat_unit, nf_preview_fat_unit) ||
                other.nf_preview_fat_unit == nf_preview_fat_unit) &&
            (identical(other.nf_preview_fat_value, nf_preview_fat_value) ||
                other.nf_preview_fat_value == nf_preview_fat_value) &&
            (identical(other.nf_preview_carbs_unit, nf_preview_carbs_unit) ||
                other.nf_preview_carbs_unit == nf_preview_carbs_unit) &&
            (identical(other.nf_preview_carbs_value, nf_preview_carbs_value) ||
                other.nf_preview_carbs_value == nf_preview_carbs_value) &&
            (identical(other.nf_preview_protein_unit, nf_preview_protein_unit) || other.nf_preview_protein_unit == nf_preview_protein_unit) &&
            (identical(other.nf_preview_protein_value, nf_preview_protein_value) || other.nf_preview_protein_value == nf_preview_protein_value) &&
            (identical(other.nf_preview_fiber_unit, nf_preview_fiber_unit) || other.nf_preview_fiber_unit == nf_preview_fiber_unit) &&
            (identical(other.nf_preview_fiber_value, nf_preview_fiber_value) || other.nf_preview_fiber_value == nf_preview_fiber_value) &&
            (identical(other.created_at, created_at) || other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) || other.updated_at == updated_at) &&
            (identical(other.deleted_at, deleted_at) || other.deleted_at == deleted_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        deleted_at
      ]);

  @override
  String toString() {
    return 'DishDbModel(id: $id, name: $name, description: $description, mass_per_amount_unit: $mass_per_amount_unit, mass_per_amount_value: $mass_per_amount_value, mass_total_amount_unit: $mass_total_amount_unit, mass_total_amount_value: $mass_total_amount_value, volume_per_amount_unit: $volume_per_amount_unit, volume_per_amount_value: $volume_per_amount_value, volume_total_amount_unit: $volume_total_amount_unit, volume_total_amount_value: $volume_total_amount_value, quantity_per_amount_unit: $quantity_per_amount_unit, quantity_per_amount_value: $quantity_per_amount_value, quantity_total_amount_unit: $quantity_total_amount_unit, quantity_total_amount_value: $quantity_total_amount_value, nf_preview_per_unit: $nf_preview_per_unit, nf_preview_per_value: $nf_preview_per_value, nf_preview_calories_unit: $nf_preview_calories_unit, nf_preview_calories_value: $nf_preview_calories_value, nf_preview_fat_unit: $nf_preview_fat_unit, nf_preview_fat_value: $nf_preview_fat_value, nf_preview_carbs_unit: $nf_preview_carbs_unit, nf_preview_carbs_value: $nf_preview_carbs_value, nf_preview_protein_unit: $nf_preview_protein_unit, nf_preview_protein_value: $nf_preview_protein_value, nf_preview_fiber_unit: $nf_preview_fiber_unit, nf_preview_fiber_value: $nf_preview_fiber_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }
}

/// @nodoc
abstract mixin class $DishDbModelCopyWith<$Res> {
  factory $DishDbModelCopyWith(
          DishDbModel value, $Res Function(DishDbModel) _then) =
      _$DishDbModelCopyWithImpl;
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
class _$DishDbModelCopyWithImpl<$Res> implements $DishDbModelCopyWith<$Res> {
  _$DishDbModelCopyWithImpl(this._self, this._then);

  final DishDbModel _self;
  final $Res Function(DishDbModel) _then;

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
      mass_per_amount_unit: freezed == mass_per_amount_unit
          ? _self.mass_per_amount_unit
          : mass_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      mass_per_amount_value: freezed == mass_per_amount_value
          ? _self.mass_per_amount_value
          : mass_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      mass_total_amount_unit: freezed == mass_total_amount_unit
          ? _self.mass_total_amount_unit
          : mass_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      mass_total_amount_value: freezed == mass_total_amount_value
          ? _self.mass_total_amount_value
          : mass_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      volume_per_amount_unit: freezed == volume_per_amount_unit
          ? _self.volume_per_amount_unit
          : volume_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      volume_per_amount_value: freezed == volume_per_amount_value
          ? _self.volume_per_amount_value
          : volume_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      volume_total_amount_unit: freezed == volume_total_amount_unit
          ? _self.volume_total_amount_unit
          : volume_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      volume_total_amount_value: freezed == volume_total_amount_value
          ? _self.volume_total_amount_value
          : volume_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity_per_amount_unit: freezed == quantity_per_amount_unit
          ? _self.quantity_per_amount_unit
          : quantity_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity_per_amount_value: freezed == quantity_per_amount_value
          ? _self.quantity_per_amount_value
          : quantity_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity_total_amount_unit: freezed == quantity_total_amount_unit
          ? _self.quantity_total_amount_unit
          : quantity_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity_total_amount_value: freezed == quantity_total_amount_value
          ? _self.quantity_total_amount_value
          : quantity_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _DishDbModel extends DishDbModel {
  const _DishDbModel(
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
  factory _DishDbModel.fromJson(Map<String, dynamic> json) =>
      _$DishDbModelFromJson(json);

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

  /// Create a copy of DishDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DishDbModelCopyWith<_DishDbModel> get copyWith =>
      __$DishDbModelCopyWithImpl<_DishDbModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DishDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DishDbModel &&
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
            (identical(other.quantity_total_amount_unit, quantity_total_amount_unit) ||
                other.quantity_total_amount_unit ==
                    quantity_total_amount_unit) &&
            (identical(other.quantity_total_amount_value, quantity_total_amount_value) ||
                other.quantity_total_amount_value ==
                    quantity_total_amount_value) &&
            (identical(other.nf_preview_per_unit, nf_preview_per_unit) ||
                other.nf_preview_per_unit == nf_preview_per_unit) &&
            (identical(other.nf_preview_per_value, nf_preview_per_value) ||
                other.nf_preview_per_value == nf_preview_per_value) &&
            (identical(other.nf_preview_calories_unit, nf_preview_calories_unit) ||
                other.nf_preview_calories_unit == nf_preview_calories_unit) &&
            (identical(other.nf_preview_calories_value, nf_preview_calories_value) ||
                other.nf_preview_calories_value == nf_preview_calories_value) &&
            (identical(other.nf_preview_fat_unit, nf_preview_fat_unit) ||
                other.nf_preview_fat_unit == nf_preview_fat_unit) &&
            (identical(other.nf_preview_fat_value, nf_preview_fat_value) ||
                other.nf_preview_fat_value == nf_preview_fat_value) &&
            (identical(other.nf_preview_carbs_unit, nf_preview_carbs_unit) ||
                other.nf_preview_carbs_unit == nf_preview_carbs_unit) &&
            (identical(other.nf_preview_carbs_value, nf_preview_carbs_value) ||
                other.nf_preview_carbs_value == nf_preview_carbs_value) &&
            (identical(other.nf_preview_protein_unit, nf_preview_protein_unit) || other.nf_preview_protein_unit == nf_preview_protein_unit) &&
            (identical(other.nf_preview_protein_value, nf_preview_protein_value) || other.nf_preview_protein_value == nf_preview_protein_value) &&
            (identical(other.nf_preview_fiber_unit, nf_preview_fiber_unit) || other.nf_preview_fiber_unit == nf_preview_fiber_unit) &&
            (identical(other.nf_preview_fiber_value, nf_preview_fiber_value) || other.nf_preview_fiber_value == nf_preview_fiber_value) &&
            (identical(other.created_at, created_at) || other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) || other.updated_at == updated_at) &&
            (identical(other.deleted_at, deleted_at) || other.deleted_at == deleted_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        deleted_at
      ]);

  @override
  String toString() {
    return 'DishDbModel(id: $id, name: $name, description: $description, mass_per_amount_unit: $mass_per_amount_unit, mass_per_amount_value: $mass_per_amount_value, mass_total_amount_unit: $mass_total_amount_unit, mass_total_amount_value: $mass_total_amount_value, volume_per_amount_unit: $volume_per_amount_unit, volume_per_amount_value: $volume_per_amount_value, volume_total_amount_unit: $volume_total_amount_unit, volume_total_amount_value: $volume_total_amount_value, quantity_per_amount_unit: $quantity_per_amount_unit, quantity_per_amount_value: $quantity_per_amount_value, quantity_total_amount_unit: $quantity_total_amount_unit, quantity_total_amount_value: $quantity_total_amount_value, nf_preview_per_unit: $nf_preview_per_unit, nf_preview_per_value: $nf_preview_per_value, nf_preview_calories_unit: $nf_preview_calories_unit, nf_preview_calories_value: $nf_preview_calories_value, nf_preview_fat_unit: $nf_preview_fat_unit, nf_preview_fat_value: $nf_preview_fat_value, nf_preview_carbs_unit: $nf_preview_carbs_unit, nf_preview_carbs_value: $nf_preview_carbs_value, nf_preview_protein_unit: $nf_preview_protein_unit, nf_preview_protein_value: $nf_preview_protein_value, nf_preview_fiber_unit: $nf_preview_fiber_unit, nf_preview_fiber_value: $nf_preview_fiber_value, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }
}

/// @nodoc
abstract mixin class _$DishDbModelCopyWith<$Res>
    implements $DishDbModelCopyWith<$Res> {
  factory _$DishDbModelCopyWith(
          _DishDbModel value, $Res Function(_DishDbModel) _then) =
      __$DishDbModelCopyWithImpl;
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
class __$DishDbModelCopyWithImpl<$Res> implements _$DishDbModelCopyWith<$Res> {
  __$DishDbModelCopyWithImpl(this._self, this._then);

  final _DishDbModel _self;
  final $Res Function(_DishDbModel) _then;

  /// Create a copy of DishDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_DishDbModel(
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
      mass_per_amount_unit: freezed == mass_per_amount_unit
          ? _self.mass_per_amount_unit
          : mass_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      mass_per_amount_value: freezed == mass_per_amount_value
          ? _self.mass_per_amount_value
          : mass_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      mass_total_amount_unit: freezed == mass_total_amount_unit
          ? _self.mass_total_amount_unit
          : mass_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      mass_total_amount_value: freezed == mass_total_amount_value
          ? _self.mass_total_amount_value
          : mass_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      volume_per_amount_unit: freezed == volume_per_amount_unit
          ? _self.volume_per_amount_unit
          : volume_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      volume_per_amount_value: freezed == volume_per_amount_value
          ? _self.volume_per_amount_value
          : volume_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      volume_total_amount_unit: freezed == volume_total_amount_unit
          ? _self.volume_total_amount_unit
          : volume_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      volume_total_amount_value: freezed == volume_total_amount_value
          ? _self.volume_total_amount_value
          : volume_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity_per_amount_unit: freezed == quantity_per_amount_unit
          ? _self.quantity_per_amount_unit
          : quantity_per_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity_per_amount_value: freezed == quantity_per_amount_value
          ? _self.quantity_per_amount_value
          : quantity_per_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity_total_amount_unit: freezed == quantity_total_amount_unit
          ? _self.quantity_total_amount_unit
          : quantity_total_amount_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity_total_amount_value: freezed == quantity_total_amount_value
          ? _self.quantity_total_amount_value
          : quantity_total_amount_value // ignore: cast_nullable_to_non_nullable
              as double?,
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
