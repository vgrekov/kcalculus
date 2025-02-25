// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreement_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AgreementColors {
  Color get backgroundColor => throw _privateConstructorUsedError;
  Color get textColor => throw _privateConstructorUsedError;

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgreementColorsCopyWith<AgreementColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgreementColorsCopyWith<$Res> {
  factory $AgreementColorsCopyWith(
          AgreementColors value, $Res Function(AgreementColors) then) =
      _$AgreementColorsCopyWithImpl<$Res, AgreementColors>;
  @useResult
  $Res call({Color backgroundColor, Color textColor});
}

/// @nodoc
class _$AgreementColorsCopyWithImpl<$Res, $Val extends AgreementColors>
    implements $AgreementColorsCopyWith<$Res> {
  _$AgreementColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? textColor = null,
  }) {
    return _then(_value.copyWith(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgreementColorsImplCopyWith<$Res>
    implements $AgreementColorsCopyWith<$Res> {
  factory _$$AgreementColorsImplCopyWith(_$AgreementColorsImpl value,
          $Res Function(_$AgreementColorsImpl) then) =
      __$$AgreementColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color backgroundColor, Color textColor});
}

/// @nodoc
class __$$AgreementColorsImplCopyWithImpl<$Res>
    extends _$AgreementColorsCopyWithImpl<$Res, _$AgreementColorsImpl>
    implements _$$AgreementColorsImplCopyWith<$Res> {
  __$$AgreementColorsImplCopyWithImpl(
      _$AgreementColorsImpl _value, $Res Function(_$AgreementColorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? textColor = null,
  }) {
    return _then(_$AgreementColorsImpl(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$AgreementColorsImpl implements _AgreementColors {
  const _$AgreementColorsImpl(
      {required this.backgroundColor, required this.textColor});

  @override
  final Color backgroundColor;
  @override
  final Color textColor;

  @override
  String toString() {
    return 'AgreementColors(backgroundColor: $backgroundColor, textColor: $textColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgreementColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, backgroundColor, textColor);

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgreementColorsImplCopyWith<_$AgreementColorsImpl> get copyWith =>
      __$$AgreementColorsImplCopyWithImpl<_$AgreementColorsImpl>(
          this, _$identity);
}

abstract class _AgreementColors implements AgreementColors {
  const factory _AgreementColors(
      {required final Color backgroundColor,
      required final Color textColor}) = _$AgreementColorsImpl;

  @override
  Color get backgroundColor;
  @override
  Color get textColor;

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgreementColorsImplCopyWith<_$AgreementColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
