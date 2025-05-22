// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchUiState<Model> {
  String get searchQuery => throw _privateConstructorUsedError;
  Future<List<Model>> get dataLoader => throw _privateConstructorUsedError;
  List<Model> get data => throw _privateConstructorUsedError;

  /// Create a copy of SearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchUiStateCopyWith<Model, SearchUiState<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUiStateCopyWith<Model, $Res> {
  factory $SearchUiStateCopyWith(SearchUiState<Model> value,
          $Res Function(SearchUiState<Model>) then) =
      _$SearchUiStateCopyWithImpl<Model, $Res, SearchUiState<Model>>;
  @useResult
  $Res call(
      {String searchQuery, Future<List<Model>> dataLoader, List<Model> data});
}

/// @nodoc
class _$SearchUiStateCopyWithImpl<Model, $Res,
        $Val extends SearchUiState<Model>>
    implements $SearchUiStateCopyWith<Model, $Res> {
  _$SearchUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? dataLoader = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      dataLoader: null == dataLoader
          ? _value.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<Model>>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Model>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUiStateImplCopyWith<Model, $Res>
    implements $SearchUiStateCopyWith<Model, $Res> {
  factory _$$SearchUiStateImplCopyWith(_$SearchUiStateImpl<Model> value,
          $Res Function(_$SearchUiStateImpl<Model>) then) =
      __$$SearchUiStateImplCopyWithImpl<Model, $Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery, Future<List<Model>> dataLoader, List<Model> data});
}

/// @nodoc
class __$$SearchUiStateImplCopyWithImpl<Model, $Res>
    extends _$SearchUiStateCopyWithImpl<Model, $Res, _$SearchUiStateImpl<Model>>
    implements _$$SearchUiStateImplCopyWith<Model, $Res> {
  __$$SearchUiStateImplCopyWithImpl(_$SearchUiStateImpl<Model> _value,
      $Res Function(_$SearchUiStateImpl<Model>) _then)
      : super(_value, _then);

  /// Create a copy of SearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? dataLoader = null,
    Object? data = null,
  }) {
    return _then(_$SearchUiStateImpl<Model>(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      dataLoader: null == dataLoader
          ? _value.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<Model>>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Model>,
    ));
  }
}

/// @nodoc

class _$SearchUiStateImpl<Model> implements _SearchUiState<Model> {
  const _$SearchUiStateImpl(
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

  @override
  String toString() {
    return 'SearchUiState<$Model>(searchQuery: $searchQuery, dataLoader: $dataLoader, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUiStateImpl<Model> &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.dataLoader, dataLoader) ||
                other.dataLoader == dataLoader) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery, dataLoader,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of SearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUiStateImplCopyWith<Model, _$SearchUiStateImpl<Model>>
      get copyWith =>
          __$$SearchUiStateImplCopyWithImpl<Model, _$SearchUiStateImpl<Model>>(
              this, _$identity);
}

abstract class _SearchUiState<Model> implements SearchUiState<Model> {
  const factory _SearchUiState(
      {required final String searchQuery,
      required final Future<List<Model>> dataLoader,
      final List<Model> data}) = _$SearchUiStateImpl<Model>;

  @override
  String get searchQuery;
  @override
  Future<List<Model>> get dataLoader;
  @override
  List<Model> get data;

  /// Create a copy of SearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchUiStateImplCopyWith<Model, _$SearchUiStateImpl<Model>>
      get copyWith => throw _privateConstructorUsedError;
}
