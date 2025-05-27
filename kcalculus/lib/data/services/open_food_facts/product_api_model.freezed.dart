// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductApiModel _$ProductApiModelFromJson(Map<String, dynamic> json) {
  return _ProductApiModel.fromJson(json);
}

/// @nodoc
mixin _$ProductApiModel {
  String get product_name => throw _privateConstructorUsedError;
  String? get brands => throw _privateConstructorUsedError;
  String? get serving_quantity_unit => throw _privateConstructorUsedError;
  Object? get serving_quantity => throw _privateConstructorUsedError;
  String? get nutrition_data_per => throw _privateConstructorUsedError;
  Map<String, dynamic>? get nutriments => throw _privateConstructorUsedError;

  /// Serializes this ProductApiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductApiModelCopyWith<ProductApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductApiModelCopyWith<$Res> {
  factory $ProductApiModelCopyWith(
          ProductApiModel value, $Res Function(ProductApiModel) then) =
      _$ProductApiModelCopyWithImpl<$Res, ProductApiModel>;
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
class _$ProductApiModelCopyWithImpl<$Res, $Val extends ProductApiModel>
    implements $ProductApiModelCopyWith<$Res> {
  _$ProductApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      product_name: null == product_name
          ? _value.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String,
      brands: freezed == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as String?,
      serving_quantity_unit: freezed == serving_quantity_unit
          ? _value.serving_quantity_unit
          : serving_quantity_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      serving_quantity: freezed == serving_quantity
          ? _value.serving_quantity
          : serving_quantity,
      nutrition_data_per: freezed == nutrition_data_per
          ? _value.nutrition_data_per
          : nutrition_data_per // ignore: cast_nullable_to_non_nullable
              as String?,
      nutriments: freezed == nutriments
          ? _value.nutriments
          : nutriments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductApiModelImplCopyWith<$Res>
    implements $ProductApiModelCopyWith<$Res> {
  factory _$$ProductApiModelImplCopyWith(_$ProductApiModelImpl value,
          $Res Function(_$ProductApiModelImpl) then) =
      __$$ProductApiModelImplCopyWithImpl<$Res>;
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
class __$$ProductApiModelImplCopyWithImpl<$Res>
    extends _$ProductApiModelCopyWithImpl<$Res, _$ProductApiModelImpl>
    implements _$$ProductApiModelImplCopyWith<$Res> {
  __$$ProductApiModelImplCopyWithImpl(
      _$ProductApiModelImpl _value, $Res Function(_$ProductApiModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$ProductApiModelImpl(
      product_name: null == product_name
          ? _value.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String,
      brands: freezed == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as String?,
      serving_quantity_unit: freezed == serving_quantity_unit
          ? _value.serving_quantity_unit
          : serving_quantity_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      serving_quantity: freezed == serving_quantity
          ? _value.serving_quantity
          : serving_quantity,
      nutrition_data_per: freezed == nutrition_data_per
          ? _value.nutrition_data_per
          : nutrition_data_per // ignore: cast_nullable_to_non_nullable
              as String?,
      nutriments: freezed == nutriments
          ? _value._nutriments
          : nutriments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductApiModelImpl implements _ProductApiModel {
  const _$ProductApiModelImpl(
      {required this.product_name,
      this.brands,
      this.serving_quantity_unit,
      this.serving_quantity,
      this.nutrition_data_per,
      final Map<String, dynamic>? nutriments})
      : _nutriments = nutriments;

  factory _$ProductApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductApiModelImplFromJson(json);

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

  @override
  String toString() {
    return 'ProductApiModel(product_name: $product_name, brands: $brands, serving_quantity_unit: $serving_quantity_unit, serving_quantity: $serving_quantity, nutrition_data_per: $nutrition_data_per, nutriments: $nutriments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductApiModelImpl &&
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

  /// Create a copy of ProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductApiModelImplCopyWith<_$ProductApiModelImpl> get copyWith =>
      __$$ProductApiModelImplCopyWithImpl<_$ProductApiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductApiModelImplToJson(
      this,
    );
  }
}

abstract class _ProductApiModel implements ProductApiModel {
  const factory _ProductApiModel(
      {required final String product_name,
      final String? brands,
      final String? serving_quantity_unit,
      final Object? serving_quantity,
      final String? nutrition_data_per,
      final Map<String, dynamic>? nutriments}) = _$ProductApiModelImpl;

  factory _ProductApiModel.fromJson(Map<String, dynamic> json) =
      _$ProductApiModelImpl.fromJson;

  @override
  String get product_name;
  @override
  String? get brands;
  @override
  String? get serving_quantity_unit;
  @override
  Object? get serving_quantity;
  @override
  String? get nutrition_data_per;
  @override
  Map<String, dynamic>? get nutriments;

  /// Create a copy of ProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductApiModelImplCopyWith<_$ProductApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
