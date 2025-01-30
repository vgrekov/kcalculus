// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_save_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodSaveUiState {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<NutritionFacts>? get nutritionFacts =>
      throw _privateConstructorUsedError;

  /// Create a copy of FoodSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodSaveUiStateCopyWith<FoodSaveUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodSaveUiStateCopyWith<$Res> {
  factory $FoodSaveUiStateCopyWith(
          FoodSaveUiState value, $Res Function(FoodSaveUiState) then) =
      _$FoodSaveUiStateCopyWithImpl<$Res, FoodSaveUiState>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      List<NutritionFacts>? nutritionFacts});
}

/// @nodoc
class _$FoodSaveUiStateCopyWithImpl<$Res, $Val extends FoodSaveUiState>
    implements $FoodSaveUiStateCopyWith<$Res> {
  _$FoodSaveUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? nutritionFacts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionFacts: freezed == nutritionFacts
          ? _value.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodSaveUiStateImplCopyWith<$Res>
    implements $FoodSaveUiStateCopyWith<$Res> {
  factory _$$FoodSaveUiStateImplCopyWith(_$FoodSaveUiStateImpl value,
          $Res Function(_$FoodSaveUiStateImpl) then) =
      __$$FoodSaveUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      List<NutritionFacts>? nutritionFacts});
}

/// @nodoc
class __$$FoodSaveUiStateImplCopyWithImpl<$Res>
    extends _$FoodSaveUiStateCopyWithImpl<$Res, _$FoodSaveUiStateImpl>
    implements _$$FoodSaveUiStateImplCopyWith<$Res> {
  __$$FoodSaveUiStateImplCopyWithImpl(
      _$FoodSaveUiStateImpl _value, $Res Function(_$FoodSaveUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? nutritionFacts = freezed,
  }) {
    return _then(_$FoodSaveUiStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionFacts: freezed == nutritionFacts
          ? _value._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>?,
    ));
  }
}

/// @nodoc

class _$FoodSaveUiStateImpl implements _FoodSaveUiState {
  const _$FoodSaveUiStateImpl(
      {this.id,
      this.name = '',
      this.description = '',
      final List<NutritionFacts>? nutritionFacts})
      : _nutritionFacts = nutritionFacts;

  @override
  final String? id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
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
    return 'FoodSaveUiState(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodSaveUiStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._nutritionFacts, _nutritionFacts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_nutritionFacts));

  /// Create a copy of FoodSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodSaveUiStateImplCopyWith<_$FoodSaveUiStateImpl> get copyWith =>
      __$$FoodSaveUiStateImplCopyWithImpl<_$FoodSaveUiStateImpl>(
          this, _$identity);
}

abstract class _FoodSaveUiState implements FoodSaveUiState {
  const factory _FoodSaveUiState(
      {final String? id,
      final String name,
      final String description,
      final List<NutritionFacts>? nutritionFacts}) = _$FoodSaveUiStateImpl;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<NutritionFacts>? get nutritionFacts;

  /// Create a copy of FoodSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodSaveUiStateImplCopyWith<_$FoodSaveUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
