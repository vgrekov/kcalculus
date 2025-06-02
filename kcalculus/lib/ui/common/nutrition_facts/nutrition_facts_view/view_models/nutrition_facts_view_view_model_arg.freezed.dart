// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_view_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutritionFactsViewViewModelArg {
  List<NutritionFacts> get nutritionFacts => throw _privateConstructorUsedError;
  List<Nutrient> get nutrientDefaults => throw _privateConstructorUsedError;

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsViewViewModelArgCopyWith<NutritionFactsViewViewModelArg>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsViewViewModelArgCopyWith<$Res> {
  factory $NutritionFactsViewViewModelArgCopyWith(
          NutritionFactsViewViewModelArg value,
          $Res Function(NutritionFactsViewViewModelArg) then) =
      _$NutritionFactsViewViewModelArgCopyWithImpl<$Res,
          NutritionFactsViewViewModelArg>;
  @useResult
  $Res call(
      {List<NutritionFacts> nutritionFacts, List<Nutrient> nutrientDefaults});
}

/// @nodoc
class _$NutritionFactsViewViewModelArgCopyWithImpl<$Res,
        $Val extends NutritionFactsViewViewModelArg>
    implements $NutritionFactsViewViewModelArgCopyWith<$Res> {
  _$NutritionFactsViewViewModelArgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutritionFacts = null,
    Object? nutrientDefaults = null,
  }) {
    return _then(_value.copyWith(
      nutritionFacts: null == nutritionFacts
          ? _value.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>,
      nutrientDefaults: null == nutrientDefaults
          ? _value.nutrientDefaults
          : nutrientDefaults // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionFactsViewViewModelArgImplCopyWith<$Res>
    implements $NutritionFactsViewViewModelArgCopyWith<$Res> {
  factory _$$NutritionFactsViewViewModelArgImplCopyWith(
          _$NutritionFactsViewViewModelArgImpl value,
          $Res Function(_$NutritionFactsViewViewModelArgImpl) then) =
      __$$NutritionFactsViewViewModelArgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NutritionFacts> nutritionFacts, List<Nutrient> nutrientDefaults});
}

/// @nodoc
class __$$NutritionFactsViewViewModelArgImplCopyWithImpl<$Res>
    extends _$NutritionFactsViewViewModelArgCopyWithImpl<$Res,
        _$NutritionFactsViewViewModelArgImpl>
    implements _$$NutritionFactsViewViewModelArgImplCopyWith<$Res> {
  __$$NutritionFactsViewViewModelArgImplCopyWithImpl(
      _$NutritionFactsViewViewModelArgImpl _value,
      $Res Function(_$NutritionFactsViewViewModelArgImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutritionFacts = null,
    Object? nutrientDefaults = null,
  }) {
    return _then(_$NutritionFactsViewViewModelArgImpl(
      nutritionFacts: null == nutritionFacts
          ? _value._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>,
      nutrientDefaults: null == nutrientDefaults
          ? _value._nutrientDefaults
          : nutrientDefaults // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

/// @nodoc

class _$NutritionFactsViewViewModelArgImpl
    implements _NutritionFactsViewViewModelArg {
  const _$NutritionFactsViewViewModelArgImpl(
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

  @override
  String toString() {
    return 'NutritionFactsViewViewModelArg(nutritionFacts: $nutritionFacts, nutrientDefaults: $nutrientDefaults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsViewViewModelArgImpl &&
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

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsViewViewModelArgImplCopyWith<
          _$NutritionFactsViewViewModelArgImpl>
      get copyWith => __$$NutritionFactsViewViewModelArgImplCopyWithImpl<
          _$NutritionFactsViewViewModelArgImpl>(this, _$identity);
}

abstract class _NutritionFactsViewViewModelArg
    implements NutritionFactsViewViewModelArg {
  const factory _NutritionFactsViewViewModelArg(
          {required final List<NutritionFacts> nutritionFacts,
          required final List<Nutrient> nutrientDefaults}) =
      _$NutritionFactsViewViewModelArgImpl;

  @override
  List<NutritionFacts> get nutritionFacts;
  @override
  List<Nutrient> get nutrientDefaults;

  /// Create a copy of NutritionFactsViewViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsViewViewModelArgImplCopyWith<
          _$NutritionFactsViewViewModelArgImpl>
      get copyWith => throw _privateConstructorUsedError;
}
