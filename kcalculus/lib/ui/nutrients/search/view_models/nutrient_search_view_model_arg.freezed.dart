// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_search_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutrientSearchViewModelArg {
  String get intialQuery => throw _privateConstructorUsedError;
  List<Nutrient> get exceptions => throw _privateConstructorUsedError;

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientSearchViewModelArgCopyWith<NutrientSearchViewModelArg>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientSearchViewModelArgCopyWith<$Res> {
  factory $NutrientSearchViewModelArgCopyWith(NutrientSearchViewModelArg value,
          $Res Function(NutrientSearchViewModelArg) then) =
      _$NutrientSearchViewModelArgCopyWithImpl<$Res,
          NutrientSearchViewModelArg>;
  @useResult
  $Res call({String intialQuery, List<Nutrient> exceptions});
}

/// @nodoc
class _$NutrientSearchViewModelArgCopyWithImpl<$Res,
        $Val extends NutrientSearchViewModelArg>
    implements $NutrientSearchViewModelArgCopyWith<$Res> {
  _$NutrientSearchViewModelArgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intialQuery = null,
    Object? exceptions = null,
  }) {
    return _then(_value.copyWith(
      intialQuery: null == intialQuery
          ? _value.intialQuery
          : intialQuery // ignore: cast_nullable_to_non_nullable
              as String,
      exceptions: null == exceptions
          ? _value.exceptions
          : exceptions // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutrientSearchVewModelArgImplCopyWith<$Res>
    implements $NutrientSearchViewModelArgCopyWith<$Res> {
  factory _$$NutrientSearchVewModelArgImplCopyWith(
          _$NutrientSearchVewModelArgImpl value,
          $Res Function(_$NutrientSearchVewModelArgImpl) then) =
      __$$NutrientSearchVewModelArgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String intialQuery, List<Nutrient> exceptions});
}

/// @nodoc
class __$$NutrientSearchVewModelArgImplCopyWithImpl<$Res>
    extends _$NutrientSearchViewModelArgCopyWithImpl<$Res,
        _$NutrientSearchVewModelArgImpl>
    implements _$$NutrientSearchVewModelArgImplCopyWith<$Res> {
  __$$NutrientSearchVewModelArgImplCopyWithImpl(
      _$NutrientSearchVewModelArgImpl _value,
      $Res Function(_$NutrientSearchVewModelArgImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intialQuery = null,
    Object? exceptions = null,
  }) {
    return _then(_$NutrientSearchVewModelArgImpl(
      intialQuery: null == intialQuery
          ? _value.intialQuery
          : intialQuery // ignore: cast_nullable_to_non_nullable
              as String,
      exceptions: null == exceptions
          ? _value._exceptions
          : exceptions // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

/// @nodoc

class _$NutrientSearchVewModelArgImpl implements _NutrientSearchVewModelArg {
  const _$NutrientSearchVewModelArgImpl(
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

  @override
  String toString() {
    return 'NutrientSearchViewModelArg(intialQuery: $intialQuery, exceptions: $exceptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientSearchVewModelArgImpl &&
            (identical(other.intialQuery, intialQuery) ||
                other.intialQuery == intialQuery) &&
            const DeepCollectionEquality()
                .equals(other._exceptions, _exceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, intialQuery,
      const DeepCollectionEquality().hash(_exceptions));

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientSearchVewModelArgImplCopyWith<_$NutrientSearchVewModelArgImpl>
      get copyWith => __$$NutrientSearchVewModelArgImplCopyWithImpl<
          _$NutrientSearchVewModelArgImpl>(this, _$identity);
}

abstract class _NutrientSearchVewModelArg
    implements NutrientSearchViewModelArg {
  const factory _NutrientSearchVewModelArg(
      {final String intialQuery,
      final List<Nutrient> exceptions}) = _$NutrientSearchVewModelArgImpl;

  @override
  String get intialQuery;
  @override
  List<Nutrient> get exceptions;

  /// Create a copy of NutrientSearchViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientSearchVewModelArgImplCopyWith<_$NutrientSearchVewModelArgImpl>
      get copyWith => throw _privateConstructorUsedError;
}
