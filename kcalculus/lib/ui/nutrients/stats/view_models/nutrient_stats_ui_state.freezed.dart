// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_stats_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientStatsUiState {
  DateTime get date;
  NutrientData get data;
  List<NutrientStatsRow> get rows;

  /// Create a copy of NutrientStatsUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutrientStatsUiStateCopyWith<NutrientStatsUiState> get copyWith =>
      _$NutrientStatsUiStateCopyWithImpl<NutrientStatsUiState>(
          this as NutrientStatsUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutrientStatsUiState &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other.rows, rows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, data, const DeepCollectionEquality().hash(rows));

  @override
  String toString() {
    return 'NutrientStatsUiState(date: $date, data: $data, rows: $rows)';
  }
}

/// @nodoc
abstract mixin class $NutrientStatsUiStateCopyWith<$Res> {
  factory $NutrientStatsUiStateCopyWith(NutrientStatsUiState value,
          $Res Function(NutrientStatsUiState) _then) =
      _$NutrientStatsUiStateCopyWithImpl;
  @useResult
  $Res call({DateTime date, NutrientData data, List<NutrientStatsRow> rows});

  $NutrientDataCopyWith<$Res> get data;
}

/// @nodoc
class _$NutrientStatsUiStateCopyWithImpl<$Res>
    implements $NutrientStatsUiStateCopyWith<$Res> {
  _$NutrientStatsUiStateCopyWithImpl(this._self, this._then);

  final NutrientStatsUiState _self;
  final $Res Function(NutrientStatsUiState) _then;

  /// Create a copy of NutrientStatsUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? data = null,
    Object? rows = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as NutrientData,
      rows: null == rows
          ? _self.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<NutrientStatsRow>,
    ));
  }

  /// Create a copy of NutrientStatsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientDataCopyWith<$Res> get data {
    return $NutrientDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc

class _NutrientStatsUiState implements NutrientStatsUiState {
  const _NutrientStatsUiState(
      {required this.date,
      required this.data,
      required final List<NutrientStatsRow> rows})
      : _rows = rows;

  @override
  final DateTime date;
  @override
  final NutrientData data;
  final List<NutrientStatsRow> _rows;
  @override
  List<NutrientStatsRow> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  /// Create a copy of NutrientStatsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutrientStatsUiStateCopyWith<_NutrientStatsUiState> get copyWith =>
      __$NutrientStatsUiStateCopyWithImpl<_NutrientStatsUiState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutrientStatsUiState &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, data, const DeepCollectionEquality().hash(_rows));

  @override
  String toString() {
    return 'NutrientStatsUiState._default(date: $date, data: $data, rows: $rows)';
  }
}

/// @nodoc
abstract mixin class _$NutrientStatsUiStateCopyWith<$Res>
    implements $NutrientStatsUiStateCopyWith<$Res> {
  factory _$NutrientStatsUiStateCopyWith(_NutrientStatsUiState value,
          $Res Function(_NutrientStatsUiState) _then) =
      __$NutrientStatsUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, NutrientData data, List<NutrientStatsRow> rows});

  @override
  $NutrientDataCopyWith<$Res> get data;
}

/// @nodoc
class __$NutrientStatsUiStateCopyWithImpl<$Res>
    implements _$NutrientStatsUiStateCopyWith<$Res> {
  __$NutrientStatsUiStateCopyWithImpl(this._self, this._then);

  final _NutrientStatsUiState _self;
  final $Res Function(_NutrientStatsUiState) _then;

  /// Create a copy of NutrientStatsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? data = null,
    Object? rows = null,
  }) {
    return _then(_NutrientStatsUiState(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as NutrientData,
      rows: null == rows
          ? _self._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<NutrientStatsRow>,
    ));
  }

  /// Create a copy of NutrientStatsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientDataCopyWith<$Res> get data {
    return $NutrientDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
