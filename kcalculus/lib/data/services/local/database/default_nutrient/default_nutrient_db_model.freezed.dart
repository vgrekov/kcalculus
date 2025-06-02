// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'default_nutrient_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DefaultNutrientDbModel _$DefaultNutrientDbModelFromJson(
    Map<String, dynamic> json) {
  return _DefaultNutrientDbModel.fromJson(json);
}

/// @nodoc
mixin _$DefaultNutrientDbModel {
  String get name => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  /// Serializes this DefaultNutrientDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefaultNutrientDbModelCopyWith<DefaultNutrientDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultNutrientDbModelCopyWith<$Res> {
  factory $DefaultNutrientDbModelCopyWith(DefaultNutrientDbModel value,
          $Res Function(DefaultNutrientDbModel) then) =
      _$DefaultNutrientDbModelCopyWithImpl<$Res, DefaultNutrientDbModel>;
  @useResult
  $Res call({String name, int position});
}

/// @nodoc
class _$DefaultNutrientDbModelCopyWithImpl<$Res,
        $Val extends DefaultNutrientDbModel>
    implements $DefaultNutrientDbModelCopyWith<$Res> {
  _$DefaultNutrientDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultNutrientDbModelImplCopyWith<$Res>
    implements $DefaultNutrientDbModelCopyWith<$Res> {
  factory _$$DefaultNutrientDbModelImplCopyWith(
          _$DefaultNutrientDbModelImpl value,
          $Res Function(_$DefaultNutrientDbModelImpl) then) =
      __$$DefaultNutrientDbModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int position});
}

/// @nodoc
class __$$DefaultNutrientDbModelImplCopyWithImpl<$Res>
    extends _$DefaultNutrientDbModelCopyWithImpl<$Res,
        _$DefaultNutrientDbModelImpl>
    implements _$$DefaultNutrientDbModelImplCopyWith<$Res> {
  __$$DefaultNutrientDbModelImplCopyWithImpl(
      _$DefaultNutrientDbModelImpl _value,
      $Res Function(_$DefaultNutrientDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? position = null,
  }) {
    return _then(_$DefaultNutrientDbModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultNutrientDbModelImpl implements _DefaultNutrientDbModel {
  const _$DefaultNutrientDbModelImpl(
      {required this.name, required this.position});

  factory _$DefaultNutrientDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultNutrientDbModelImplFromJson(json);

  @override
  final String name;
  @override
  final int position;

  @override
  String toString() {
    return 'DefaultNutrientDbModel(name: $name, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultNutrientDbModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, position);

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultNutrientDbModelImplCopyWith<_$DefaultNutrientDbModelImpl>
      get copyWith => __$$DefaultNutrientDbModelImplCopyWithImpl<
          _$DefaultNutrientDbModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultNutrientDbModelImplToJson(
      this,
    );
  }
}

abstract class _DefaultNutrientDbModel implements DefaultNutrientDbModel {
  const factory _DefaultNutrientDbModel(
      {required final String name,
      required final int position}) = _$DefaultNutrientDbModelImpl;

  factory _DefaultNutrientDbModel.fromJson(Map<String, dynamic> json) =
      _$DefaultNutrientDbModelImpl.fromJson;

  @override
  String get name;
  @override
  int get position;

  /// Create a copy of DefaultNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultNutrientDbModelImplCopyWith<_$DefaultNutrientDbModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
