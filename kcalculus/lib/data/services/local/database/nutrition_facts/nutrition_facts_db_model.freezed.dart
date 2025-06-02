// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutritionFactsDbModel _$NutritionFactsDbModelFromJson(
    Map<String, dynamic> json) {
  return _NutritionFactsDbModel.fromJson(json);
}

/// @nodoc
mixin _$NutritionFactsDbModel {
  String get id => throw _privateConstructorUsedError;
  String get edible_id => throw _privateConstructorUsedError;
  String get amount_unit => throw _privateConstructorUsedError;
  double get amount_value => throw _privateConstructorUsedError;

  /// Serializes this NutritionFactsDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionFactsDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsDbModelCopyWith<NutritionFactsDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsDbModelCopyWith<$Res> {
  factory $NutritionFactsDbModelCopyWith(NutritionFactsDbModel value,
          $Res Function(NutritionFactsDbModel) then) =
      _$NutritionFactsDbModelCopyWithImpl<$Res, NutritionFactsDbModel>;
  @useResult
  $Res call(
      {String id, String edible_id, String amount_unit, double amount_value});
}

/// @nodoc
class _$NutritionFactsDbModelCopyWithImpl<$Res,
        $Val extends NutritionFactsDbModel>
    implements $NutritionFactsDbModelCopyWith<$Res> {
  _$NutritionFactsDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFactsDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? edible_id = null,
    Object? amount_unit = null,
    Object? amount_value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_id: null == edible_id
          ? _value.edible_id
          : edible_id // ignore: cast_nullable_to_non_nullable
              as String,
      amount_unit: null == amount_unit
          ? _value.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _value.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionFactsDbModelImplCopyWith<$Res>
    implements $NutritionFactsDbModelCopyWith<$Res> {
  factory _$$NutritionFactsDbModelImplCopyWith(
          _$NutritionFactsDbModelImpl value,
          $Res Function(_$NutritionFactsDbModelImpl) then) =
      __$$NutritionFactsDbModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String edible_id, String amount_unit, double amount_value});
}

/// @nodoc
class __$$NutritionFactsDbModelImplCopyWithImpl<$Res>
    extends _$NutritionFactsDbModelCopyWithImpl<$Res,
        _$NutritionFactsDbModelImpl>
    implements _$$NutritionFactsDbModelImplCopyWith<$Res> {
  __$$NutritionFactsDbModelImplCopyWithImpl(_$NutritionFactsDbModelImpl _value,
      $Res Function(_$NutritionFactsDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFactsDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? edible_id = null,
    Object? amount_unit = null,
    Object? amount_value = null,
  }) {
    return _then(_$NutritionFactsDbModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_id: null == edible_id
          ? _value.edible_id
          : edible_id // ignore: cast_nullable_to_non_nullable
              as String,
      amount_unit: null == amount_unit
          ? _value.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _value.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionFactsDbModelImpl implements _NutritionFactsDbModel {
  _$NutritionFactsDbModelImpl(
      {required this.id,
      required this.edible_id,
      required this.amount_unit,
      required this.amount_value});

  factory _$NutritionFactsDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionFactsDbModelImplFromJson(json);

  @override
  final String id;
  @override
  final String edible_id;
  @override
  final String amount_unit;
  @override
  final double amount_value;

  @override
  String toString() {
    return 'NutritionFactsDbModel(id: $id, edible_id: $edible_id, amount_unit: $amount_unit, amount_value: $amount_value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsDbModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.edible_id, edible_id) ||
                other.edible_id == edible_id) &&
            (identical(other.amount_unit, amount_unit) ||
                other.amount_unit == amount_unit) &&
            (identical(other.amount_value, amount_value) ||
                other.amount_value == amount_value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, edible_id, amount_unit, amount_value);

  /// Create a copy of NutritionFactsDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsDbModelImplCopyWith<_$NutritionFactsDbModelImpl>
      get copyWith => __$$NutritionFactsDbModelImplCopyWithImpl<
          _$NutritionFactsDbModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionFactsDbModelImplToJson(
      this,
    );
  }
}

abstract class _NutritionFactsDbModel implements NutritionFactsDbModel {
  factory _NutritionFactsDbModel(
      {required final String id,
      required final String edible_id,
      required final String amount_unit,
      required final double amount_value}) = _$NutritionFactsDbModelImpl;

  factory _NutritionFactsDbModel.fromJson(Map<String, dynamic> json) =
      _$NutritionFactsDbModelImpl.fromJson;

  @override
  String get id;
  @override
  String get edible_id;
  @override
  String get amount_unit;
  @override
  double get amount_value;

  /// Create a copy of NutritionFactsDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsDbModelImplCopyWith<_$NutritionFactsDbModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
