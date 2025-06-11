// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductApiModel {
  String get product_name;
  String? get brands;
  String? get serving_quantity_unit;
  Object? get serving_quantity;
  String? get nutrition_data_per;
  Map<String, dynamic>? get nutriments;

  /// Create a copy of ProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductApiModelCopyWith<ProductApiModel> get copyWith =>
      _$ProductApiModelCopyWithImpl<ProductApiModel>(
          this as ProductApiModel, _$identity);

  /// Serializes this ProductApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductApiModel &&
            (identical(other.product_name, product_name) ||
                other.product_name == product_name) &&
            (identical(other.brands, brands) || other.brands == brands) &&
            (identical(other.serving_quantity_unit, serving_quantity_unit) ||
                other.serving_quantity_unit == serving_quantity_unit) &&
            const DeepCollectionEquality()
                .equals(other.serving_quantity, serving_quantity) &&
            (identical(other.nutrition_data_per, nutrition_data_per) ||
                other.nutrition_data_per == nutrition_data_per) &&
            const DeepCollectionEquality()
                .equals(other.nutriments, nutriments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      product_name,
      brands,
      serving_quantity_unit,
      const DeepCollectionEquality().hash(serving_quantity),
      nutrition_data_per,
      const DeepCollectionEquality().hash(nutriments));

  @override
  String toString() {
    return 'ProductApiModel(product_name: $product_name, brands: $brands, serving_quantity_unit: $serving_quantity_unit, serving_quantity: $serving_quantity, nutrition_data_per: $nutrition_data_per, nutriments: $nutriments)';
  }
}

/// @nodoc
abstract mixin class $ProductApiModelCopyWith<$Res> {
  factory $ProductApiModelCopyWith(
          ProductApiModel value, $Res Function(ProductApiModel) _then) =
      _$ProductApiModelCopyWithImpl;
  @useResult
  $Res call(
      {String product_name,
      String? brands,
      String? serving_quantity_unit,
      Object? serving_quantity,
      String? nutrition_data_per,
      Map<String, dynamic>? nutriments});
}

/// @nodoc
class _$ProductApiModelCopyWithImpl<$Res>
    implements $ProductApiModelCopyWith<$Res> {
  _$ProductApiModelCopyWithImpl(this._self, this._then);

  final ProductApiModel _self;
  final $Res Function(ProductApiModel) _then;

  /// Create a copy of ProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_name = null,
    Object? brands = freezed,
    Object? serving_quantity_unit = freezed,
    Object? serving_quantity = freezed,
    Object? nutrition_data_per = freezed,
    Object? nutriments = freezed,
  }) {
    return _then(_self.copyWith(
      product_name: null == product_name
          ? _self.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String,
      brands: freezed == brands
          ? _self.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as String?,
      serving_quantity_unit: freezed == serving_quantity_unit
          ? _self.serving_quantity_unit
          : serving_quantity_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      serving_quantity: freezed == serving_quantity
          ? _self.serving_quantity
          : serving_quantity,
      nutrition_data_per: freezed == nutrition_data_per
          ? _self.nutrition_data_per
          : nutrition_data_per // ignore: cast_nullable_to_non_nullable
              as String?,
      nutriments: freezed == nutriments
          ? _self.nutriments
          : nutriments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProductApiModel implements ProductApiModel {
  const _ProductApiModel(
      {required this.product_name,
      this.brands,
      this.serving_quantity_unit,
      this.serving_quantity,
      this.nutrition_data_per,
      final Map<String, dynamic>? nutriments})
      : _nutriments = nutriments;
  factory _ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);

  @override
  final String product_name;
  @override
  final String? brands;
  @override
  final String? serving_quantity_unit;
  @override
  final Object? serving_quantity;
  @override
  final String? nutrition_data_per;
  final Map<String, dynamic>? _nutriments;
  @override
  Map<String, dynamic>? get nutriments {
    final value = _nutriments;
    if (value == null) return null;
    if (_nutriments is EqualUnmodifiableMapView) return _nutriments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of ProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductApiModelCopyWith<_ProductApiModel> get copyWith =>
      __$ProductApiModelCopyWithImpl<_ProductApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductApiModel &&
            (identical(other.product_name, product_name) ||
                other.product_name == product_name) &&
            (identical(other.brands, brands) || other.brands == brands) &&
            (identical(other.serving_quantity_unit, serving_quantity_unit) ||
                other.serving_quantity_unit == serving_quantity_unit) &&
            const DeepCollectionEquality()
                .equals(other.serving_quantity, serving_quantity) &&
            (identical(other.nutrition_data_per, nutrition_data_per) ||
                other.nutrition_data_per == nutrition_data_per) &&
            const DeepCollectionEquality()
                .equals(other._nutriments, _nutriments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      product_name,
      brands,
      serving_quantity_unit,
      const DeepCollectionEquality().hash(serving_quantity),
      nutrition_data_per,
      const DeepCollectionEquality().hash(_nutriments));

  @override
  String toString() {
    return 'ProductApiModel(product_name: $product_name, brands: $brands, serving_quantity_unit: $serving_quantity_unit, serving_quantity: $serving_quantity, nutrition_data_per: $nutrition_data_per, nutriments: $nutriments)';
  }
}

/// @nodoc
abstract mixin class _$ProductApiModelCopyWith<$Res>
    implements $ProductApiModelCopyWith<$Res> {
  factory _$ProductApiModelCopyWith(
          _ProductApiModel value, $Res Function(_ProductApiModel) _then) =
      __$ProductApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String product_name,
      String? brands,
      String? serving_quantity_unit,
      Object? serving_quantity,
      String? nutrition_data_per,
      Map<String, dynamic>? nutriments});
}

/// @nodoc
class __$ProductApiModelCopyWithImpl<$Res>
    implements _$ProductApiModelCopyWith<$Res> {
  __$ProductApiModelCopyWithImpl(this._self, this._then);

  final _ProductApiModel _self;
  final $Res Function(_ProductApiModel) _then;

  /// Create a copy of ProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product_name = null,
    Object? brands = freezed,
    Object? serving_quantity_unit = freezed,
    Object? serving_quantity = freezed,
    Object? nutrition_data_per = freezed,
    Object? nutriments = freezed,
  }) {
    return _then(_ProductApiModel(
      product_name: null == product_name
          ? _self.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String,
      brands: freezed == brands
          ? _self.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as String?,
      serving_quantity_unit: freezed == serving_quantity_unit
          ? _self.serving_quantity_unit
          : serving_quantity_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      serving_quantity: freezed == serving_quantity
          ? _self.serving_quantity
          : serving_quantity,
      nutrition_data_per: freezed == nutrition_data_per
          ? _self.nutrition_data_per
          : nutrition_data_per // ignore: cast_nullable_to_non_nullable
              as String?,
      nutriments: freezed == nutriments
          ? _self._nutriments
          : nutriments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
