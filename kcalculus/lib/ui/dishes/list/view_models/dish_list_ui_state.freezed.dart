// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_list_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DishListUiState {
  String get searchQuery => throw _privateConstructorUsedError;
  Future<List<EdibleSearchResult>> get searchResults =>
      throw _privateConstructorUsedError;

  /// Create a copy of DishListUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DishListUiStateCopyWith<DishListUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishListUiStateCopyWith<$Res> {
  factory $DishListUiStateCopyWith(
          DishListUiState value, $Res Function(DishListUiState) then) =
      _$DishListUiStateCopyWithImpl<$Res, DishListUiState>;
  @useResult
  $Res call(
      {String searchQuery, Future<List<EdibleSearchResult>> searchResults});
}

/// @nodoc
class _$DishListUiStateCopyWithImpl<$Res, $Val extends DishListUiState>
    implements $DishListUiStateCopyWith<$Res> {
  _$DishListUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DishListUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? searchResults = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as Future<List<EdibleSearchResult>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishListUiStateImplCopyWith<$Res>
    implements $DishListUiStateCopyWith<$Res> {
  factory _$$DishListUiStateImplCopyWith(_$DishListUiStateImpl value,
          $Res Function(_$DishListUiStateImpl) then) =
      __$$DishListUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery, Future<List<EdibleSearchResult>> searchResults});
}

/// @nodoc
class __$$DishListUiStateImplCopyWithImpl<$Res>
    extends _$DishListUiStateCopyWithImpl<$Res, _$DishListUiStateImpl>
    implements _$$DishListUiStateImplCopyWith<$Res> {
  __$$DishListUiStateImplCopyWithImpl(
      _$DishListUiStateImpl _value, $Res Function(_$DishListUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DishListUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? searchResults = null,
  }) {
    return _then(_$DishListUiStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as Future<List<EdibleSearchResult>>,
    ));
  }
}

/// @nodoc

class _$DishListUiStateImpl implements _DishListUiState {
  const _$DishListUiStateImpl(
      {required this.searchQuery, required this.searchResults});

  @override
  final String searchQuery;
  @override
  final Future<List<EdibleSearchResult>> searchResults;

  @override
  String toString() {
    return 'DishListUiState(searchQuery: $searchQuery, searchResults: $searchResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishListUiStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.searchResults, searchResults) ||
                other.searchResults == searchResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery, searchResults);

  /// Create a copy of DishListUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DishListUiStateImplCopyWith<_$DishListUiStateImpl> get copyWith =>
      __$$DishListUiStateImplCopyWithImpl<_$DishListUiStateImpl>(
          this, _$identity);
}

abstract class _DishListUiState implements DishListUiState {
  const factory _DishListUiState(
          {required final String searchQuery,
          required final Future<List<EdibleSearchResult>> searchResults}) =
      _$DishListUiStateImpl;

  @override
  String get searchQuery;
  @override
  Future<List<EdibleSearchResult>> get searchResults;

  /// Create a copy of DishListUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DishListUiStateImplCopyWith<_$DishListUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
