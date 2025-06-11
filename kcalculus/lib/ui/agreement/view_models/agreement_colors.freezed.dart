// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreement_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AgreementColors {
  Color get backgroundColor;
  Color get textColor;

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AgreementColorsCopyWith<AgreementColors> get copyWith =>
      _$AgreementColorsCopyWithImpl<AgreementColors>(
          this as AgreementColors, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AgreementColors &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, backgroundColor, textColor);

  @override
  String toString() {
    return 'AgreementColors(backgroundColor: $backgroundColor, textColor: $textColor)';
  }
}

/// @nodoc
abstract mixin class $AgreementColorsCopyWith<$Res> {
  factory $AgreementColorsCopyWith(
          AgreementColors value, $Res Function(AgreementColors) _then) =
      _$AgreementColorsCopyWithImpl;
  @useResult
  $Res call({Color backgroundColor, Color textColor});
}

/// @nodoc
class _$AgreementColorsCopyWithImpl<$Res>
    implements $AgreementColorsCopyWith<$Res> {
  _$AgreementColorsCopyWithImpl(this._self, this._then);

  final AgreementColors _self;
  final $Res Function(AgreementColors) _then;

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? textColor = null,
  }) {
    return _then(_self.copyWith(
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _self.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _AgreementColors implements AgreementColors {
  const _AgreementColors(
      {required this.backgroundColor, required this.textColor});

  @override
  final Color backgroundColor;
  @override
  final Color textColor;

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AgreementColorsCopyWith<_AgreementColors> get copyWith =>
      __$AgreementColorsCopyWithImpl<_AgreementColors>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AgreementColors &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, backgroundColor, textColor);

  @override
  String toString() {
    return 'AgreementColors(backgroundColor: $backgroundColor, textColor: $textColor)';
  }
}

/// @nodoc
abstract mixin class _$AgreementColorsCopyWith<$Res>
    implements $AgreementColorsCopyWith<$Res> {
  factory _$AgreementColorsCopyWith(
          _AgreementColors value, $Res Function(_AgreementColors) _then) =
      __$AgreementColorsCopyWithImpl;
  @override
  @useResult
  $Res call({Color backgroundColor, Color textColor});
}

/// @nodoc
class __$AgreementColorsCopyWithImpl<$Res>
    implements _$AgreementColorsCopyWith<$Res> {
  __$AgreementColorsCopyWithImpl(this._self, this._then);

  final _AgreementColors _self;
  final $Res Function(_AgreementColors) _then;

  /// Create a copy of AgreementColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? backgroundColor = null,
    Object? textColor = null,
  }) {
    return _then(_AgreementColors(
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _self.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

// dart format on
