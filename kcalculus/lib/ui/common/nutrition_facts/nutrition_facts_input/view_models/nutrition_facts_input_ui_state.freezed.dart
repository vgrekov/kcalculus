// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_input_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutritionFactsInputUiState {
  List<Nutrient> get nutrients => throw _privateConstructorUsedError;
  List<NutritionFactsUiState> get recordStates =>
      throw _privateConstructorUsedError;
  int get selectedRecordIndex => throw _privateConstructorUsedError;

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsInputUiStateCopyWith<NutritionFactsInputUiState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsInputUiStateCopyWith<$Res> {
  factory $NutritionFactsInputUiStateCopyWith(NutritionFactsInputUiState value,
          $Res Function(NutritionFactsInputUiState) then) =
      _$NutritionFactsInputUiStateCopyWithImpl<$Res,
          NutritionFactsInputUiState>;
  @useResult
  $Res call(
      {List<Nutrient> nutrients,
      List<NutritionFactsUiState> recordStates,
      int selectedRecordIndex});
}

/// @nodoc
class _$NutritionFactsInputUiStateCopyWithImpl<$Res,
        $Val extends NutritionFactsInputUiState>
    implements $NutritionFactsInputUiStateCopyWith<$Res> {
  _$NutritionFactsInputUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrients = null,
    Object? recordStates = null,
    Object? selectedRecordIndex = null,
  }) {
    return _then(_value.copyWith(
      nutrients: null == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
      recordStates: null == recordStates
          ? _value.recordStates
          : recordStates // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsUiState>,
      selectedRecordIndex: null == selectedRecordIndex
          ? _value.selectedRecordIndex
          : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionFactsInputUiStateImplCopyWith<$Res>
    implements $NutritionFactsInputUiStateCopyWith<$Res> {
  factory _$$NutritionFactsInputUiStateImplCopyWith(
          _$NutritionFactsInputUiStateImpl value,
          $Res Function(_$NutritionFactsInputUiStateImpl) then) =
      __$$NutritionFactsInputUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Nutrient> nutrients,
      List<NutritionFactsUiState> recordStates,
      int selectedRecordIndex});
}

/// @nodoc
class __$$NutritionFactsInputUiStateImplCopyWithImpl<$Res>
    extends _$NutritionFactsInputUiStateCopyWithImpl<$Res,
        _$NutritionFactsInputUiStateImpl>
    implements _$$NutritionFactsInputUiStateImplCopyWith<$Res> {
  __$$NutritionFactsInputUiStateImplCopyWithImpl(
      _$NutritionFactsInputUiStateImpl _value,
      $Res Function(_$NutritionFactsInputUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrients = null,
    Object? recordStates = null,
    Object? selectedRecordIndex = null,
  }) {
    return _then(_$NutritionFactsInputUiStateImpl(
      nutrients: null == nutrients
          ? _value._nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
      recordStates: null == recordStates
          ? _value._recordStates
          : recordStates // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsUiState>,
      selectedRecordIndex: null == selectedRecordIndex
          ? _value.selectedRecordIndex
          : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NutritionFactsInputUiStateImpl extends _NutritionFactsInputUiState {
  const _$NutritionFactsInputUiStateImpl(
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

  @override
  String toString() {
    return 'NutritionFactsInputUiState(nutrients: $nutrients, recordStates: $recordStates, selectedRecordIndex: $selectedRecordIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsInputUiStateImpl &&
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

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsInputUiStateImplCopyWith<_$NutritionFactsInputUiStateImpl>
      get copyWith => __$$NutritionFactsInputUiStateImplCopyWithImpl<
          _$NutritionFactsInputUiStateImpl>(this, _$identity);
}

abstract class _NutritionFactsInputUiState extends NutritionFactsInputUiState {
  const factory _NutritionFactsInputUiState(
          {required final List<Nutrient> nutrients,
          required final List<NutritionFactsUiState> recordStates,
          required final int selectedRecordIndex}) =
      _$NutritionFactsInputUiStateImpl;
  const _NutritionFactsInputUiState._() : super._();

  @override
  List<Nutrient> get nutrients;
  @override
  List<NutritionFactsUiState> get recordStates;
  @override
  int get selectedRecordIndex;

  /// Create a copy of NutritionFactsInputUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsInputUiStateImplCopyWith<_$NutritionFactsInputUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
