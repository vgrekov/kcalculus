// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientFirestoreModel {
  String get edibleId;
  AmountFirestoreModel get amount;

  /// Create a copy of IngredientFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IngredientFirestoreModelCopyWith<IngredientFirestoreModel> get copyWith =>
      _$IngredientFirestoreModelCopyWithImpl<IngredientFirestoreModel>(
          this as IngredientFirestoreModel, _$identity);

  /// Serializes this IngredientFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngredientFirestoreModel &&
            (identical(other.edibleId, edibleId) ||
                other.edibleId == edibleId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, edibleId, amount);

  @override
  String toString() {
    return 'IngredientFirestoreModel(edibleId: $edibleId, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class $IngredientFirestoreModelCopyWith<$Res> {
  factory $IngredientFirestoreModelCopyWith(IngredientFirestoreModel value,
          $Res Function(IngredientFirestoreModel) _then) =
      _$IngredientFirestoreModelCopyWithImpl;
  @useResult
  $Res call({String edibleId, AmountFirestoreModel amount});

  $AmountFirestoreModelCopyWith<$Res> get amount;
}

/// @nodoc
class _$IngredientFirestoreModelCopyWithImpl<$Res>
    implements $IngredientFirestoreModelCopyWith<$Res> {
  _$IngredientFirestoreModelCopyWithImpl(this._self, this._then);

  final IngredientFirestoreModel _self;
  final $Res Function(IngredientFirestoreModel) _then;

  /// Create a copy of IngredientFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edibleId = null,
    Object? amount = null,
  }) {
    return _then(_self.copyWith(
      edibleId: null == edibleId
          ? _self.edibleId
          : edibleId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as AmountFirestoreModel,
    ));
  }

  /// Create a copy of IngredientFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountFirestoreModelCopyWith<$Res> get amount {
    return $AmountFirestoreModelCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _IngredientFirestoreModel implements IngredientFirestoreModel {
  const _IngredientFirestoreModel(
      {required this.edibleId, required this.amount});
  factory _IngredientFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientFirestoreModelFromJson(json);

  @override
  final String edibleId;
  @override
  final AmountFirestoreModel amount;

  /// Create a copy of IngredientFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IngredientFirestoreModelCopyWith<_IngredientFirestoreModel> get copyWith =>
      __$IngredientFirestoreModelCopyWithImpl<_IngredientFirestoreModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IngredientFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IngredientFirestoreModel &&
            (identical(other.edibleId, edibleId) ||
                other.edibleId == edibleId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, edibleId, amount);

  @override
  String toString() {
    return 'IngredientFirestoreModel(edibleId: $edibleId, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class _$IngredientFirestoreModelCopyWith<$Res>
    implements $IngredientFirestoreModelCopyWith<$Res> {
  factory _$IngredientFirestoreModelCopyWith(_IngredientFirestoreModel value,
          $Res Function(_IngredientFirestoreModel) _then) =
      __$IngredientFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call({String edibleId, AmountFirestoreModel amount});

  @override
  $AmountFirestoreModelCopyWith<$Res> get amount;
}

/// @nodoc
class __$IngredientFirestoreModelCopyWithImpl<$Res>
    implements _$IngredientFirestoreModelCopyWith<$Res> {
  __$IngredientFirestoreModelCopyWithImpl(this._self, this._then);

  final _IngredientFirestoreModel _self;
  final $Res Function(_IngredientFirestoreModel) _then;

  /// Create a copy of IngredientFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? edibleId = null,
    Object? amount = null,
  }) {
    return _then(_IngredientFirestoreModel(
      edibleId: null == edibleId
          ? _self.edibleId
          : edibleId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as AmountFirestoreModel,
    ));
  }

  /// Create a copy of IngredientFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountFirestoreModelCopyWith<$Res> get amount {
    return $AmountFirestoreModelCopyWith<$Res>(_self.amount, (value) {
      return _then(_self.copyWith(amount: value));
    });
  }
}

// dart format on
