// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_input_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsInputUiState {
  List<Nutrient> get nutrients;
  List<NutritionFactsUiState> get recordStates;
  int get selectedRecordIndex;

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsInputUiStateCopyWith<NutritionFactsInputUiState>
      get copyWith =>
          _$NutritionFactsInputUiStateCopyWithImpl<NutritionFactsInputUiState>(
              this as NutritionFactsInputUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFactsInputUiState &&
            const DeepCollectionEquality().equals(other.nutrients, nutrients) &&
            const DeepCollectionEquality()
                .equals(other.recordStates, recordStates) &&
            (identical(other.selectedRecordIndex, selectedRecordIndex) ||
                other.selectedRecordIndex == selectedRecordIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nutrients),
      const DeepCollectionEquality().hash(recordStates),
      selectedRecordIndex);

  @override
  String toString() {
    return 'NutritionFactsInputUiState(nutrients: $nutrients, recordStates: $recordStates, selectedRecordIndex: $selectedRecordIndex)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsInputUiStateCopyWith<$Res> {
  factory $NutritionFactsInputUiStateCopyWith(NutritionFactsInputUiState value,
          $Res Function(NutritionFactsInputUiState) _then) =
      _$NutritionFactsInputUiStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Nutrient> nutrients,
      List<NutritionFactsUiState> recordStates,
      int selectedRecordIndex});
}

/// @nodoc
class _$NutritionFactsInputUiStateCopyWithImpl<$Res>
    implements $NutritionFactsInputUiStateCopyWith<$Res> {
  _$NutritionFactsInputUiStateCopyWithImpl(this._self, this._then);

  final NutritionFactsInputUiState _self;
  final $Res Function(NutritionFactsInputUiState) _then;

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrients = null,
    Object? recordStates = null,
    Object? selectedRecordIndex = null,
  }) {
    return _then(_self.copyWith(
      nutrients: null == nutrients
          ? _self.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
      recordStates: null == recordStates
          ? _self.recordStates
          : recordStates // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsUiState>,
      selectedRecordIndex: null == selectedRecordIndex
          ? _self.selectedRecordIndex
          : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NutritionFactsInputUiState extends NutritionFactsInputUiState {
  const _NutritionFactsInputUiState(
      {required final List<Nutrient> nutrients,
      required final List<NutritionFactsUiState> recordStates,
      required this.selectedRecordIndex})
      : _nutrients = nutrients,
        _recordStates = recordStates,
        super._();

  final List<Nutrient> _nutrients;
  @override
  List<Nutrient> get nutrients {
    if (_nutrients is EqualUnmodifiableListView) return _nutrients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrients);
  }

  final List<NutritionFactsUiState> _recordStates;
  @override
  List<NutritionFactsUiState> get recordStates {
    if (_recordStates is EqualUnmodifiableListView) return _recordStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordStates);
  }

  @override
  final int selectedRecordIndex;

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsInputUiStateCopyWith<_NutritionFactsInputUiState>
      get copyWith => __$NutritionFactsInputUiStateCopyWithImpl<
          _NutritionFactsInputUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFactsInputUiState &&
            const DeepCollectionEquality()
                .equals(other._nutrients, _nutrients) &&
            const DeepCollectionEquality()
                .equals(other._recordStates, _recordStates) &&
            (identical(other.selectedRecordIndex, selectedRecordIndex) ||
                other.selectedRecordIndex == selectedRecordIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nutrients),
      const DeepCollectionEquality().hash(_recordStates),
      selectedRecordIndex);

  @override
  String toString() {
    return 'NutritionFactsInputUiState(nutrients: $nutrients, recordStates: $recordStates, selectedRecordIndex: $selectedRecordIndex)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsInputUiStateCopyWith<$Res>
    implements $NutritionFactsInputUiStateCopyWith<$Res> {
  factory _$NutritionFactsInputUiStateCopyWith(
          _NutritionFactsInputUiState value,
          $Res Function(_NutritionFactsInputUiState) _then) =
      __$NutritionFactsInputUiStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Nutrient> nutrients,
      List<NutritionFactsUiState> recordStates,
      int selectedRecordIndex});
}

/// @nodoc
class __$NutritionFactsInputUiStateCopyWithImpl<$Res>
    implements _$NutritionFactsInputUiStateCopyWith<$Res> {
  __$NutritionFactsInputUiStateCopyWithImpl(this._self, this._then);

  final _NutritionFactsInputUiState _self;
  final $Res Function(_NutritionFactsInputUiState) _then;

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nutrients = null,
    Object? recordStates = null,
    Object? selectedRecordIndex = null,
  }) {
    return _then(_NutritionFactsInputUiState(
      nutrients: null == nutrients
          ? _self._nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
      recordStates: null == recordStates
          ? _self._recordStates
          : recordStates // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsUiState>,
      selectedRecordIndex: null == selectedRecordIndex
          ? _self.selectedRecordIndex
          : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
