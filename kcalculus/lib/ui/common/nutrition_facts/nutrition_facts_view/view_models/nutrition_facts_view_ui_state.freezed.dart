// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_view_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutritionFactsViewUiState {
  List<NutritionFactsRecord> get records => throw _privateConstructorUsedError;
  int get selectedRecordIndex => throw _privateConstructorUsedError;

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsViewUiStateCopyWith<NutritionFactsViewUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsViewUiStateCopyWith<$Res> {
  factory $NutritionFactsViewUiStateCopyWith(NutritionFactsViewUiState value,
          $Res Function(NutritionFactsViewUiState) then) =
      _$NutritionFactsViewUiStateCopyWithImpl<$Res, NutritionFactsViewUiState>;
  @useResult
  $Res call({List<NutritionFactsRecord> records, int selectedRecordIndex});
}

/// @nodoc
class _$NutritionFactsViewUiStateCopyWithImpl<$Res,
        $Val extends NutritionFactsViewUiState>
    implements $NutritionFactsViewUiStateCopyWith<$Res> {
  _$NutritionFactsViewUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? selectedRecordIndex = null,
  }) {
    return _then(_value.copyWith(
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsRecord>,
      selectedRecordIndex: null == selectedRecordIndex
          ? _value.selectedRecordIndex
          : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionFactsViewUiStateImplCopyWith<$Res>
    implements $NutritionFactsViewUiStateCopyWith<$Res> {
  factory _$$NutritionFactsViewUiStateImplCopyWith(
          _$NutritionFactsViewUiStateImpl value,
          $Res Function(_$NutritionFactsViewUiStateImpl) then) =
      __$$NutritionFactsViewUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NutritionFactsRecord> records, int selectedRecordIndex});
}

/// @nodoc
class __$$NutritionFactsViewUiStateImplCopyWithImpl<$Res>
    extends _$NutritionFactsViewUiStateCopyWithImpl<$Res,
        _$NutritionFactsViewUiStateImpl>
    implements _$$NutritionFactsViewUiStateImplCopyWith<$Res> {
  __$$NutritionFactsViewUiStateImplCopyWithImpl(
      _$NutritionFactsViewUiStateImpl _value,
      $Res Function(_$NutritionFactsViewUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? selectedRecordIndex = null,
  }) {
    return _then(_$NutritionFactsViewUiStateImpl(
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsRecord>,
      selectedRecordIndex: null == selectedRecordIndex
          ? _value.selectedRecordIndex
          : selectedRecordIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NutritionFactsViewUiStateImpl extends _NutritionFactsViewUiState
    with DiagnosticableTreeMixin {
  const _$NutritionFactsViewUiStateImpl(
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NutritionFactsViewUiState(records: $records, selectedRecordIndex: $selectedRecordIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NutritionFactsViewUiState'))
      ..add(DiagnosticsProperty('records', records))
      ..add(DiagnosticsProperty('selectedRecordIndex', selectedRecordIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsViewUiStateImpl &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.selectedRecordIndex, selectedRecordIndex) ||
                other.selectedRecordIndex == selectedRecordIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_records), selectedRecordIndex);

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsViewUiStateImplCopyWith<_$NutritionFactsViewUiStateImpl>
      get copyWith => __$$NutritionFactsViewUiStateImplCopyWithImpl<
          _$NutritionFactsViewUiStateImpl>(this, _$identity);
}

abstract class _NutritionFactsViewUiState extends NutritionFactsViewUiState {
  const factory _NutritionFactsViewUiState(
          {required final List<NutritionFactsRecord> records,
          required final int selectedRecordIndex}) =
      _$NutritionFactsViewUiStateImpl;
  const _NutritionFactsViewUiState._() : super._();

  @override
  List<NutritionFactsRecord> get records;
  @override
  int get selectedRecordIndex;

  /// Create a copy of NutritionFactsViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsViewUiStateImplCopyWith<_$NutritionFactsViewUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
