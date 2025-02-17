// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_search_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EdibleSearchUiState {
  String get searchQuery => throw _privateConstructorUsedError;
  Future<List<EdibleSearchResult>> get dataLoader =>
      throw _privateConstructorUsedError;
  List<EdibleSearchResult> get data => throw _privateConstructorUsedError;

  /// Create a copy of EdibleSearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EdibleSearchUiStateCopyWith<EdibleSearchUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EdibleSearchUiStateCopyWith<$Res> {
  factory $EdibleSearchUiStateCopyWith(
          EdibleSearchUiState value, $Res Function(EdibleSearchUiState) then) =
      _$EdibleSearchUiStateCopyWithImpl<$Res, EdibleSearchUiState>;
  @useResult
  $Res call(
      {String searchQuery,
      Future<List<EdibleSearchResult>> dataLoader,
      List<EdibleSearchResult> data});
}

/// @nodoc
class _$EdibleSearchUiStateCopyWithImpl<$Res, $Val extends EdibleSearchUiState>
    implements $EdibleSearchUiStateCopyWith<$Res> {
  _$EdibleSearchUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EdibleSearchUiState
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
              as Future<List<EdibleSearchResult>>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EdibleSearchResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EdibleSearchUiStateImplCopyWith<$Res>
    implements $EdibleSearchUiStateCopyWith<$Res> {
  factory _$$EdibleSearchUiStateImplCopyWith(_$EdibleSearchUiStateImpl value,
          $Res Function(_$EdibleSearchUiStateImpl) then) =
      __$$EdibleSearchUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      Future<List<EdibleSearchResult>> dataLoader,
      List<EdibleSearchResult> data});
}

/// @nodoc
class __$$EdibleSearchUiStateImplCopyWithImpl<$Res>
    extends _$EdibleSearchUiStateCopyWithImpl<$Res, _$EdibleSearchUiStateImpl>
    implements _$$EdibleSearchUiStateImplCopyWith<$Res> {
  __$$EdibleSearchUiStateImplCopyWithImpl(_$EdibleSearchUiStateImpl _value,
      $Res Function(_$EdibleSearchUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EdibleSearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? dataLoader = null,
    Object? data = null,
  }) {
    return _then(_$EdibleSearchUiStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      dataLoader: null == dataLoader
          ? _value.dataLoader
          : dataLoader // ignore: cast_nullable_to_non_nullable
              as Future<List<EdibleSearchResult>>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EdibleSearchResult>,
    ));
  }
}

/// @nodoc

class _$EdibleSearchUiStateImpl implements _EdibleSearchUiState {
  const _$EdibleSearchUiStateImpl(
      {required this.searchQuery,
      required this.dataLoader,
      final List<EdibleSearchResult> data = const []})
      : _data = data;

  @override
  final String searchQuery;
  @override
  final Future<List<EdibleSearchResult>> dataLoader;
  final List<EdibleSearchResult> _data;
  @override
  @JsonKey()
  List<EdibleSearchResult> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'EdibleSearchUiState(searchQuery: $searchQuery, dataLoader: $dataLoader, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EdibleSearchUiStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.dataLoader, dataLoader) ||
                other.dataLoader == dataLoader) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery, dataLoader,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of EdibleSearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EdibleSearchUiStateImplCopyWith<_$EdibleSearchUiStateImpl> get copyWith =>
      __$$EdibleSearchUiStateImplCopyWithImpl<_$EdibleSearchUiStateImpl>(
          this, _$identity);
}

abstract class _EdibleSearchUiState implements EdibleSearchUiState {
  const factory _EdibleSearchUiState(
      {required final String searchQuery,
      required final Future<List<EdibleSearchResult>> dataLoader,
      final List<EdibleSearchResult> data}) = _$EdibleSearchUiStateImpl;

  @override
  String get searchQuery;
  @override
  Future<List<EdibleSearchResult>> get dataLoader;
  @override
  List<EdibleSearchResult> get data;

  /// Create a copy of EdibleSearchUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EdibleSearchUiStateImplCopyWith<_$EdibleSearchUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
