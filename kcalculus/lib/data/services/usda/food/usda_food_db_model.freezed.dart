// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usda_food_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsdaFoodDbModel {
  int get fdc_id;
  String get name;
  String get description;
  String get data_type;
  int get priority;

  /// Create a copy of UsdaFoodDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsdaFoodDbModelCopyWith<UsdaFoodDbModel> get copyWith =>
      _$UsdaFoodDbModelCopyWithImpl<UsdaFoodDbModel>(
          this as UsdaFoodDbModel, _$identity);

  /// Serializes this UsdaFoodDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsdaFoodDbModel &&
            (identical(other.fdc_id, fdc_id) || other.fdc_id == fdc_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.data_type, data_type) ||
                other.data_type == data_type) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fdc_id, name, description, data_type, priority);

  @override
  String toString() {
    return 'UsdaFoodDbModel(fdc_id: $fdc_id, name: $name, description: $description, data_type: $data_type, priority: $priority)';
  }
}

/// @nodoc
abstract mixin class $UsdaFoodDbModelCopyWith<$Res> {
  factory $UsdaFoodDbModelCopyWith(
          UsdaFoodDbModel value, $Res Function(UsdaFoodDbModel) _then) =
      _$UsdaFoodDbModelCopyWithImpl;
  @useResult
  $Res call(
      {int fdc_id,
      String name,
      String description,
      String data_type,
      int priority});
}

/// @nodoc
class _$UsdaFoodDbModelCopyWithImpl<$Res>
    implements $UsdaFoodDbModelCopyWith<$Res> {
  _$UsdaFoodDbModelCopyWithImpl(this._self, this._then);

  final UsdaFoodDbModel _self;
  final $Res Function(UsdaFoodDbModel) _then;

  /// Create a copy of UsdaFoodDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fdc_id = null,
    Object? name = null,
    Object? description = null,
    Object? data_type = null,
    Object? priority = null,
  }) {
    return _then(_self.copyWith(
      fdc_id: null == fdc_id
          ? _self.fdc_id
          : fdc_id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      data_type: null == data_type
          ? _self.data_type
          : data_type // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UsdaFoodDbModel implements UsdaFoodDbModel {
  const _UsdaFoodDbModel(
      {required this.fdc_id,
      required this.name,
      this.description = '',
      required this.data_type,
      required this.priority});
  factory _UsdaFoodDbModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaFoodDbModelFromJson(json);

  @override
  final int fdc_id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  final String data_type;
  @override
  final int priority;

  /// Create a copy of UsdaFoodDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsdaFoodDbModelCopyWith<_UsdaFoodDbModel> get copyWith =>
      __$UsdaFoodDbModelCopyWithImpl<_UsdaFoodDbModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsdaFoodDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsdaFoodDbModel &&
            (identical(other.fdc_id, fdc_id) || other.fdc_id == fdc_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.data_type, data_type) ||
                other.data_type == data_type) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fdc_id, name, description, data_type, priority);

  @override
  String toString() {
    return 'UsdaFoodDbModel(fdc_id: $fdc_id, name: $name, description: $description, data_type: $data_type, priority: $priority)';
  }
}

/// @nodoc
abstract mixin class _$UsdaFoodDbModelCopyWith<$Res>
    implements $UsdaFoodDbModelCopyWith<$Res> {
  factory _$UsdaFoodDbModelCopyWith(
          _UsdaFoodDbModel value, $Res Function(_UsdaFoodDbModel) _then) =
      __$UsdaFoodDbModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int fdc_id,
      String name,
      String description,
      String data_type,
      int priority});
}

/// @nodoc
class __$UsdaFoodDbModelCopyWithImpl<$Res>
    implements _$UsdaFoodDbModelCopyWith<$Res> {
  __$UsdaFoodDbModelCopyWithImpl(this._self, this._then);

  final _UsdaFoodDbModel _self;
  final $Res Function(_UsdaFoodDbModel) _then;

  /// Create a copy of UsdaFoodDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fdc_id = null,
    Object? name = null,
    Object? description = null,
    Object? data_type = null,
    Object? priority = null,
  }) {
    return _then(_UsdaFoodDbModel(
      fdc_id: null == fdc_id
          ? _self.fdc_id
          : fdc_id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      data_type: null == data_type
          ? _self.data_type
          : data_type // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
