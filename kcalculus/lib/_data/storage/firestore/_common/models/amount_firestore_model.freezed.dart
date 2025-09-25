// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amount_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AmountFirestoreModel {
  String get unit;
  double get value;

  /// Create a copy of AmountFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AmountFirestoreModelCopyWith<AmountFirestoreModel> get copyWith =>
      _$AmountFirestoreModelCopyWithImpl<AmountFirestoreModel>(
          this as AmountFirestoreModel, _$identity);

  /// Serializes this AmountFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AmountFirestoreModel &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, value);

  @override
  String toString() {
    return 'AmountFirestoreModel(unit: $unit, value: $value)';
  }
}

/// @nodoc
abstract mixin class $AmountFirestoreModelCopyWith<$Res> {
  factory $AmountFirestoreModelCopyWith(AmountFirestoreModel value,
          $Res Function(AmountFirestoreModel) _then) =
      _$AmountFirestoreModelCopyWithImpl;
  @useResult
  $Res call({String unit, double value});
}

/// @nodoc
class _$AmountFirestoreModelCopyWithImpl<$Res>
    implements $AmountFirestoreModelCopyWith<$Res> {
  _$AmountFirestoreModelCopyWithImpl(this._self, this._then);

  final AmountFirestoreModel _self;
  final $Res Function(AmountFirestoreModel) _then;

  /// Create a copy of AmountFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AmountFirestoreModel extends AmountFirestoreModel {
  const _AmountFirestoreModel({required this.unit, required this.value})
      : super._();
  factory _AmountFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$AmountFirestoreModelFromJson(json);

  @override
  final String unit;
  @override
  final double value;

  /// Create a copy of AmountFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AmountFirestoreModelCopyWith<_AmountFirestoreModel> get copyWith =>
      __$AmountFirestoreModelCopyWithImpl<_AmountFirestoreModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AmountFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AmountFirestoreModel &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, value);

  @override
  String toString() {
    return 'AmountFirestoreModel(unit: $unit, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$AmountFirestoreModelCopyWith<$Res>
    implements $AmountFirestoreModelCopyWith<$Res> {
  factory _$AmountFirestoreModelCopyWith(_AmountFirestoreModel value,
          $Res Function(_AmountFirestoreModel) _then) =
      __$AmountFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call({String unit, double value});
}

/// @nodoc
class __$AmountFirestoreModelCopyWithImpl<$Res>
    implements _$AmountFirestoreModelCopyWith<$Res> {
  __$AmountFirestoreModelCopyWithImpl(this._self, this._then);

  final _AmountFirestoreModel _self;
  final $Res Function(_AmountFirestoreModel) _then;

  /// Create a copy of AmountFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_AmountFirestoreModel(
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
