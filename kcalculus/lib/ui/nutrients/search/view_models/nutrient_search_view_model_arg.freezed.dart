// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_search_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientSearchViewModelArg {
  String get intialQuery;
  List<Nutrient> get exceptions;

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutrientSearchViewModelArgCopyWith<NutrientSearchViewModelArg>
      get copyWith =>
          _$NutrientSearchViewModelArgCopyWithImpl<NutrientSearchViewModelArg>(
              this as NutrientSearchViewModelArg, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutrientSearchViewModelArg &&
            (identical(other.intialQuery, intialQuery) ||
                other.intialQuery == intialQuery) &&
            const DeepCollectionEquality()
                .equals(other.exceptions, exceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, intialQuery,
      const DeepCollectionEquality().hash(exceptions));

  @override
  String toString() {
    return 'NutrientSearchViewModelArg(intialQuery: $intialQuery, exceptions: $exceptions)';
  }
}

/// @nodoc
abstract mixin class $NutrientSearchViewModelArgCopyWith<$Res> {
  factory $NutrientSearchViewModelArgCopyWith(NutrientSearchViewModelArg value,
          $Res Function(NutrientSearchViewModelArg) _then) =
      _$NutrientSearchViewModelArgCopyWithImpl;
  @useResult
  $Res call({String intialQuery, List<Nutrient> exceptions});
}

/// @nodoc
class _$NutrientSearchViewModelArgCopyWithImpl<$Res>
    implements $NutrientSearchViewModelArgCopyWith<$Res> {
  _$NutrientSearchViewModelArgCopyWithImpl(this._self, this._then);

  final NutrientSearchViewModelArg _self;
  final $Res Function(NutrientSearchViewModelArg) _then;

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intialQuery = null,
    Object? exceptions = null,
  }) {
    return _then(_self.copyWith(
      intialQuery: null == intialQuery
          ? _self.intialQuery
          : intialQuery // ignore: cast_nullable_to_non_nullable
              as String,
      exceptions: null == exceptions
          ? _self.exceptions
          : exceptions // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

/// @nodoc

class _NutrientSearchVewModelArg implements NutrientSearchViewModelArg {
  const _NutrientSearchVewModelArg(
      {this.intialQuery = '', final List<Nutrient> exceptions = const []})
      : _exceptions = exceptions;

  @override
  @JsonKey()
  final String intialQuery;
  final List<Nutrient> _exceptions;
  @override
  @JsonKey()
  List<Nutrient> get exceptions {
    if (_exceptions is EqualUnmodifiableListView) return _exceptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exceptions);
  }

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutrientSearchVewModelArgCopyWith<_NutrientSearchVewModelArg>
      get copyWith =>
          __$NutrientSearchVewModelArgCopyWithImpl<_NutrientSearchVewModelArg>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutrientSearchVewModelArg &&
            (identical(other.intialQuery, intialQuery) ||
                other.intialQuery == intialQuery) &&
            const DeepCollectionEquality()
                .equals(other._exceptions, _exceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, intialQuery,
      const DeepCollectionEquality().hash(_exceptions));

  @override
  String toString() {
    return 'NutrientSearchViewModelArg(intialQuery: $intialQuery, exceptions: $exceptions)';
  }
}

/// @nodoc
abstract mixin class _$NutrientSearchVewModelArgCopyWith<$Res>
    implements $NutrientSearchViewModelArgCopyWith<$Res> {
  factory _$NutrientSearchVewModelArgCopyWith(_NutrientSearchVewModelArg value,
          $Res Function(_NutrientSearchVewModelArg) _then) =
      __$NutrientSearchVewModelArgCopyWithImpl;
  @override
  @useResult
  $Res call({String intialQuery, List<Nutrient> exceptions});
}

/// @nodoc
class __$NutrientSearchVewModelArgCopyWithImpl<$Res>
    implements _$NutrientSearchVewModelArgCopyWith<$Res> {
  __$NutrientSearchVewModelArgCopyWithImpl(this._self, this._then);

  final _NutrientSearchVewModelArg _self;
  final $Res Function(_NutrientSearchVewModelArg) _then;

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? intialQuery = null,
    Object? exceptions = null,
  }) {
    return _then(_NutrientSearchVewModelArg(
      intialQuery: null == intialQuery
          ? _self.intialQuery
          : intialQuery // ignore: cast_nullable_to_non_nullable
              as String,
      exceptions: null == exceptions
          ? _self._exceptions
          : exceptions // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

// dart format on
