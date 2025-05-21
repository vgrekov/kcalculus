// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_container_save_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodContainerSaveUiState {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Unit get weightUnit => throw _privateConstructorUsedError;
  double? get weightValue => throw _privateConstructorUsedError;

  /// Create a copy of FoodContainerSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodContainerSaveUiStateCopyWith<FoodContainerSaveUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodContainerSaveUiStateCopyWith<$Res> {
  factory $FoodContainerSaveUiStateCopyWith(FoodContainerSaveUiState value,
          $Res Function(FoodContainerSaveUiState) then) =
      _$FoodContainerSaveUiStateCopyWithImpl<$Res, FoodContainerSaveUiState>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      Unit weightUnit,
      double? weightValue});
}

/// @nodoc
class _$FoodContainerSaveUiStateCopyWithImpl<$Res,
        $Val extends FoodContainerSaveUiState>
    implements $FoodContainerSaveUiStateCopyWith<$Res> {
  _$FoodContainerSaveUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodContainerSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? weightUnit = null,
    Object? weightValue = freezed,
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
      weightUnit: null == weightUnit
          ? _value.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as Unit,
      weightValue: freezed == weightValue
          ? _value.weightValue
          : weightValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodContainerSaveUiStateImplCopyWith<$Res>
    implements $FoodContainerSaveUiStateCopyWith<$Res> {
  factory _$$FoodContainerSaveUiStateImplCopyWith(
          _$FoodContainerSaveUiStateImpl value,
          $Res Function(_$FoodContainerSaveUiStateImpl) then) =
      __$$FoodContainerSaveUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      Unit weightUnit,
      double? weightValue});
}

/// @nodoc
class __$$FoodContainerSaveUiStateImplCopyWithImpl<$Res>
    extends _$FoodContainerSaveUiStateCopyWithImpl<$Res,
        _$FoodContainerSaveUiStateImpl>
    implements _$$FoodContainerSaveUiStateImplCopyWith<$Res> {
  __$$FoodContainerSaveUiStateImplCopyWithImpl(
      _$FoodContainerSaveUiStateImpl _value,
      $Res Function(_$FoodContainerSaveUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodContainerSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? weightUnit = null,
    Object? weightValue = freezed,
  }) {
    return _then(_$FoodContainerSaveUiStateImpl(
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
      weightUnit: null == weightUnit
          ? _value.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as Unit,
      weightValue: freezed == weightValue
          ? _value.weightValue
          : weightValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$FoodContainerSaveUiStateImpl extends _FoodContainerSaveUiState {
  const _$FoodContainerSaveUiStateImpl(
      {this.id,
      this.name = '',
      this.description = '',
      this.weightUnit = Unit.gram,
      this.weightValue})
      : super._();

  @override
  final String? id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final Unit weightUnit;
  @override
  final double? weightValue;

  @override
  String toString() {
    return 'FoodContainerSaveUiState(id: $id, name: $name, description: $description, weightUnit: $weightUnit, weightValue: $weightValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodContainerSaveUiStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weightUnit, weightUnit) ||
                other.weightUnit == weightUnit) &&
            (identical(other.weightValue, weightValue) ||
                other.weightValue == weightValue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, weightUnit, weightValue);

  /// Create a copy of FoodContainerSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodContainerSaveUiStateImplCopyWith<_$FoodContainerSaveUiStateImpl>
      get copyWith => __$$FoodContainerSaveUiStateImplCopyWithImpl<
          _$FoodContainerSaveUiStateImpl>(this, _$identity);
}

abstract class _FoodContainerSaveUiState extends FoodContainerSaveUiState {
  const factory _FoodContainerSaveUiState(
      {final String? id,
      final String name,
      final String description,
      final Unit weightUnit,
      final double? weightValue}) = _$FoodContainerSaveUiStateImpl;
  const _FoodContainerSaveUiState._() : super._();

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  Unit get weightUnit;
  @override
  double? get weightValue;

  /// Create a copy of FoodContainerSaveUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodContainerSaveUiStateImplCopyWith<_$FoodContainerSaveUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
