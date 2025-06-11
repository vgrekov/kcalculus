// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_input_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsInputViewModelArg {
  List<NutritionFacts>? get nutritionFacts;
  List<Nutrient> get defaultNutrients;

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsInputViewModelArgCopyWith<NutritionFactsInputViewModelArg>
      get copyWith => _$NutritionFactsInputViewModelArgCopyWithImpl<
              NutritionFactsInputViewModelArg>(
          this as NutritionFactsInputViewModelArg, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFactsInputViewModelArg &&
            const DeepCollectionEquality()
                .equals(other.nutritionFacts, nutritionFacts) &&
            const DeepCollectionEquality()
                .equals(other.defaultNutrients, defaultNutrients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nutritionFacts),
      const DeepCollectionEquality().hash(defaultNutrients));

  @override
  String toString() {
    return 'NutritionFactsInputViewModelArg(nutritionFacts: $nutritionFacts, defaultNutrients: $defaultNutrients)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsInputViewModelArgCopyWith<$Res> {
  factory $NutritionFactsInputViewModelArgCopyWith(
          NutritionFactsInputViewModelArg value,
          $Res Function(NutritionFactsInputViewModelArg) _then) =
      _$NutritionFactsInputViewModelArgCopyWithImpl;
  @useResult
  $Res call(
      {List<NutritionFacts>? nutritionFacts, List<Nutrient> defaultNutrients});
}

/// @nodoc
class _$NutritionFactsInputViewModelArgCopyWithImpl<$Res>
    implements $NutritionFactsInputViewModelArgCopyWith<$Res> {
  _$NutritionFactsInputViewModelArgCopyWithImpl(this._self, this._then);

  final NutritionFactsInputViewModelArg _self;
  final $Res Function(NutritionFactsInputViewModelArg) _then;

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutritionFacts = freezed,
    Object? defaultNutrients = null,
  }) {
    return _then(_self.copyWith(
      nutritionFacts: freezed == nutritionFacts
          ? _self.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>?,
      defaultNutrients: null == defaultNutrients
          ? _self.defaultNutrients
          : defaultNutrients // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

/// @nodoc

class _NutritionFactsInputViewModelArg
    implements NutritionFactsInputViewModelArg {
  const _NutritionFactsInputViewModelArg(
      {final List<NutritionFacts>? nutritionFacts,
      required final List<Nutrient> defaultNutrients})
      : _nutritionFacts = nutritionFacts,
        _defaultNutrients = defaultNutrients;

  final List<NutritionFacts>? _nutritionFacts;
  @override
  List<NutritionFacts>? get nutritionFacts {
    final value = _nutritionFacts;
    if (value == null) return null;
    if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Nutrient> _defaultNutrients;
  @override
  List<Nutrient> get defaultNutrients {
    if (_defaultNutrients is EqualUnmodifiableListView)
      return _defaultNutrients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultNutrients);
  }

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsInputViewModelArgCopyWith<_NutritionFactsInputViewModelArg>
      get copyWith => __$NutritionFactsInputViewModelArgCopyWithImpl<
          _NutritionFactsInputViewModelArg>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFactsInputViewModelArg &&
            const DeepCollectionEquality()
                .equals(other._nutritionFacts, _nutritionFacts) &&
            const DeepCollectionEquality()
                .equals(other._defaultNutrients, _defaultNutrients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nutritionFacts),
      const DeepCollectionEquality().hash(_defaultNutrients));

  @override
  String toString() {
    return 'NutritionFactsInputViewModelArg(nutritionFacts: $nutritionFacts, defaultNutrients: $defaultNutrients)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsInputViewModelArgCopyWith<$Res>
    implements $NutritionFactsInputViewModelArgCopyWith<$Res> {
  factory _$NutritionFactsInputViewModelArgCopyWith(
          _NutritionFactsInputViewModelArg value,
          $Res Function(_NutritionFactsInputViewModelArg) _then) =
      __$NutritionFactsInputViewModelArgCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NutritionFacts>? nutritionFacts, List<Nutrient> defaultNutrients});
}

/// @nodoc
class __$NutritionFactsInputViewModelArgCopyWithImpl<$Res>
    implements _$NutritionFactsInputViewModelArgCopyWith<$Res> {
  __$NutritionFactsInputViewModelArgCopyWithImpl(this._self, this._then);

  final _NutritionFactsInputViewModelArg _self;
  final $Res Function(_NutritionFactsInputViewModelArg) _then;

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nutritionFacts = freezed,
    Object? defaultNutrients = null,
  }) {
    return _then(_NutritionFactsInputViewModelArg(
      nutritionFacts: freezed == nutritionFacts
          ? _self._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>?,
      defaultNutrients: null == defaultNutrients
          ? _self._defaultNutrients
          : defaultNutrients // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

// dart format on
