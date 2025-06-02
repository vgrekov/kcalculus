// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_view_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodViewUiState {
  Food get food => throw _privateConstructorUsedError;
  List<Nutrient> get nutrientDefaults => throw _privateConstructorUsedError;

  /// Create a copy of FoodViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodViewUiStateCopyWith<FoodViewUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodViewUiStateCopyWith<$Res> {
  factory $FoodViewUiStateCopyWith(
          FoodViewUiState value, $Res Function(FoodViewUiState) then) =
      _$FoodViewUiStateCopyWithImpl<$Res, FoodViewUiState>;
  @useResult
  $Res call({Food food, List<Nutrient> nutrientDefaults});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class _$FoodViewUiStateCopyWithImpl<$Res, $Val extends FoodViewUiState>
    implements $FoodViewUiStateCopyWith<$Res> {
  _$FoodViewUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
    Object? nutrientDefaults = null,
  }) {
    return _then(_value.copyWith(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
      nutrientDefaults: null == nutrientDefaults
          ? _value.nutrientDefaults
          : nutrientDefaults // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ) as $Val);
  }

  /// Create a copy of FoodViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodCopyWith<$Res> get food {
    return $FoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodViewUiStateImplCopyWith<$Res>
    implements $FoodViewUiStateCopyWith<$Res> {
  factory _$$FoodViewUiStateImplCopyWith(_$FoodViewUiStateImpl value,
          $Res Function(_$FoodViewUiStateImpl) then) =
      __$$FoodViewUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Food food, List<Nutrient> nutrientDefaults});

  @override
  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$FoodViewUiStateImplCopyWithImpl<$Res>
    extends _$FoodViewUiStateCopyWithImpl<$Res, _$FoodViewUiStateImpl>
    implements _$$FoodViewUiStateImplCopyWith<$Res> {
  __$$FoodViewUiStateImplCopyWithImpl(
      _$FoodViewUiStateImpl _value, $Res Function(_$FoodViewUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
    Object? nutrientDefaults = null,
  }) {
    return _then(_$FoodViewUiStateImpl(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
      nutrientDefaults: null == nutrientDefaults
          ? _value._nutrientDefaults
          : nutrientDefaults // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

/// @nodoc

class _$FoodViewUiStateImpl implements _FoodViewUiState {
  const _$FoodViewUiStateImpl(
      {required this.food, required final List<Nutrient> nutrientDefaults})
      : _nutrientDefaults = nutrientDefaults;

  @override
  final Food food;
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
    return 'FoodViewUiState(food: $food, nutrientDefaults: $nutrientDefaults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodViewUiStateImpl &&
            (identical(other.food, food) || other.food == food) &&
            const DeepCollectionEquality()
                .equals(other._nutrientDefaults, _nutrientDefaults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food,
      const DeepCollectionEquality().hash(_nutrientDefaults));

  /// Create a copy of FoodViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodViewUiStateImplCopyWith<_$FoodViewUiStateImpl> get copyWith =>
      __$$FoodViewUiStateImplCopyWithImpl<_$FoodViewUiStateImpl>(
          this, _$identity);
}

abstract class _FoodViewUiState implements FoodViewUiState {
  const factory _FoodViewUiState(
      {required final Food food,
      required final List<Nutrient> nutrientDefaults}) = _$FoodViewUiStateImpl;

  @override
  Food get food;
  @override
  List<Nutrient> get nutrientDefaults;

  /// Create a copy of FoodViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodViewUiStateImplCopyWith<_$FoodViewUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
