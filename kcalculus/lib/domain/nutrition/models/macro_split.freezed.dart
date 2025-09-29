// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'macro_split.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MacroSplit {
  double get fatPercentage;
  double get carbsPercentage;
  double get proteinPercentage;

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MacroSplitCopyWith<MacroSplit> get copyWith =>
      _$MacroSplitCopyWithImpl<MacroSplit>(this as MacroSplit, _$identity);

  /// Serializes this MacroSplit to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MacroSplit &&
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

  @override
  String toString() {
    return 'MacroSplit(fatPercentage: $fatPercentage, carbsPercentage: $carbsPercentage, proteinPercentage: $proteinPercentage)';
  }
}

/// @nodoc
abstract mixin class $MacroSplitCopyWith<$Res> {
  factory $MacroSplitCopyWith(
          MacroSplit value, $Res Function(MacroSplit) _then) =
      _$MacroSplitCopyWithImpl;
  @useResult
  $Res call(
      {double fatPercentage, double carbsPercentage, double proteinPercentage});
}

/// @nodoc
class _$MacroSplitCopyWithImpl<$Res> implements $MacroSplitCopyWith<$Res> {
  _$MacroSplitCopyWithImpl(this._self, this._then);

  final MacroSplit _self;
  final $Res Function(MacroSplit) _then;

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fatPercentage = null,
    Object? carbsPercentage = null,
    Object? proteinPercentage = null,
  }) {
    return _then(_self.copyWith(
      fatPercentage: null == fatPercentage
          ? _self.fatPercentage
          : fatPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      carbsPercentage: null == carbsPercentage
          ? _self.carbsPercentage
          : carbsPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      proteinPercentage: null == proteinPercentage
          ? _self.proteinPercentage
          : proteinPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MacroSplit implements MacroSplit {
  const _MacroSplit(
      {required this.fatPercentage,
      required this.carbsPercentage,
      required this.proteinPercentage});
  factory _MacroSplit.fromJson(Map<String, dynamic> json) =>
      _$MacroSplitFromJson(json);

  @override
  final double fatPercentage;
  @override
  final double carbsPercentage;
  @override
  final double proteinPercentage;

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MacroSplitCopyWith<_MacroSplit> get copyWith =>
      __$MacroSplitCopyWithImpl<_MacroSplit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MacroSplitToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MacroSplit &&
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

  @override
  String toString() {
    return 'MacroSplit._default(fatPercentage: $fatPercentage, carbsPercentage: $carbsPercentage, proteinPercentage: $proteinPercentage)';
  }
}

/// @nodoc
abstract mixin class _$MacroSplitCopyWith<$Res>
    implements $MacroSplitCopyWith<$Res> {
  factory _$MacroSplitCopyWith(
          _MacroSplit value, $Res Function(_MacroSplit) _then) =
      __$MacroSplitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double fatPercentage, double carbsPercentage, double proteinPercentage});
}

/// @nodoc
class __$MacroSplitCopyWithImpl<$Res> implements _$MacroSplitCopyWith<$Res> {
  __$MacroSplitCopyWithImpl(this._self, this._then);

  final _MacroSplit _self;
  final $Res Function(_MacroSplit) _then;

  /// Create a copy of MacroSplit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fatPercentage = null,
    Object? carbsPercentage = null,
    Object? proteinPercentage = null,
  }) {
    return _then(_MacroSplit(
      fatPercentage: null == fatPercentage
          ? _self.fatPercentage
          : fatPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      carbsPercentage: null == carbsPercentage
          ? _self.carbsPercentage
          : carbsPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      proteinPercentage: null == proteinPercentage
          ? _self.proteinPercentage
          : proteinPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
