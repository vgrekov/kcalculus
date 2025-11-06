// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchUiState<Model> {
  String get query;
  FutureOr<List<Model>> get data;

  /// Create a copy of SearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchUiStateCopyWith<Model, SearchUiState<Model>> get copyWith =>
      _$SearchUiStateCopyWithImpl<Model, SearchUiState<Model>>(
          this as SearchUiState<Model>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchUiState<Model> &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, data);

  @override
  String toString() {
    return 'SearchUiState<$Model>(query: $query, data: $data)';
  }
}

/// @nodoc
abstract mixin class $SearchUiStateCopyWith<Model, $Res> {
  factory $SearchUiStateCopyWith(SearchUiState<Model> value,
      $Res Function(SearchUiState<Model>) _then) = _$SearchUiStateCopyWithImpl;
  @useResult
  $Res call({String query, FutureOr<List<Model>> data});
}

/// @nodoc
class _$SearchUiStateCopyWithImpl<Model, $Res>
    implements $SearchUiStateCopyWith<Model, $Res> {
  _$SearchUiStateCopyWithImpl(this._self, this._then);

  final SearchUiState<Model> _self;
  final $Res Function(SearchUiState<Model>) _then;

  /// Create a copy of SearchUiState
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
              as FutureOr<List<Model>>,
    ));
  }
}

/// @nodoc

class _SearchUiState<Model> implements SearchUiState<Model> {
  const _SearchUiState({required this.query, required this.data});

  @override
  final String query;
  @override
  final FutureOr<List<Model>> data;

  /// Create a copy of SearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchUiStateCopyWith<Model, _SearchUiState<Model>> get copyWith =>
      __$SearchUiStateCopyWithImpl<Model, _SearchUiState<Model>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchUiState<Model> &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, data);

  @override
  String toString() {
    return 'SearchUiState<$Model>(query: $query, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SearchUiStateCopyWith<Model, $Res>
    implements $SearchUiStateCopyWith<Model, $Res> {
  factory _$SearchUiStateCopyWith(_SearchUiState<Model> value,
          $Res Function(_SearchUiState<Model>) _then) =
      __$SearchUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({String query, FutureOr<List<Model>> data});
}

/// @nodoc
class __$SearchUiStateCopyWithImpl<Model, $Res>
    implements _$SearchUiStateCopyWith<Model, $Res> {
  __$SearchUiStateCopyWithImpl(this._self, this._then);

  final _SearchUiState<Model> _self;
  final $Res Function(_SearchUiState<Model>) _then;

  /// Create a copy of SearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? data = null,
  }) {
    return _then(_SearchUiState<Model>(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as FutureOr<List<Model>>,
    ));
  }
}

// dart format on
