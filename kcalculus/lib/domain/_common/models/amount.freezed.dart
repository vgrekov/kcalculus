// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Amount {
  Unit get unit;
  double get value;

  /// Create a copy of Amount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AmountCopyWith<Amount> get copyWith =>
      _$AmountCopyWithImpl<Amount>(this as Amount, _$identity);

  /// Serializes this Amount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Amount &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, value);

  @override
  String toString() {
    return 'Amount(unit: $unit, value: $value)';
  }
}

/// @nodoc
abstract mixin class $AmountCopyWith<$Res> {
  factory $AmountCopyWith(Amount value, $Res Function(Amount) _then) =
      _$AmountCopyWithImpl;
  @useResult
  $Res call({Unit unit, double value});
}

/// @nodoc
class _$AmountCopyWithImpl<$Res> implements $AmountCopyWith<$Res> {
  _$AmountCopyWithImpl(this._self, this._then);

  final Amount _self;
  final $Res Function(Amount) _then;

  /// Create a copy of Amount
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
              as Unit,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Amount extends Amount {
  const _Amount({required this.unit, required this.value}) : super._();
  factory _Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  @override
  final Unit unit;
  @override
  final double value;

  /// Create a copy of Amount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AmountCopyWith<_Amount> get copyWith =>
      __$AmountCopyWithImpl<_Amount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AmountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Amount &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, value);

  @override
  String toString() {
    return 'Amount._default(unit: $unit, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$AmountCopyWith<$Res> implements $AmountCopyWith<$Res> {
  factory _$AmountCopyWith(_Amount value, $Res Function(_Amount) _then) =
      __$AmountCopyWithImpl;
  @override
  @useResult
  $Res call({Unit unit, double value});
}

/// @nodoc
class __$AmountCopyWithImpl<$Res> implements _$AmountCopyWith<$Res> {
  __$AmountCopyWithImpl(this._self, this._then);

  final _Amount _self;
  final $Res Function(_Amount) _then;

  /// Create a copy of Amount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_Amount(
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
