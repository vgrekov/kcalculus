// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portion_add_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PortionAddUiState {
  Edible? get selectedEdible => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Unit? get amountUnit => throw _privateConstructorUsedError;
  double? get amountValue => throw _privateConstructorUsedError;
  List<NutritionFacts>? get nutritionFacts =>
      throw _privateConstructorUsedError;

  /// Create a copy of PortionAddUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortionAddUiStateCopyWith<PortionAddUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortionAddUiStateCopyWith<$Res> {
  factory $PortionAddUiStateCopyWith(
          PortionAddUiState value, $Res Function(PortionAddUiState) then) =
      _$PortionAddUiStateCopyWithImpl<$Res, PortionAddUiState>;
  @useResult
  $Res call(
      {Edible? selectedEdible,
      String name,
      String description,
      Unit? amountUnit,
      double? amountValue,
      List<NutritionFacts>? nutritionFacts});
}

/// @nodoc
class _$PortionAddUiStateCopyWithImpl<$Res, $Val extends PortionAddUiState>
    implements $PortionAddUiStateCopyWith<$Res> {
  _$PortionAddUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortionAddUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedEdible = freezed,
    Object? name = null,
    Object? description = null,
    Object? amountUnit = freezed,
    Object? amountValue = freezed,
    Object? nutritionFacts = freezed,
  }) {
    return _then(_value.copyWith(
      selectedEdible: freezed == selectedEdible
          ? _value.selectedEdible
          : selectedEdible // ignore: cast_nullable_to_non_nullable
              as Edible?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amountUnit: freezed == amountUnit
          ? _value.amountUnit
          : amountUnit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      amountValue: freezed == amountValue
          ? _value.amountValue
          : amountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      nutritionFacts: freezed == nutritionFacts
          ? _value.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortionAddUiStateImplCopyWith<$Res>
    implements $PortionAddUiStateCopyWith<$Res> {
  factory _$$PortionAddUiStateImplCopyWith(_$PortionAddUiStateImpl value,
          $Res Function(_$PortionAddUiStateImpl) then) =
      __$$PortionAddUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Edible? selectedEdible,
      String name,
      String description,
      Unit? amountUnit,
      double? amountValue,
      List<NutritionFacts>? nutritionFacts});
}

/// @nodoc
class __$$PortionAddUiStateImplCopyWithImpl<$Res>
    extends _$PortionAddUiStateCopyWithImpl<$Res, _$PortionAddUiStateImpl>
    implements _$$PortionAddUiStateImplCopyWith<$Res> {
  __$$PortionAddUiStateImplCopyWithImpl(_$PortionAddUiStateImpl _value,
      $Res Function(_$PortionAddUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PortionAddUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedEdible = freezed,
    Object? name = null,
    Object? description = null,
    Object? amountUnit = freezed,
    Object? amountValue = freezed,
    Object? nutritionFacts = freezed,
  }) {
    return _then(_$PortionAddUiStateImpl(
      selectedEdible: freezed == selectedEdible
          ? _value.selectedEdible
          : selectedEdible // ignore: cast_nullable_to_non_nullable
              as Edible?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amountUnit: freezed == amountUnit
          ? _value.amountUnit
          : amountUnit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      amountValue: freezed == amountValue
          ? _value.amountValue
          : amountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      nutritionFacts: freezed == nutritionFacts
          ? _value._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>?,
    ));
  }
}

/// @nodoc

class _$PortionAddUiStateImpl extends _PortionAddUiState {
  const _$PortionAddUiStateImpl(
      {this.selectedEdible,
      this.name = '',
      this.description = '',
      this.amountUnit = Unit.gram,
      this.amountValue,
      final List<NutritionFacts>? nutritionFacts})
      : _nutritionFacts = nutritionFacts,
        super._();

  @override
  final Edible? selectedEdible;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final Unit? amountUnit;
  @override
  final double? amountValue;
  final List<NutritionFacts>? _nutritionFacts;
  @override
  List<NutritionFacts>? get nutritionFacts {
    final value = _nutritionFacts;
    if (value == null) return null;
    if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PortionAddUiState(selectedEdible: $selectedEdible, name: $name, description: $description, amountUnit: $amountUnit, amountValue: $amountValue, nutritionFacts: $nutritionFacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortionAddUiStateImpl &&
            (identical(other.selectedEdible, selectedEdible) ||
                other.selectedEdible == selectedEdible) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amountUnit, amountUnit) ||
                other.amountUnit == amountUnit) &&
            (identical(other.amountValue, amountValue) ||
                other.amountValue == amountValue) &&
            const DeepCollectionEquality()
                .equals(other._nutritionFacts, _nutritionFacts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedEdible,
      name,
      description,
      amountUnit,
      amountValue,
      const DeepCollectionEquality().hash(_nutritionFacts));

  /// Create a copy of PortionAddUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortionAddUiStateImplCopyWith<_$PortionAddUiStateImpl> get copyWith =>
      __$$PortionAddUiStateImplCopyWithImpl<_$PortionAddUiStateImpl>(
          this, _$identity);
}

abstract class _PortionAddUiState extends PortionAddUiState {
  const factory _PortionAddUiState(
      {final Edible? selectedEdible,
      final String name,
      final String description,
      final Unit? amountUnit,
      final double? amountValue,
      final List<NutritionFacts>? nutritionFacts}) = _$PortionAddUiStateImpl;
  const _PortionAddUiState._() : super._();

  @override
  Edible? get selectedEdible;
  @override
  String get name;
  @override
  String get description;
  @override
  Unit? get amountUnit;
  @override
  double? get amountValue;
  @override
  List<NutritionFacts>? get nutritionFacts;

  /// Create a copy of PortionAddUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortionAddUiStateImplCopyWith<_$PortionAddUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
