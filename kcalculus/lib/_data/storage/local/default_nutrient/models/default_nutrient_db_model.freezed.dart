// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'default_nutrient_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DefaultNutrientDbModel {
  String get name;
  int get position;

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DefaultNutrientDbModelCopyWith<DefaultNutrientDbModel> get copyWith =>
      _$DefaultNutrientDbModelCopyWithImpl<DefaultNutrientDbModel>(
          this as DefaultNutrientDbModel, _$identity);

  /// Serializes this DefaultNutrientDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DefaultNutrientDbModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, position);

  @override
  String toString() {
    return 'DefaultNutrientDbModel(name: $name, position: $position)';
  }
}

/// @nodoc
abstract mixin class $DefaultNutrientDbModelCopyWith<$Res> {
  factory $DefaultNutrientDbModelCopyWith(DefaultNutrientDbModel value,
          $Res Function(DefaultNutrientDbModel) _then) =
      _$DefaultNutrientDbModelCopyWithImpl;
  @useResult
  $Res call({String name, int position});
}

/// @nodoc
class _$DefaultNutrientDbModelCopyWithImpl<$Res>
    implements $DefaultNutrientDbModelCopyWith<$Res> {
  _$DefaultNutrientDbModelCopyWithImpl(this._self, this._then);

  final DefaultNutrientDbModel _self;
  final $Res Function(DefaultNutrientDbModel) _then;

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? position = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DefaultNutrientDbModel implements DefaultNutrientDbModel {
  const _DefaultNutrientDbModel({required this.name, required this.position});
  factory _DefaultNutrientDbModel.fromJson(Map<String, dynamic> json) =>
      _$DefaultNutrientDbModelFromJson(json);

  @override
  final String name;
  @override
  final int position;

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DefaultNutrientDbModelCopyWith<_DefaultNutrientDbModel> get copyWith =>
      __$DefaultNutrientDbModelCopyWithImpl<_DefaultNutrientDbModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DefaultNutrientDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DefaultNutrientDbModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, position);

  @override
  String toString() {
    return 'DefaultNutrientDbModel(name: $name, position: $position)';
  }
}

/// @nodoc
abstract mixin class _$DefaultNutrientDbModelCopyWith<$Res>
    implements $DefaultNutrientDbModelCopyWith<$Res> {
  factory _$DefaultNutrientDbModelCopyWith(_DefaultNutrientDbModel value,
          $Res Function(_DefaultNutrientDbModel) _then) =
      __$DefaultNutrientDbModelCopyWithImpl;
  @override
  @useResult
  $Res call({String name, int position});
}

/// @nodoc
class __$DefaultNutrientDbModelCopyWithImpl<$Res>
    implements _$DefaultNutrientDbModelCopyWith<$Res> {
  __$DefaultNutrientDbModelCopyWithImpl(this._self, this._then);

  final _DefaultNutrientDbModel _self;
  final $Res Function(_DefaultNutrientDbModel) _then;

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? position = null,
  }) {
    return _then(_DefaultNutrientDbModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
