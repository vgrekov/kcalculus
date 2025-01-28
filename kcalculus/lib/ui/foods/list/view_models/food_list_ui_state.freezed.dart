// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_list_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodListUiState {
  String get searchQuery => throw _privateConstructorUsedError;
  Future<List<EdibleSearchResult>> get searchResults =>
      throw _privateConstructorUsedError;

  /// Create a copy of FoodListUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodListUiStateCopyWith<FoodListUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodListUiStateCopyWith<$Res> {
  factory $FoodListUiStateCopyWith(
          FoodListUiState value, $Res Function(FoodListUiState) then) =
      _$FoodListUiStateCopyWithImpl<$Res, FoodListUiState>;
  @useResult
  $Res call(
      {String searchQuery, Future<List<EdibleSearchResult>> searchResults});
}

/// @nodoc
class _$FoodListUiStateCopyWithImpl<$Res, $Val extends FoodListUiState>
    implements $FoodListUiStateCopyWith<$Res> {
  _$FoodListUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodListUiState
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
abstract class _$$FoodListUiStateImplCopyWith<$Res>
    implements $FoodListUiStateCopyWith<$Res> {
  factory _$$FoodListUiStateImplCopyWith(_$FoodListUiStateImpl value,
          $Res Function(_$FoodListUiStateImpl) then) =
      __$$FoodListUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery, Future<List<EdibleSearchResult>> searchResults});
}

/// @nodoc
class __$$FoodListUiStateImplCopyWithImpl<$Res>
    extends _$FoodListUiStateCopyWithImpl<$Res, _$FoodListUiStateImpl>
    implements _$$FoodListUiStateImplCopyWith<$Res> {
  __$$FoodListUiStateImplCopyWithImpl(
      _$FoodListUiStateImpl _value, $Res Function(_$FoodListUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodListUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? searchResults = null,
  }) {
    return _then(_$FoodListUiStateImpl(
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

class _$FoodListUiStateImpl implements _FoodListUiState {
  const _$FoodListUiStateImpl(
      {required this.searchQuery, required this.searchResults});

  @override
  final String searchQuery;
  @override
  final Future<List<EdibleSearchResult>> searchResults;

  @override
  String toString() {
    return 'FoodListUiState(searchQuery: $searchQuery, searchResults: $searchResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodListUiStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.searchResults, searchResults) ||
                other.searchResults == searchResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery, searchResults);

  /// Create a copy of FoodListUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodListUiStateImplCopyWith<_$FoodListUiStateImpl> get copyWith =>
      __$$FoodListUiStateImplCopyWithImpl<_$FoodListUiStateImpl>(
          this, _$identity);
}

abstract class _FoodListUiState implements FoodListUiState {
  const factory _FoodListUiState(
          {required final String searchQuery,
          required final Future<List<EdibleSearchResult>> searchResults}) =
      _$FoodListUiStateImpl;

  @override
  String get searchQuery;
  @override
  Future<List<EdibleSearchResult>> get searchResults;

  /// Create a copy of FoodListUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodListUiStateImplCopyWith<_$FoodListUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
