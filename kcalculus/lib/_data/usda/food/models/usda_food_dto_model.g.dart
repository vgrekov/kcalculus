// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_food_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsdaFoodDtoModel _$UsdaFoodDtoModelFromJson(Map<String, dynamic> json) =>
    _UsdaFoodDtoModel(
      fdcId: (json['fdcId'] as num).toInt(),
      description: json['description'] as String,
      dataType: json['dataType'] as String,
      priority: (json['priority'] as num).toInt(),
      portions: (json['portions'] as List<dynamic>?)
          ?.map((e) => UsdaPortionDtoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutrients: (json['nutrients'] as List<dynamic>)
          .map((e) => UsdaNutrientDtoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsdaFoodDtoModelToJson(_UsdaFoodDtoModel instance) =>
    <String, dynamic>{
      'fdcId': instance.fdcId,
      'description': instance.description,
      'dataType': instance.dataType,
      'priority': instance.priority,
      'portions': instance.portions?.map((e) => e.toJson()).toList(),
      'nutrients': instance.nutrients.map((e) => e.toJson()).toList(),
    };
