// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EdibleDbModelImpl _$$EdibleDbModelImplFromJson(Map<String, dynamic> json) =>
    _$EdibleDbModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      deleted_at: json['deleted_at'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EdibleDbModelImplToJson(_$EdibleDbModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'runtimeType': instance.$type,
    };

_$FoodDbModelImpl _$$FoodDbModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodDbModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      deleted_at: json['deleted_at'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FoodDbModelImplToJson(_$FoodDbModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'runtimeType': instance.$type,
    };

_$DishDbModelImpl _$$DishDbModelImplFromJson(Map<String, dynamic> json) =>
    _$DishDbModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      mass_per_amount_unit: json['mass_per_amount_unit'] as String?,
      mass_per_amount_value:
          (json['mass_per_amount_value'] as num?)?.toDouble(),
      mass_total_amount_unit: json['mass_total_amount_unit'] as String?,
      mass_total_amount_value:
          (json['mass_total_amount_value'] as num?)?.toDouble(),
      volume_per_amount_unit: json['volume_per_amount_unit'] as String?,
      volume_per_amount_value:
          (json['volume_per_amount_value'] as num?)?.toDouble(),
      volume_total_amount_unit: json['volume_total_amount_unit'] as String?,
      volume_total_amount_value:
          (json['volume_total_amount_value'] as num?)?.toDouble(),
      quantity_per_amount_unit: json['quantity_per_amount_unit'] as String?,
      quantity_per_amount_value:
          (json['quantity_per_amount_value'] as num?)?.toDouble(),
      quantity_total_amount_unit: json['quantity_total_amount_unit'] as String?,
      quantity_total_amount_value:
          (json['quantity_total_amount_value'] as num?)?.toDouble(),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      deleted_at: json['deleted_at'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DishDbModelImplToJson(_$DishDbModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mass_per_amount_unit': instance.mass_per_amount_unit,
      'mass_per_amount_value': instance.mass_per_amount_value,
      'mass_total_amount_unit': instance.mass_total_amount_unit,
      'mass_total_amount_value': instance.mass_total_amount_value,
      'volume_per_amount_unit': instance.volume_per_amount_unit,
      'volume_per_amount_value': instance.volume_per_amount_value,
      'volume_total_amount_unit': instance.volume_total_amount_unit,
      'volume_total_amount_value': instance.volume_total_amount_value,
      'quantity_per_amount_unit': instance.quantity_per_amount_unit,
      'quantity_per_amount_value': instance.quantity_per_amount_value,
      'quantity_total_amount_unit': instance.quantity_total_amount_unit,
      'quantity_total_amount_value': instance.quantity_total_amount_value,
      'runtimeType': instance.$type,
    };
