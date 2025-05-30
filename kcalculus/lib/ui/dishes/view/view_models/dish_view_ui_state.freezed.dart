// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_view_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DishViewUiState {
  Dish get dish => throw _privateConstructorUsedError;
  List<Nutrient> get nutrientDefaults => throw _privateConstructorUsedError;

  /// Create a copy of DishViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DishViewUiStateCopyWith<DishViewUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishViewUiStateCopyWith<$Res> {
  factory $DishViewUiStateCopyWith(
          DishViewUiState value, $Res Function(DishViewUiState) then) =
      _$DishViewUiStateCopyWithImpl<$Res, DishViewUiState>;
  @useResult
  $Res call({Dish dish, List<Nutrient> nutrientDefaults});

  $DishCopyWith<$Res> get dish;
}

/// @nodoc
class _$DishViewUiStateCopyWithImpl<$Res, $Val extends DishViewUiState>
    implements $DishViewUiStateCopyWith<$Res> {
  _$DishViewUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DishViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dish = null,
    Object? nutrientDefaults = null,
  }) {
    return _then(_value.copyWith(
      dish: null == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as Dish,
      nutrientDefaults: null == nutrientDefaults
          ? _value.nutrientDefaults
          : nutrientDefaults // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ) as $Val);
  }

  /// Create a copy of DishViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DishCopyWith<$Res> get dish {
    return $DishCopyWith<$Res>(_value.dish, (value) {
      return _then(_value.copyWith(dish: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DishViewUiStateImplCopyWith<$Res>
    implements $DishViewUiStateCopyWith<$Res> {
  factory _$$DishViewUiStateImplCopyWith(_$DishViewUiStateImpl value,
          $Res Function(_$DishViewUiStateImpl) then) =
      __$$DishViewUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Dish dish, List<Nutrient> nutrientDefaults});

  @override
  $DishCopyWith<$Res> get dish;
}

/// @nodoc
class __$$DishViewUiStateImplCopyWithImpl<$Res>
    extends _$DishViewUiStateCopyWithImpl<$Res, _$DishViewUiStateImpl>
    implements _$$DishViewUiStateImplCopyWith<$Res> {
  __$$DishViewUiStateImplCopyWithImpl(
      _$DishViewUiStateImpl _value, $Res Function(_$DishViewUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DishViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dish = null,
    Object? nutrientDefaults = null,
  }) {
    return _then(_$DishViewUiStateImpl(
      dish: null == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as Dish,
      nutrientDefaults: null == nutrientDefaults
          ? _value._nutrientDefaults
          : nutrientDefaults // ignore: cast_nullable_to_non_nullable
              as List<Nutrient>,
    ));
  }
}

/// @nodoc

class _$DishViewUiStateImpl implements _DishViewUiState {
  const _$DishViewUiStateImpl(
      {required this.dish, required final List<Nutrient> nutrientDefaults})
      : _nutrientDefaults = nutrientDefaults;

  @override
  final Dish dish;
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
    return 'DishViewUiState(dish: $dish, nutrientDefaults: $nutrientDefaults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishViewUiStateImpl &&
            (identical(other.dish, dish) || other.dish == dish) &&
            const DeepCollectionEquality()
                .equals(other._nutrientDefaults, _nutrientDefaults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dish,
      const DeepCollectionEquality().hash(_nutrientDefaults));

  /// Create a copy of DishViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DishViewUiStateImplCopyWith<_$DishViewUiStateImpl> get copyWith =>
      __$$DishViewUiStateImplCopyWithImpl<_$DishViewUiStateImpl>(
          this, _$identity);
}

abstract class _DishViewUiState implements DishViewUiState {
  const factory _DishViewUiState(
      {required final Dish dish,
      required final List<Nutrient> nutrientDefaults}) = _$DishViewUiStateImpl;

  @override
  Dish get dish;
  @override
  List<Nutrient> get nutrientDefaults;

  /// Create a copy of DishViewUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DishViewUiStateImplCopyWith<_$DishViewUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
