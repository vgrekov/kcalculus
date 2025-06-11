// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_save_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealSaveViewModelArg {
  Meal? get meal;
  DateTime? get date;

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealSaveViewModelArgCopyWith<MealSaveViewModelArg> get copyWith =>
      _$MealSaveViewModelArgCopyWithImpl<MealSaveViewModelArg>(
          this as MealSaveViewModelArg, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealSaveViewModelArg &&
            (identical(other.meal, meal) || other.meal == meal) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meal, date);

  @override
  String toString() {
    return 'MealSaveViewModelArg(meal: $meal, date: $date)';
  }
}

/// @nodoc
abstract mixin class $MealSaveViewModelArgCopyWith<$Res> {
  factory $MealSaveViewModelArgCopyWith(MealSaveViewModelArg value,
          $Res Function(MealSaveViewModelArg) _then) =
      _$MealSaveViewModelArgCopyWithImpl;
  @useResult
  $Res call({Meal? meal, DateTime? date});

  $MealCopyWith<$Res>? get meal;
}

/// @nodoc
class _$MealSaveViewModelArgCopyWithImpl<$Res>
    implements $MealSaveViewModelArgCopyWith<$Res> {
  _$MealSaveViewModelArgCopyWithImpl(this._self, this._then);

  final MealSaveViewModelArg _self;
  final $Res Function(MealSaveViewModelArg) _then;

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meal = freezed,
    Object? date = freezed,
  }) {
    return _then(_self.copyWith(
      meal: freezed == meal
          ? _self.meal
          : meal // ignore: cast_nullable_to_non_nullable
              as Meal?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealCopyWith<$Res>? get meal {
    if (_self.meal == null) {
      return null;
    }

    return $MealCopyWith<$Res>(_self.meal!, (value) {
      return _then(_self.copyWith(meal: value));
    });
  }
}

/// @nodoc

class _MealSaveViewModelArg implements MealSaveViewModelArg {
  const _MealSaveViewModelArg({this.meal, this.date});

  @override
  final Meal? meal;
  @override
  final DateTime? date;

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealSaveViewModelArgCopyWith<_MealSaveViewModelArg> get copyWith =>
      __$MealSaveViewModelArgCopyWithImpl<_MealSaveViewModelArg>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MealSaveViewModelArg &&
            (identical(other.meal, meal) || other.meal == meal) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meal, date);

  @override
  String toString() {
    return 'MealSaveViewModelArg(meal: $meal, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$MealSaveViewModelArgCopyWith<$Res>
    implements $MealSaveViewModelArgCopyWith<$Res> {
  factory _$MealSaveViewModelArgCopyWith(_MealSaveViewModelArg value,
          $Res Function(_MealSaveViewModelArg) _then) =
      __$MealSaveViewModelArgCopyWithImpl;
  @override
  @useResult
  $Res call({Meal? meal, DateTime? date});

  @override
  $MealCopyWith<$Res>? get meal;
}

/// @nodoc
class __$MealSaveViewModelArgCopyWithImpl<$Res>
    implements _$MealSaveViewModelArgCopyWith<$Res> {
  __$MealSaveViewModelArgCopyWithImpl(this._self, this._then);

  final _MealSaveViewModelArg _self;
  final $Res Function(_MealSaveViewModelArg) _then;

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? meal = freezed,
    Object? date = freezed,
  }) {
    return _then(_MealSaveViewModelArg(
      meal: freezed == meal
          ? _self.meal
          : meal // ignore: cast_nullable_to_non_nullable
              as Meal?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of MealSaveViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealCopyWith<$Res>? get meal {
    if (_self.meal == null) {
      return null;
    }

    return $MealCopyWith<$Res>(_self.meal!, (value) {
      return _then(_self.copyWith(meal: value));
    });
  }
}

// dart format on
