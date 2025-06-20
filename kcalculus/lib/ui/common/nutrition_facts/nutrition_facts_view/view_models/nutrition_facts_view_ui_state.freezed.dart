// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_view_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsViewUiState implements DiagnosticableTreeMixin {
  List<NutritionFactsRecord> get records;
  int get selectedRecordIndex;

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsViewUiStateCopyWith<NutritionFactsViewUiState> get copyWith =>
      _$NutritionFactsViewUiStateCopyWithImpl<NutritionFactsViewUiState>(
          this as NutritionFactsViewUiState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'NutritionFactsViewUiState'))
      ..add(DiagnosticsProperty('records', records))
      ..add(DiagnosticsProperty('selectedRecordIndex', selectedRecordIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFactsViewUiState &&
            const DeepCollectionEquality().equals(other.records, records) &&
            (identical(other.selectedRecordIndex, selectedRecordIndex) ||
                other.selectedRecordIndex == selectedRecordIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(records), selectedRecordIndex);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NutritionFactsViewUiState(records: $records, selectedRecordIndex: $selectedRecordIndex)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsViewUiStateCopyWith<$Res> {
  factory $NutritionFactsViewUiStateCopyWith(NutritionFactsViewUiState value,
          $Res Function(NutritionFactsViewUiState) _then) =
      _$NutritionFactsViewUiStateCopyWithImpl;
  @useResult
  $Res call({List<NutritionFactsRecord> records, int selectedRecordIndex});
}

/// @nodoc
class _$NutritionFactsViewUiStateCopyWithImpl<$Res>
    implements $NutritionFactsViewUiStateCopyWith<$Res> {
  _$NutritionFactsViewUiStateCopyWithImpl(this._self, this._then);

  final NutritionFactsViewUiState _self;
  final $Res Function(NutritionFactsViewUiState) _then;

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? selectedRecordIndex = null,
  }) {
    return _then(_self.copyWith(
      records: null == records
          ? _self.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsRecord>,
      selectedRecordIndex: null == selectedRecordIndex
          ? _self.selectedRecordIndex
          : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NutritionFactsViewUiState extends NutritionFactsViewUiState
    with DiagnosticableTreeMixin {
  const _NutritionFactsViewUiState(
      {required final List<NutritionFactsRecord> records,
      required this.selectedRecordIndex})
      : _records = records,
        super._();

  final List<NutritionFactsRecord> _records;
  @override
  List<NutritionFactsRecord> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  final int selectedRecordIndex;

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsViewUiStateCopyWith<_NutritionFactsViewUiState>
      get copyWith =>
          __$NutritionFactsViewUiStateCopyWithImpl<_NutritionFactsViewUiState>(
              this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'NutritionFactsViewUiState'))
      ..add(DiagnosticsProperty('records', records))
      ..add(DiagnosticsProperty('selectedRecordIndex', selectedRecordIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFactsViewUiState &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.selectedRecordIndex, selectedRecordIndex) ||
                other.selectedRecordIndex == selectedRecordIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_records), selectedRecordIndex);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NutritionFactsViewUiState(records: $records, selectedRecordIndex: $selectedRecordIndex)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsViewUiStateCopyWith<$Res>
    implements $NutritionFactsViewUiStateCopyWith<$Res> {
  factory _$NutritionFactsViewUiStateCopyWith(_NutritionFactsViewUiState value,
          $Res Function(_NutritionFactsViewUiState) _then) =
      __$NutritionFactsViewUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<NutritionFactsRecord> records, int selectedRecordIndex});
}

/// @nodoc
class __$NutritionFactsViewUiStateCopyWithImpl<$Res>
    implements _$NutritionFactsViewUiStateCopyWith<$Res> {
  __$NutritionFactsViewUiStateCopyWithImpl(this._self, this._then);

  final _NutritionFactsViewUiState _self;
  final $Res Function(_NutritionFactsViewUiState) _then;

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? records = null,
    Object? selectedRecordIndex = null,
  }) {
    return _then(_NutritionFactsViewUiState(
      records: null == records
          ? _self._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsRecord>,
      selectedRecordIndex: null == selectedRecordIndex
          ? _self.selectedRecordIndex
          : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
