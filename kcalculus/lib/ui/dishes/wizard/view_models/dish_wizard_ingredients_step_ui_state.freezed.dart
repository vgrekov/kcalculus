// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_wizard_ingredients_step_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DishWizardIngredientsStepUiState {
  List<Ingredient> get ingredients;

  /// Create a copy of DishWizardIngredientsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DishWizardIngredientsStepUiStateCopyWith<DishWizardIngredientsStepUiState>
      get copyWith => _$DishWizardIngredientsStepUiStateCopyWithImpl<
              DishWizardIngredientsStepUiState>(
          this as DishWizardIngredientsStepUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DishWizardIngredientsStepUiState &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(ingredients));

  @override
  String toString() {
    return 'DishWizardIngredientsStepUiState(ingredients: $ingredients)';
  }
}

/// @nodoc
abstract mixin class $DishWizardIngredientsStepUiStateCopyWith<$Res> {
  factory $DishWizardIngredientsStepUiStateCopyWith(
          DishWizardIngredientsStepUiState value,
          $Res Function(DishWizardIngredientsStepUiState) _then) =
      _$DishWizardIngredientsStepUiStateCopyWithImpl;
  @useResult
  $Res call({List<Ingredient> ingredients});
}

/// @nodoc
class _$DishWizardIngredientsStepUiStateCopyWithImpl<$Res>
    implements $DishWizardIngredientsStepUiStateCopyWith<$Res> {
  _$DishWizardIngredientsStepUiStateCopyWithImpl(this._self, this._then);

  final DishWizardIngredientsStepUiState _self;
  final $Res Function(DishWizardIngredientsStepUiState) _then;

  /// Create a copy of DishWizardIngredientsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_self.copyWith(
      ingredients: null == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc

class _DishWizardIngredientsStepUiState
    extends DishWizardIngredientsStepUiState {
  const _DishWizardIngredientsStepUiState(
      {final List<Ingredient> ingredients = const []})
      : _ingredients = ingredients,
        super._();

  final List<Ingredient> _ingredients;
  @override
  @JsonKey()
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  /// Create a copy of DishWizardIngredientsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DishWizardIngredientsStepUiStateCopyWith<_DishWizardIngredientsStepUiState>
      get copyWith => __$DishWizardIngredientsStepUiStateCopyWithImpl<
          _DishWizardIngredientsStepUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DishWizardIngredientsStepUiState &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredients));

  @override
  String toString() {
    return 'DishWizardIngredientsStepUiState(ingredients: $ingredients)';
  }
}

/// @nodoc
abstract mixin class _$DishWizardIngredientsStepUiStateCopyWith<$Res>
    implements $DishWizardIngredientsStepUiStateCopyWith<$Res> {
  factory _$DishWizardIngredientsStepUiStateCopyWith(
          _DishWizardIngredientsStepUiState value,
          $Res Function(_DishWizardIngredientsStepUiState) _then) =
      __$DishWizardIngredientsStepUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Ingredient> ingredients});
}

/// @nodoc
class __$DishWizardIngredientsStepUiStateCopyWithImpl<$Res>
    implements _$DishWizardIngredientsStepUiStateCopyWith<$Res> {
  __$DishWizardIngredientsStepUiStateCopyWithImpl(this._self, this._then);

  final _DishWizardIngredientsStepUiState _self;
  final $Res Function(_DishWizardIngredientsStepUiState) _then;

  /// Create a copy of DishWizardIngredientsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_DishWizardIngredientsStepUiState(
      ingredients: null == ingredients
          ? _self._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

// dart format on
