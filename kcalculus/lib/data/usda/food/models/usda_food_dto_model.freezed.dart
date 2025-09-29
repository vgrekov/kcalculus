// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usda_food_dto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsdaFoodDtoModel {
  int get fdcId;
  String get description;
  String get dataType;
  int get priority;
  List<UsdaPortionDtoModel>? get portions;
  List<UsdaNutrientDtoModel> get nutrients;

  /// Create a copy of UsdaFoodDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsdaFoodDtoModelCopyWith<UsdaFoodDtoModel> get copyWith =>
      _$UsdaFoodDtoModelCopyWithImpl<UsdaFoodDtoModel>(
          this as UsdaFoodDtoModel, _$identity);

  /// Serializes this UsdaFoodDtoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsdaFoodDtoModel &&
            (identical(other.fdcId, fdcId) || other.fdcId == fdcId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other.portions, portions) &&
            const DeepCollectionEquality().equals(other.nutrients, nutrients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fdcId,
      description,
      dataType,
      priority,
      const DeepCollectionEquality().hash(portions),
      const DeepCollectionEquality().hash(nutrients));

  @override
  String toString() {
    return 'UsdaFoodDtoModel(fdcId: $fdcId, description: $description, dataType: $dataType, priority: $priority, portions: $portions, nutrients: $nutrients)';
  }
}

/// @nodoc
abstract mixin class $UsdaFoodDtoModelCopyWith<$Res> {
  factory $UsdaFoodDtoModelCopyWith(
          UsdaFoodDtoModel value, $Res Function(UsdaFoodDtoModel) _then) =
      _$UsdaFoodDtoModelCopyWithImpl;
  @useResult
  $Res call(
      {int fdcId,
      String description,
      String dataType,
      int priority,
      List<UsdaPortionDtoModel>? portions,
      List<UsdaNutrientDtoModel> nutrients});
}

/// @nodoc
class _$UsdaFoodDtoModelCopyWithImpl<$Res>
    implements $UsdaFoodDtoModelCopyWith<$Res> {
  _$UsdaFoodDtoModelCopyWithImpl(this._self, this._then);

  final UsdaFoodDtoModel _self;
  final $Res Function(UsdaFoodDtoModel) _then;

  /// Create a copy of UsdaFoodDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fdcId = null,
    Object? description = null,
    Object? dataType = null,
    Object? priority = null,
    Object? portions = freezed,
    Object? nutrients = null,
  }) {
    return _then(_self.copyWith(
      fdcId: null == fdcId
          ? _self.fdcId
          : fdcId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _self.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      portions: freezed == portions
          ? _self.portions
          : portions // ignore: cast_nullable_to_non_nullable
              as List<UsdaPortionDtoModel>?,
      nutrients: null == nutrients
          ? _self.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as List<UsdaNutrientDtoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UsdaFoodDtoModel implements UsdaFoodDtoModel {
  const _UsdaFoodDtoModel(
      {required this.fdcId,
      required this.description,
      required this.dataType,
      required this.priority,
      final List<UsdaPortionDtoModel>? portions,
      required final List<UsdaNutrientDtoModel> nutrients})
      : _portions = portions,
        _nutrients = nutrients;
  factory _UsdaFoodDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaFoodDtoModelFromJson(json);

  @override
  final int fdcId;
  @override
  final String description;
  @override
  final String dataType;
  @override
  final int priority;
  final List<UsdaPortionDtoModel>? _portions;
  @override
  List<UsdaPortionDtoModel>? get portions {
    final value = _portions;
    if (value == null) return null;
    if (_portions is EqualUnmodifiableListView) return _portions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UsdaNutrientDtoModel> _nutrients;
  @override
  List<UsdaNutrientDtoModel> get nutrients {
    if (_nutrients is EqualUnmodifiableListView) return _nutrients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrients);
  }

  /// Create a copy of UsdaFoodDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsdaFoodDtoModelCopyWith<_UsdaFoodDtoModel> get copyWith =>
      __$UsdaFoodDtoModelCopyWithImpl<_UsdaFoodDtoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsdaFoodDtoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsdaFoodDtoModel &&
            (identical(other.fdcId, fdcId) || other.fdcId == fdcId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._portions, _portions) &&
            const DeepCollectionEquality()
                .equals(other._nutrients, _nutrients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fdcId,
      description,
      dataType,
      priority,
      const DeepCollectionEquality().hash(_portions),
      const DeepCollectionEquality().hash(_nutrients));

  @override
  String toString() {
    return 'UsdaFoodDtoModel(fdcId: $fdcId, description: $description, dataType: $dataType, priority: $priority, portions: $portions, nutrients: $nutrients)';
  }
}

/// @nodoc
abstract mixin class _$UsdaFoodDtoModelCopyWith<$Res>
    implements $UsdaFoodDtoModelCopyWith<$Res> {
  factory _$UsdaFoodDtoModelCopyWith(
          _UsdaFoodDtoModel value, $Res Function(_UsdaFoodDtoModel) _then) =
      __$UsdaFoodDtoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int fdcId,
      String description,
      String dataType,
      int priority,
      List<UsdaPortionDtoModel>? portions,
      List<UsdaNutrientDtoModel> nutrients});
}

/// @nodoc
class __$UsdaFoodDtoModelCopyWithImpl<$Res>
    implements _$UsdaFoodDtoModelCopyWith<$Res> {
  __$UsdaFoodDtoModelCopyWithImpl(this._self, this._then);

  final _UsdaFoodDtoModel _self;
  final $Res Function(_UsdaFoodDtoModel) _then;

  /// Create a copy of UsdaFoodDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fdcId = null,
    Object? description = null,
    Object? dataType = null,
    Object? priority = null,
    Object? portions = freezed,
    Object? nutrients = null,
  }) {
    return _then(_UsdaFoodDtoModel(
      fdcId: null == fdcId
          ? _self.fdcId
          : fdcId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _self.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      portions: freezed == portions
          ? _self._portions
          : portions // ignore: cast_nullable_to_non_nullable
              as List<UsdaPortionDtoModel>?,
      nutrients: null == nutrients
          ? _self._nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as List<UsdaNutrientDtoModel>,
    ));
  }
}

// dart format on
