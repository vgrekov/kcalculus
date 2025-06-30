// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_view_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsViewViewModelArg {
  List<NutritionFacts> get nutritionFacts;
  List<Nutrient> get nutrientDefaults;

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsViewViewModelArgCopyWith<NutritionFactsViewViewModelArg>
      get copyWith => _$NutritionFactsViewViewModelArgCopyWithImpl<
              NutritionFactsViewViewModelArg>(
          this as NutritionFactsViewViewModelArg, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFactsViewViewModelArg &&
            const DeepCollectionEquality()
                .equals(other.nutritionFacts, nutritionFacts) &&
            const DeepCollectionEquality()
                .equals(other.nutrientDefaults, nutrientDefaults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nutritionFacts),
      const DeepCollectionEquality().hash(nutrientDefaults));

  @override
  String toString() {
    return 'NutritionFactsViewViewModelArg(nutritionFacts: $nutritionFacts, nutrientDefaults: $nutrientDefaults)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsViewViewModelArgCopyWith<$Res> {
  factory $NutritionFactsViewViewModelArgCopyWith(
          NutritionFactsViewViewModelArg value,
          $Res Function(NutritionFactsViewViewModelArg) _then) =
      _$NutritionFactsViewViewModelArgCopyWithImpl;
  @useResult
  $Res call(
      {List<NutritionFacts> nutritionFacts, List<Nutrient> nutrientDefaults});
}

/// @nodoc
class _$NutritionFactsViewViewModelArgCopyWithImpl<$Res>
    implements $NutritionFactsViewViewModelArgCopyWith<$Res> {
  _$NutritionFactsViewViewModelArgCopyWithImpl(this._self, this._then);

  final NutritionFactsViewViewModelArg _self;
  final $Res Function(NutritionFactsViewViewModelArg) _then;

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutritionFacts = null,
    Object? nutrientDefaults = null,
  }) {
    return _then(_self.copyWith(
      nutritionFacts: null == nutritionFacts
          ? _self.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>,
      nutrientDefaults: null == nutrientDefaults
          ? _self.nutrientDefaults
          : nutrientDefaults // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

/// @nodoc

class _NutritionFactsViewViewModelArg
    implements NutritionFactsViewViewModelArg {
  const _NutritionFactsViewViewModelArg(
      {required final List<NutritionFacts> nutritionFacts,
      required final List<Nutrient> nutrientDefaults})
      : _nutritionFacts = nutritionFacts,
        _nutrientDefaults = nutrientDefaults;

  final List<NutritionFacts> _nutritionFacts;
  @override
  List<NutritionFacts> get nutritionFacts {
    if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutritionFacts);
  }

  final List<Nutrient> _nutrientDefaults;
  @override
  List<Nutrient> get nutrientDefaults {
    if (_nutrientDefaults is EqualUnmodifiableListView)
      return _nutrientDefaults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrientDefaults);
  }

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsViewViewModelArgCopyWith<_NutritionFactsViewViewModelArg>
      get copyWith => __$NutritionFactsViewViewModelArgCopyWithImpl<
          _NutritionFactsViewViewModelArg>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFactsViewViewModelArg &&
            const DeepCollectionEquality()
                .equals(other._nutritionFacts, _nutritionFacts) &&
            const DeepCollectionEquality()
                .equals(other._nutrientDefaults, _nutrientDefaults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nutritionFacts),
      const DeepCollectionEquality().hash(_nutrientDefaults));

  @override
  String toString() {
    return 'NutritionFactsViewViewModelArg(nutritionFacts: $nutritionFacts, nutrientDefaults: $nutrientDefaults)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsViewViewModelArgCopyWith<$Res>
    implements $NutritionFactsViewViewModelArgCopyWith<$Res> {
  factory _$NutritionFactsViewViewModelArgCopyWith(
          _NutritionFactsViewViewModelArg value,
          $Res Function(_NutritionFactsViewViewModelArg) _then) =
      __$NutritionFactsViewViewModelArgCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NutritionFacts> nutritionFacts, List<Nutrient> nutrientDefaults});
}

/// @nodoc
class __$NutritionFactsViewViewModelArgCopyWithImpl<$Res>
    implements _$NutritionFactsViewViewModelArgCopyWith<$Res> {
  __$NutritionFactsViewViewModelArgCopyWithImpl(this._self, this._then);

  final _NutritionFactsViewViewModelArg _self;
  final $Res Function(_NutritionFactsViewViewModelArg) _then;

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nutritionFacts = null,
    Object? nutrientDefaults = null,
  }) {
    return _then(_NutritionFactsViewViewModelArg(
      nutritionFacts: null == nutritionFacts
          ? _self._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>,
      nutrientDefaults: null == nutrientDefaults
          ? _self._nutrientDefaults
          : nutrientDefaults // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

// dart format on
