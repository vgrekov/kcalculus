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
  String get searchQuery;
  Future<List<Model>> get dataLoader;
  List<Model> get data;

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
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.dataLoader, dataLoader) ||
                other.dataLoader == dataLoader) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery, dataLoader,
      const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'SearchUiState<$Model>(searchQuery: $searchQuery, dataLoader: $dataLoader, data: $data)';
  }
}

/// @nodoc
abstract mixin class $SearchUiStateCopyWith<Model, $Res> {
  factory $SearchUiStateCopyWith(SearchUiState<Model> value,
      $Res Function(SearchUiState<Model>) _then) = _$SearchUiStateCopyWithImpl;
  @useResult
  $Res call(
      {String searchQuery, Future<List<Model>> dataLoader, List<Model> data});
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
    Object? searchQuery = null,
    Object? dataLoader = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      dataLoader: null == dataLoader
          ? _self.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<Model>>,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Model>,
    ));
  }
}

/// @nodoc

class _SearchUiState<Model> implements SearchUiState<Model> {
  const _SearchUiState(
      {required this.searchQuery,
      required this.dataLoader,
      final List<Model> data = const []})
      : _data = data;

  @override
  final String searchQuery;
  @override
  final Future<List<Model>> dataLoader;
  final List<Model> _data;
  @override
  @JsonKey()
  List<Model> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

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
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.dataLoader, dataLoader) ||
                other.dataLoader == dataLoader) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery, dataLoader,
      const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'SearchUiState<$Model>(searchQuery: $searchQuery, dataLoader: $dataLoader, data: $data)';
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
  $Res call(
      {String searchQuery, Future<List<Model>> dataLoader, List<Model> data});
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
    Object? searchQuery = null,
    Object? dataLoader = null,
    Object? data = null,
  }) {
    return _then(_SearchUiState<Model>(
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      dataLoader: null == dataLoader
          ? _self.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<Model>>,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Model>,
    ));
  }
}

// dart format on
