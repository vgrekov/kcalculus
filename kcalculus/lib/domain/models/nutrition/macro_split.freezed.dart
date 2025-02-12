// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'macro_split.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MacroSplit _$MacroSplitFromJson(Map<String, dynamic> json) {
  return _MacroSplit.fromJson(json);
}

/// @nodoc
mixin _$MacroSplit {
  double get fatPercentage => throw _privateConstructorUsedError;
  double get carbsPercentage => throw _privateConstructorUsedError;
  double get proteinPercentage => throw _privateConstructorUsedError;

  /// Serializes this MacroSplit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MacroSplitCopyWith<MacroSplit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacroSplitCopyWith<$Res> {
  factory $MacroSplitCopyWith(
          MacroSplit value, $Res Function(MacroSplit) then) =
      _$MacroSplitCopyWithImpl<$Res, MacroSplit>;
  @useResult
  $Res call(
      {double fatPercentage, double carbsPercentage, double proteinPercentage});
}

/// @nodoc
class _$MacroSplitCopyWithImpl<$Res, $Val extends MacroSplit>
    implements $MacroSplitCopyWith<$Res> {
  _$MacroSplitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fatPercentage = null,
    Object? carbsPercentage = null,
    Object? proteinPercentage = null,
  }) {
    return _then(_value.copyWith(
      fatPercentage: null == fatPercentage
          ? _value.fatPercentage
          : fatPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      carbsPercentage: null == carbsPercentage
          ? _value.carbsPercentage
          : carbsPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      proteinPercentage: null == proteinPercentage
          ? _value.proteinPercentage
          : proteinPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MacroSplitImplCopyWith<$Res>
    implements $MacroSplitCopyWith<$Res> {
  factory _$$MacroSplitImplCopyWith(
          _$MacroSplitImpl value, $Res Function(_$MacroSplitImpl) then) =
      __$$MacroSplitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double fatPercentage, double carbsPercentage, double proteinPercentage});
}

/// @nodoc
class __$$MacroSplitImplCopyWithImpl<$Res>
    extends _$MacroSplitCopyWithImpl<$Res, _$MacroSplitImpl>
    implements _$$MacroSplitImplCopyWith<$Res> {
  __$$MacroSplitImplCopyWithImpl(
      _$MacroSplitImpl _value, $Res Function(_$MacroSplitImpl) _then)
      : super(_value, _then);

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fatPercentage = null,
    Object? carbsPercentage = null,
    Object? proteinPercentage = null,
  }) {
    return _then(_$MacroSplitImpl(
      fatPercentage: null == fatPercentage
          ? _value.fatPercentage
          : fatPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      carbsPercentage: null == carbsPercentage
          ? _value.carbsPercentage
          : carbsPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      proteinPercentage: null == proteinPercentage
          ? _value.proteinPercentage
          : proteinPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MacroSplitImpl implements _MacroSplit {
  const _$MacroSplitImpl(
      {required this.fatPercentage,
      required this.carbsPercentage,
      required this.proteinPercentage});

  factory _$MacroSplitImpl.fromJson(Map<String, dynamic> json) =>
      _$$MacroSplitImplFromJson(json);

  @override
  final double fatPercentage;
  @override
  final double carbsPercentage;
  @override
  final double proteinPercentage;

  @override
  String toString() {
    return 'MacroSplit._default(fatPercentage: $fatPercentage, carbsPercentage: $carbsPercentage, proteinPercentage: $proteinPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacroSplitImpl &&
            (identical(other.fatPercentage, fatPercentage) ||
                other.fatPercentage == fatPercentage) &&
            (identical(other.carbsPercentage, carbsPercentage) ||
                other.carbsPercentage == carbsPercentage) &&
            (identical(other.proteinPercentage, proteinPercentage) ||
                other.proteinPercentage == proteinPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, fatPercentage, carbsPercentage, proteinPercentage);

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MacroSplitImplCopyWith<_$MacroSplitImpl> get copyWith =>
      __$$MacroSplitImplCopyWithImpl<_$MacroSplitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MacroSplitImplToJson(
      this,
    );
  }
}

abstract class _MacroSplit implements MacroSplit {
  const factory _MacroSplit(
      {required final double fatPercentage,
      required final double carbsPercentage,
      required final double proteinPercentage}) = _$MacroSplitImpl;

  factory _MacroSplit.fromJson(Map<String, dynamic> json) =
      _$MacroSplitImpl.fromJson;

  @override
  double get fatPercentage;
  @override
  double get carbsPercentage;
  @override
  double get proteinPercentage;

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MacroSplitImplCopyWith<_$MacroSplitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
