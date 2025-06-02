// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductApiModelImpl _$$ProductApiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductApiModelImpl(
      product_name: json['product_name'] as String,
      brands: json['brands'] as String?,
      serving_quantity_unit: json['serving_quantity_unit'] as String?,
      serving_quantity: json['serving_quantity'],
      nutrition_data_per: json['nutrition_data_per'] as String?,
      nutriments: json['nutriments'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ProductApiModelImplToJson(
        _$ProductApiModelImpl instance) =>
    <String, dynamic>{
      'product_name': instance.product_name,
      'brands': instance.brands,
      'serving_quantity_unit': instance.serving_quantity_unit,
      'serving_quantity': instance.serving_quantity,
      'nutrition_data_per': instance.nutrition_data_per,
      'nutriments': instance.nutriments,
    };
