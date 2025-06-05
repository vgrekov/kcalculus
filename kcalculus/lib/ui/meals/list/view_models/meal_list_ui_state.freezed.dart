// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_list_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MealListUiState {
  DateTime get date => throw _privateConstructorUsedError;
  Future<List<Meal>> get dataLoader => throw _privateConstructorUsedError;
  List<Meal> get data => throw _privateConstructorUsedError;
  bool get showCalendar => throw _privateConstructorUsedError;
  Amount? get energyGoalAmount => throw _privateConstructorUsedError;

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealListUiStateCopyWith<MealListUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealListUiStateCopyWith<$Res> {
  factory $MealListUiStateCopyWith(
          MealListUiState value, $Res Function(MealListUiState) then) =
      _$MealListUiStateCopyWithImpl<$Res, MealListUiState>;
  @useResult
  $Res call(
      {DateTime date,
      Future<List<Meal>> dataLoader,
      List<Meal> data,
      bool showCalendar,
      Amount? energyGoalAmount});

  $AmountCopyWith<$Res>? get energyGoalAmount;
}

/// @nodoc
class _$MealListUiStateCopyWithImpl<$Res, $Val extends MealListUiState>
    implements $MealListUiStateCopyWith<$Res> {
  _$MealListUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dataLoader = null,
    Object? data = null,
    Object? showCalendar = null,
    Object? energyGoalAmount = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataLoader: null == dataLoader
          ? _value.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<Meal>>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      showCalendar: null == showCalendar
          ? _value.showCalendar
          : showCalendar // ignore: cast_nullable_to_non_nullable
              as bool,
      energyGoalAmount: freezed == energyGoalAmount
          ? _value.energyGoalAmount
          : energyGoalAmount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ) as $Val);
  }

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get energyGoalAmount {
    if (_value.energyGoalAmount == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_value.energyGoalAmount!, (value) {
      return _then(_value.copyWith(energyGoalAmount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealListUiStateImplCopyWith<$Res>
    implements $MealListUiStateCopyWith<$Res> {
  factory _$$MealListUiStateImplCopyWith(_$MealListUiStateImpl value,
          $Res Function(_$MealListUiStateImpl) then) =
      __$$MealListUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      Future<List<Meal>> dataLoader,
      List<Meal> data,
      bool showCalendar,
      Amount? energyGoalAmount});

  @override
  $AmountCopyWith<$Res>? get energyGoalAmount;
}

/// @nodoc
class __$$MealListUiStateImplCopyWithImpl<$Res>
    extends _$MealListUiStateCopyWithImpl<$Res, _$MealListUiStateImpl>
    implements _$$MealListUiStateImplCopyWith<$Res> {
  __$$MealListUiStateImplCopyWithImpl(
      _$MealListUiStateImpl _value, $Res Function(_$MealListUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dataLoader = null,
    Object? data = null,
    Object? showCalendar = null,
    Object? energyGoalAmount = freezed,
  }) {
    return _then(_$MealListUiStateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataLoader: null == dataLoader
          ? _value.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<Meal>>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      showCalendar: null == showCalendar
          ? _value.showCalendar
          : showCalendar // ignore: cast_nullable_to_non_nullable
              as bool,
      energyGoalAmount: freezed == energyGoalAmount
          ? _value.energyGoalAmount
          : energyGoalAmount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }
}

/// @nodoc

class _$MealListUiStateImpl implements _MealListUiState {
  const _$MealListUiStateImpl(
      {required this.date,
      required this.dataLoader,
      final List<Meal> data = const [],
      required this.showCalendar,
      this.energyGoalAmount})
      : _data = data;

  @override
  final DateTime date;
  @override
  final Future<List<Meal>> dataLoader;
  final List<Meal> _data;
  @override
  @JsonKey()
  List<Meal> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final bool showCalendar;
  @override
  final Amount? energyGoalAmount;

  @override
  String toString() {
    return 'MealListUiState(date: $date, dataLoader: $dataLoader, data: $data, showCalendar: $showCalendar, energyGoalAmount: $energyGoalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealListUiStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dataLoader, dataLoader) ||
                other.dataLoader == dataLoader) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.showCalendar, showCalendar) ||
                other.showCalendar == showCalendar) &&
            (identical(other.energyGoalAmount, energyGoalAmount) ||
                other.energyGoalAmount == energyGoalAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      dataLoader,
      const DeepCollectionEquality().hash(_data),
      showCalendar,
      energyGoalAmount);

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealListUiStateImplCopyWith<_$MealListUiStateImpl> get copyWith =>
      __$$MealListUiStateImplCopyWithImpl<_$MealListUiStateImpl>(
          this, _$identity);
}

abstract class _MealListUiState implements MealListUiState {
  const factory _MealListUiState(
      {required final DateTime date,
      required final Future<List<Meal>> dataLoader,
      final List<Meal> data,
      required final bool showCalendar,
      final Amount? energyGoalAmount}) = _$MealListUiStateImpl;

  @override
  DateTime get date;
  @override
  Future<List<Meal>> get dataLoader;
  @override
  List<Meal> get data;
  @override
  bool get showCalendar;
  @override
  Amount? get energyGoalAmount;

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealListUiStateImplCopyWith<_$MealListUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
