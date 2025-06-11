// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_list_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealListUiState {
  DateTime get date;
  Future<List<Meal>> get dataLoader;
  List<Meal> get data;
  bool get showCalendar;
  Amount? get energyGoalAmount;

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealListUiStateCopyWith<MealListUiState> get copyWith =>
      _$MealListUiStateCopyWithImpl<MealListUiState>(
          this as MealListUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealListUiState &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dataLoader, dataLoader) ||
                other.dataLoader == dataLoader) &&
            const DeepCollectionEquality().equals(other.data, data) &&
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
      const DeepCollectionEquality().hash(data),
      showCalendar,
      energyGoalAmount);

  @override
  String toString() {
    return 'MealListUiState(date: $date, dataLoader: $dataLoader, data: $data, showCalendar: $showCalendar, energyGoalAmount: $energyGoalAmount)';
  }
}

/// @nodoc
abstract mixin class $MealListUiStateCopyWith<$Res> {
  factory $MealListUiStateCopyWith(
          MealListUiState value, $Res Function(MealListUiState) _then) =
      _$MealListUiStateCopyWithImpl;
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
class _$MealListUiStateCopyWithImpl<$Res>
    implements $MealListUiStateCopyWith<$Res> {
  _$MealListUiStateCopyWithImpl(this._self, this._then);

  final MealListUiState _self;
  final $Res Function(MealListUiState) _then;

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
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataLoader: null == dataLoader
          ? _self.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<Meal>>,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      showCalendar: null == showCalendar
          ? _self.showCalendar
          : showCalendar // ignore: cast_nullable_to_non_nullable
              as bool,
      energyGoalAmount: freezed == energyGoalAmount
          ? _self.energyGoalAmount
          : energyGoalAmount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get energyGoalAmount {
    if (_self.energyGoalAmount == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.energyGoalAmount!, (value) {
      return _then(_self.copyWith(energyGoalAmount: value));
    });
  }
}

/// @nodoc

class _MealListUiState implements MealListUiState {
  const _MealListUiState(
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

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealListUiStateCopyWith<_MealListUiState> get copyWith =>
      __$MealListUiStateCopyWithImpl<_MealListUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MealListUiState &&
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

  @override
  String toString() {
    return 'MealListUiState(date: $date, dataLoader: $dataLoader, data: $data, showCalendar: $showCalendar, energyGoalAmount: $energyGoalAmount)';
  }
}

/// @nodoc
abstract mixin class _$MealListUiStateCopyWith<$Res>
    implements $MealListUiStateCopyWith<$Res> {
  factory _$MealListUiStateCopyWith(
          _MealListUiState value, $Res Function(_MealListUiState) _then) =
      __$MealListUiStateCopyWithImpl;
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
class __$MealListUiStateCopyWithImpl<$Res>
    implements _$MealListUiStateCopyWith<$Res> {
  __$MealListUiStateCopyWithImpl(this._self, this._then);

  final _MealListUiState _self;
  final $Res Function(_MealListUiState) _then;

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? dataLoader = null,
    Object? data = null,
    Object? showCalendar = null,
    Object? energyGoalAmount = freezed,
  }) {
    return _then(_MealListUiState(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataLoader: null == dataLoader
          ? _self.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<Meal>>,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      showCalendar: null == showCalendar
          ? _self.showCalendar
          : showCalendar // ignore: cast_nullable_to_non_nullable
              as bool,
      energyGoalAmount: freezed == energyGoalAmount
          ? _self.energyGoalAmount
          : energyGoalAmount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }

  /// Create a copy of MealListUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get energyGoalAmount {
    if (_self.energyGoalAmount == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.energyGoalAmount!, (value) {
      return _then(_self.copyWith(energyGoalAmount: value));
    });
  }
}

// dart format on
