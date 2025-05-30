// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_input_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutritionFactsInputViewModelArg {
  List<NutritionFacts>? get nutritionFacts =>
      throw _privateConstructorUsedError;
  List<Nutrient> get defaultNutrients => throw _privateConstructorUsedError;

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsInputViewModelArgCopyWith<NutritionFactsInputViewModelArg>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsInputViewModelArgCopyWith<$Res> {
  factory $NutritionFactsInputViewModelArgCopyWith(
          NutritionFactsInputViewModelArg value,
          $Res Function(NutritionFactsInputViewModelArg) then) =
      _$NutritionFactsInputViewModelArgCopyWithImpl<$Res,
          NutritionFactsInputViewModelArg>;
  @useResult
  $Res call(
      {List<NutritionFacts>? nutritionFacts, List<Nutrient> defaultNutrients});
}

/// @nodoc
class _$NutritionFactsInputViewModelArgCopyWithImpl<$Res,
        $Val extends NutritionFactsInputViewModelArg>
    implements $NutritionFactsInputViewModelArgCopyWith<$Res> {
  _$NutritionFactsInputViewModelArgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutritionFacts = freezed,
    Object? defaultNutrients = null,
  }) {
    return _then(_value.copyWith(
      nutritionFacts: freezed == nutritionFacts
          ? _value.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>?,
      defaultNutrients: null == defaultNutrients
          ? _value.defaultNutrients
          : defaultNutrients // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionFactsInputViewModelArgImplCopyWith<$Res>
    implements $NutritionFactsInputViewModelArgCopyWith<$Res> {
  factory _$$NutritionFactsInputViewModelArgImplCopyWith(
          _$NutritionFactsInputViewModelArgImpl value,
          $Res Function(_$NutritionFactsInputViewModelArgImpl) then) =
      __$$NutritionFactsInputViewModelArgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NutritionFacts>? nutritionFacts, List<Nutrient> defaultNutrients});
}

/// @nodoc
class __$$NutritionFactsInputViewModelArgImplCopyWithImpl<$Res>
    extends _$NutritionFactsInputViewModelArgCopyWithImpl<$Res,
        _$NutritionFactsInputViewModelArgImpl>
    implements _$$NutritionFactsInputViewModelArgImplCopyWith<$Res> {
  __$$NutritionFactsInputViewModelArgImplCopyWithImpl(
      _$NutritionFactsInputViewModelArgImpl _value,
      $Res Function(_$NutritionFactsInputViewModelArgImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutritionFacts = freezed,
    Object? defaultNutrients = null,
  }) {
    return _then(_$NutritionFactsInputViewModelArgImpl(
      nutritionFacts: freezed == nutritionFacts
          ? _value._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>?,
      defaultNutrients: null == defaultNutrients
          ? _value._defaultNutrients
          : defaultNutrients // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

/// @nodoc

class _$NutritionFactsInputViewModelArgImpl
    implements _NutritionFactsInputViewModelArg {
  const _$NutritionFactsInputViewModelArgImpl(
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

  @override
  String toString() {
    return 'NutritionFactsInputViewModelArg(nutritionFacts: $nutritionFacts, defaultNutrients: $defaultNutrients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsInputViewModelArgImpl &&
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

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsInputViewModelArgImplCopyWith<
          _$NutritionFactsInputViewModelArgImpl>
      get copyWith => __$$NutritionFactsInputViewModelArgImplCopyWithImpl<
          _$NutritionFactsInputViewModelArgImpl>(this, _$identity);
}

abstract class _NutritionFactsInputViewModelArg
    implements NutritionFactsInputViewModelArg {
  const factory _NutritionFactsInputViewModelArg(
          {final List<NutritionFacts>? nutritionFacts,
          required final List<Nutrient> defaultNutrients}) =
      _$NutritionFactsInputViewModelArgImpl;

  @override
  List<NutritionFacts>? get nutritionFacts;
  @override
  List<Nutrient> get defaultNutrients;

  /// Create a copy of NutritionFactsInputViewModelArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsInputViewModelArgImplCopyWith<
          _$NutritionFactsInputViewModelArgImpl>
      get copyWith => throw _privateConstructorUsedError;
}
