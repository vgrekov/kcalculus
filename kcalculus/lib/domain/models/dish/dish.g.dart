// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$DishImplToJson(_$DishImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'nutritionRatios': instance.nutritionRatios
          .map((k, e) => MapEntry(_$MeasureEnumMap[k]!, e)),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$MeasureEnumMap = {
  Measure.mass: 'mass',
  Measure.volume: 'volume',
  Measure.quantity: 'quantity',
  Measure.energy: 'energy',
};
