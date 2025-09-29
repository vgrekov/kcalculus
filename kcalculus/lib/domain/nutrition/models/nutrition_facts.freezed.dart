// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFacts implements DiagnosticableTreeMixin {
  String? get id;
  Amount get amount;
  NutrientData get nutrientData;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsCopyWith<NutritionFacts> get copyWith =>
      _$NutritionFactsCopyWithImpl<NutritionFacts>(
          this as NutritionFacts, _$identity);

  /// Serializes this NutritionFacts to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'NutritionFacts'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('nutrientData', nutrientData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFacts &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.nutrientData, nutrientData) ||
                other.nutrientData == nutrientData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, nutrientData);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NutritionFacts(id: $id, amount: $amount, nutrientData: $nutrientData)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsCopyWith<$Res> {
  factory $NutritionFactsCopyWith(
          NutritionFacts value, $Res Function(NutritionFacts) _then) =
      _$NutritionFactsCopyWithImpl;
  @useResult
  $Res call({String? id, Amount amount, NutrientData nutrientData});

  $AmountCopyWith<$Res> get amount;
  $NutrientDataCopyWith<$Res> get nutrientData;
}

/// @nodoc
class _$NutritionFactsCopyWithImpl<$Res>
    implements $NutritionFactsCopyWith<$Res> {
  _$NutritionFactsCopyWithImpl(this._self, this._then);

  final NutritionFacts _self;
  final $Res Function(NutritionFacts) _then;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = null,
    Object? nutrientData = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      nutrientData: null == nutrientData
          ? _self.nutrientData
          : nutrientData // ignore: cast_nullable_to_non_nullable
              as NutrientData,
    ));
  }

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientDataCopyWith<$Res> get nutrientData {
    return $NutrientDataCopyWith<$Res>(_self.nutrientData, (value) {
      return _then(_self.copyWith(nutrientData: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NutritionFacts extends NutritionFacts with DiagnosticableTreeMixin {
  const _NutritionFacts(
      {this.id, required this.amount, required this.nutrientData})
      : super._();
  factory _NutritionFacts.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsFromJson(json);

  @override
  final String? id;
  @override
  final Amount amount;
  @override
  final NutrientData nutrientData;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsCopyWith<_NutritionFacts> get copyWith =>
      __$NutritionFactsCopyWithImpl<_NutritionFacts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionFactsToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'NutritionFacts'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('nutrientData', nutrientData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFacts &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.nutrientData, nutrientData) ||
                other.nutrientData == nutrientData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, nutrientData);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NutritionFacts(id: $id, amount: $amount, nutrientData: $nutrientData)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsCopyWith<$Res>
    implements $NutritionFactsCopyWith<$Res> {
  factory _$NutritionFactsCopyWith(
          _NutritionFacts value, $Res Function(_NutritionFacts) _then) =
      __$NutritionFactsCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, Amount amount, NutrientData nutrientData});

  @override
  $AmountCopyWith<$Res> get amount;
  @override
  $NutrientDataCopyWith<$Res> get nutrientData;
}

/// @nodoc
class __$NutritionFactsCopyWithImpl<$Res>
    implements _$NutritionFactsCopyWith<$Res> {
  __$NutritionFactsCopyWithImpl(this._self, this._then);

  final _NutritionFacts _self;
  final $Res Function(_NutritionFacts) _then;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? amount = null,
    Object? nutrientData = null,
  }) {
    return _then(_NutritionFacts(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      nutrientData: null == nutrientData
          ? _self.nutrientData
          : nutrientData // ignore: cast_nullable_to_non_nullable
              as NutrientData,
    ));
  }

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientDataCopyWith<$Res> get nutrientData {
    return $NutrientDataCopyWith<$Res>(_self.nutrientData, (value) {
      return _then(_self.copyWith(nutrientData: value));
    });
  }
}

// dart format on
