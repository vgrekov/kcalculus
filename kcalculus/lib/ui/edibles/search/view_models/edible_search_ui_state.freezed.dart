// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_search_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdibleSearchUiState {
  String get query;
  FutureOr<List<EdiblePreview>> get data;

  /// Create a copy of EdibleSearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EdibleSearchUiStateCopyWith<EdibleSearchUiState> get copyWith =>
      _$EdibleSearchUiStateCopyWithImpl<EdibleSearchUiState>(
          this as EdibleSearchUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EdibleSearchUiState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, data);

  @override
  String toString() {
    return 'EdibleSearchUiState(query: $query, data: $data)';
  }
}

/// @nodoc
abstract mixin class $EdibleSearchUiStateCopyWith<$Res> {
  factory $EdibleSearchUiStateCopyWith(
          EdibleSearchUiState value, $Res Function(EdibleSearchUiState) _then) =
      _$EdibleSearchUiStateCopyWithImpl;
  @useResult
  $Res call({String query, FutureOr<List<EdiblePreview>> data});
}

/// @nodoc
class _$EdibleSearchUiStateCopyWithImpl<$Res>
    implements $EdibleSearchUiStateCopyWith<$Res> {
  _$EdibleSearchUiStateCopyWithImpl(this._self, this._then);

  final EdibleSearchUiState _self;
  final $Res Function(EdibleSearchUiState) _then;

  /// Create a copy of EdibleSearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as FutureOr<List<EdiblePreview>>,
    ));
  }
}

/// @nodoc

class _EdibleSearchUiState implements EdibleSearchUiState {
  const _EdibleSearchUiState({required this.query, required this.data});

  @override
  final String query;
  @override
  final FutureOr<List<EdiblePreview>> data;

  /// Create a copy of EdibleSearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EdibleSearchUiStateCopyWith<_EdibleSearchUiState> get copyWith =>
      __$EdibleSearchUiStateCopyWithImpl<_EdibleSearchUiState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EdibleSearchUiState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, data);

  @override
  String toString() {
    return 'EdibleSearchUiState(query: $query, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$EdibleSearchUiStateCopyWith<$Res>
    implements $EdibleSearchUiStateCopyWith<$Res> {
  factory _$EdibleSearchUiStateCopyWith(_EdibleSearchUiState value,
          $Res Function(_EdibleSearchUiState) _then) =
      __$EdibleSearchUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({String query, FutureOr<List<EdiblePreview>> data});
}

/// @nodoc
class __$EdibleSearchUiStateCopyWithImpl<$Res>
    implements _$EdibleSearchUiStateCopyWith<$Res> {
  __$EdibleSearchUiStateCopyWithImpl(this._self, this._then);

  final _EdibleSearchUiState _self;
  final $Res Function(_EdibleSearchUiState) _then;

  /// Create a copy of EdibleSearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? data = null,
  }) {
    return _then(_EdibleSearchUiState(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as FutureOr<List<EdiblePreview>>,
    ));
  }
}

// dart format on
