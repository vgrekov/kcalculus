// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_save_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MealSaveViewModelArg {
  Meal? get meal => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealSaveViewModelArgCopyWith<MealSaveViewModelArg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealSaveViewModelArgCopyWith<$Res> {
  factory $MealSaveViewModelArgCopyWith(MealSaveViewModelArg value,
          $Res Function(MealSaveViewModelArg) then) =
      _$MealSaveViewModelArgCopyWithImpl<$Res, MealSaveViewModelArg>;
  @useResult
  $Res call({Meal? meal, DateTime? date});

  $MealCopyWith<$Res>? get meal;
}

/// @nodoc
class _$MealSaveViewModelArgCopyWithImpl<$Res,
        $Val extends MealSaveViewModelArg>
    implements $MealSaveViewModelArgCopyWith<$Res> {
  _$MealSaveViewModelArgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meal = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      meal: freezed == meal
          ? _value.meal
          : meal // ignore: cast_nullable_to_non_nullable
              as Meal?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealCopyWith<$Res>? get meal {
    if (_value.meal == null) {
      return null;
    }

    return $MealCopyWith<$Res>(_value.meal!, (value) {
      return _then(_value.copyWith(meal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealSaveViewModelArgImplCopyWith<$Res>
    implements $MealSaveViewModelArgCopyWith<$Res> {
  factory _$$MealSaveViewModelArgImplCopyWith(_$MealSaveViewModelArgImpl value,
          $Res Function(_$MealSaveViewModelArgImpl) then) =
      __$$MealSaveViewModelArgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meal? meal, DateTime? date});

  @override
  $MealCopyWith<$Res>? get meal;
}

/// @nodoc
class __$$MealSaveViewModelArgImplCopyWithImpl<$Res>
    extends _$MealSaveViewModelArgCopyWithImpl<$Res, _$MealSaveViewModelArgImpl>
    implements _$$MealSaveViewModelArgImplCopyWith<$Res> {
  __$$MealSaveViewModelArgImplCopyWithImpl(_$MealSaveViewModelArgImpl _value,
      $Res Function(_$MealSaveViewModelArgImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meal = freezed,
    Object? date = freezed,
  }) {
    return _then(_$MealSaveViewModelArgImpl(
      meal: freezed == meal
          ? _value.meal
          : meal // ignore: cast_nullable_to_non_nullable
              as Meal?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$MealSaveViewModelArgImpl implements _MealSaveViewModelArg {
  const _$MealSaveViewModelArgImpl({this.meal, this.date});

  @override
  final Meal? meal;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'MealSaveViewModelArg(meal: $meal, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealSaveViewModelArgImpl &&
            (identical(other.meal, meal) || other.meal == meal) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meal, date);

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealSaveViewModelArgImplCopyWith<_$MealSaveViewModelArgImpl>
      get copyWith =>
          __$$MealSaveViewModelArgImplCopyWithImpl<_$MealSaveViewModelArgImpl>(
              this, _$identity);
}

abstract class _MealSaveViewModelArg implements MealSaveViewModelArg {
  const factory _MealSaveViewModelArg(
      {final Meal? meal, final DateTime? date}) = _$MealSaveViewModelArgImpl;

  @override
  Meal? get meal;
  @override
  DateTime? get date;

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealSaveViewModelArgImplCopyWith<_$MealSaveViewModelArgImpl>
      get copyWith => throw _privateConstructorUsedError;
}
