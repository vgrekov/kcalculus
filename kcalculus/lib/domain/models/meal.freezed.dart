// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Meal {
  String? get id => throw _privateConstructorUsedError;
  Edible get edible => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  DateTime get eatenAt => throw _privateConstructorUsedError;

  /// Serializes this Meal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealCopyWith<Meal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealCopyWith<$Res> {
  factory $MealCopyWith(Meal value, $Res Function(Meal) then) =
      _$MealCopyWithImpl<$Res, Meal>;
  @useResult
  $Res call({String? id, Edible edible, Amount amount, DateTime eatenAt});

  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class _$MealCopyWithImpl<$Res, $Val extends Meal>
    implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? edible = null,
    Object? amount = null,
    Object? eatenAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      edible: null == edible
          ? _value.edible
          : edible // ignore: cast_nullable_to_non_nullable
              as Edible,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      eatenAt: null == eatenAt
          ? _value.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealImplCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$$MealImplCopyWith(
          _$MealImpl value, $Res Function(_$MealImpl) then) =
      __$$MealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, Edible edible, Amount amount, DateTime eatenAt});

  @override
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class __$$MealImplCopyWithImpl<$Res>
    extends _$MealCopyWithImpl<$Res, _$MealImpl>
    implements _$$MealImplCopyWith<$Res> {
  __$$MealImplCopyWithImpl(_$MealImpl _value, $Res Function(_$MealImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? edible = null,
    Object? amount = null,
    Object? eatenAt = null,
  }) {
    return _then(_$MealImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      edible: null == edible
          ? _value.edible
          : edible // ignore: cast_nullable_to_non_nullable
              as Edible,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      eatenAt: null == eatenAt
          ? _value.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$MealImpl with Portion implements _Meal {
  const _$MealImpl(
      {this.id,
      required this.edible,
      required this.amount,
      required this.eatenAt});

  @override
  final String? id;
  @override
  final Edible edible;
  @override
  final Amount amount;
  @override
  final DateTime eatenAt;

  @override
  String toString() {
    return 'Meal(id: $id, edible: $edible, amount: $amount, eatenAt: $eatenAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.edible, edible) || other.edible == edible) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, edible, amount, eatenAt);

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealImplCopyWith<_$MealImpl> get copyWith =>
      __$$MealImplCopyWithImpl<_$MealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealImplToJson(
      this,
    );
  }
}

abstract class _Meal implements Meal, Portion {
  const factory _Meal(
      {final String? id,
      required final Edible edible,
      required final Amount amount,
      required final DateTime eatenAt}) = _$MealImpl;

  @override
  String? get id;
  @override
  Edible get edible;
  @override
  Amount get amount;
  @override
  DateTime get eatenAt;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealImplCopyWith<_$MealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
