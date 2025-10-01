// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_goal_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientGoalFirestoreModel {
  @JsonKey(includeToJson: false)
  String? get id;
  String get nutrient;
  String get unit;
  double get value;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get createdAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get deletedAt;

  /// Create a copy of NutrientGoalFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutrientGoalFirestoreModelCopyWith<NutrientGoalFirestoreModel>
      get copyWith =>
          _$NutrientGoalFirestoreModelCopyWithImpl<NutrientGoalFirestoreModel>(
              this as NutrientGoalFirestoreModel, _$identity);

  /// Serializes this NutrientGoalFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutrientGoalFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nutrient, unit, value, createdAt, deletedAt);

  @override
  String toString() {
    return 'NutrientGoalFirestoreModel(id: $id, nutrient: $nutrient, unit: $unit, value: $value, createdAt: $createdAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $NutrientGoalFirestoreModelCopyWith<$Res> {
  factory $NutrientGoalFirestoreModelCopyWith(NutrientGoalFirestoreModel value,
          $Res Function(NutrientGoalFirestoreModel) _then) =
      _$NutrientGoalFirestoreModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      String nutrient,
      String unit,
      double value,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? deletedAt});
}

/// @nodoc
class _$NutrientGoalFirestoreModelCopyWithImpl<$Res>
    implements $NutrientGoalFirestoreModelCopyWith<$Res> {
  _$NutrientGoalFirestoreModelCopyWithImpl(this._self, this._then);

  final NutrientGoalFirestoreModel _self;
  final $Res Function(NutrientGoalFirestoreModel) _then;

  /// Create a copy of NutrientGoalFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nutrient = null,
    Object? unit = null,
    Object? value = null,
    Object? createdAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NutrientGoalFirestoreModel extends NutrientGoalFirestoreModel {
  const _NutrientGoalFirestoreModel(
      {@JsonKey(includeToJson: false) this.id,
      required this.nutrient,
      required this.unit,
      required this.value,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.deletedAt})
      : super._();
  factory _NutrientGoalFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$NutrientGoalFirestoreModelFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  final String nutrient;
  @override
  final String unit;
  @override
  final double value;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? createdAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? deletedAt;

  /// Create a copy of NutrientGoalFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutrientGoalFirestoreModelCopyWith<_NutrientGoalFirestoreModel>
      get copyWith => __$NutrientGoalFirestoreModelCopyWithImpl<
          _NutrientGoalFirestoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutrientGoalFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutrientGoalFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nutrient, unit, value, createdAt, deletedAt);

  @override
  String toString() {
    return 'NutrientGoalFirestoreModel(id: $id, nutrient: $nutrient, unit: $unit, value: $value, createdAt: $createdAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$NutrientGoalFirestoreModelCopyWith<$Res>
    implements $NutrientGoalFirestoreModelCopyWith<$Res> {
  factory _$NutrientGoalFirestoreModelCopyWith(
          _NutrientGoalFirestoreModel value,
          $Res Function(_NutrientGoalFirestoreModel) _then) =
      __$NutrientGoalFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      String nutrient,
      String unit,
      double value,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? deletedAt});
}

/// @nodoc
class __$NutrientGoalFirestoreModelCopyWithImpl<$Res>
    implements _$NutrientGoalFirestoreModelCopyWith<$Res> {
  __$NutrientGoalFirestoreModelCopyWithImpl(this._self, this._then);

  final _NutrientGoalFirestoreModel _self;
  final $Res Function(_NutrientGoalFirestoreModel) _then;

  /// Create a copy of NutrientGoalFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? nutrient = null,
    Object? unit = null,
    Object? value = null,
    Object? createdAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_NutrientGoalFirestoreModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
