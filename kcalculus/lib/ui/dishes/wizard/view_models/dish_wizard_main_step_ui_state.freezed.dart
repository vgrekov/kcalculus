// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_wizard_main_step_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DishWizardMainStepUiState {
  String get name;
  String get description;

  /// Create a copy of DishWizardMainStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DishWizardMainStepUiStateCopyWith<DishWizardMainStepUiState> get copyWith =>
      _$DishWizardMainStepUiStateCopyWithImpl<DishWizardMainStepUiState>(
          this as DishWizardMainStepUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DishWizardMainStepUiState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  @override
  String toString() {
    return 'DishWizardMainStepUiState(name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class $DishWizardMainStepUiStateCopyWith<$Res> {
  factory $DishWizardMainStepUiStateCopyWith(DishWizardMainStepUiState value,
          $Res Function(DishWizardMainStepUiState) _then) =
      _$DishWizardMainStepUiStateCopyWithImpl;
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class _$DishWizardMainStepUiStateCopyWithImpl<$Res>
    implements $DishWizardMainStepUiStateCopyWith<$Res> {
  _$DishWizardMainStepUiStateCopyWithImpl(this._self, this._then);

  final DishWizardMainStepUiState _self;
  final $Res Function(DishWizardMainStepUiState) _then;

  /// Create a copy of DishWizardMainStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _DishWizardMainStepUiState extends DishWizardMainStepUiState {
  const _DishWizardMainStepUiState({this.name = '', this.description = ''})
      : super._();

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;

  /// Create a copy of DishWizardMainStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DishWizardMainStepUiStateCopyWith<_DishWizardMainStepUiState>
      get copyWith =>
          __$DishWizardMainStepUiStateCopyWithImpl<_DishWizardMainStepUiState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DishWizardMainStepUiState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  @override
  String toString() {
    return 'DishWizardMainStepUiState(name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$DishWizardMainStepUiStateCopyWith<$Res>
    implements $DishWizardMainStepUiStateCopyWith<$Res> {
  factory _$DishWizardMainStepUiStateCopyWith(_DishWizardMainStepUiState value,
          $Res Function(_DishWizardMainStepUiState) _then) =
      __$DishWizardMainStepUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class __$DishWizardMainStepUiStateCopyWithImpl<$Res>
    implements _$DishWizardMainStepUiStateCopyWith<$Res> {
  __$DishWizardMainStepUiStateCopyWithImpl(this._self, this._then);

  final _DishWizardMainStepUiState _self;
  final $Res Function(_DishWizardMainStepUiState) _then;

  /// Create a copy of DishWizardMainStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_DishWizardMainStepUiState(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
