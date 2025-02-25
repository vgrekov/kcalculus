// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutriments_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutrimentsApiModelImpl _$$NutrimentsApiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NutrimentsApiModelImpl(
      energy_kcal: (json['energy-kcal'] as num).toDouble(),
      fat_unit: json['fat_unit'] as String?,
      fat_value: (json['fat_value'] as num?)?.toDouble(),
      carbohydrates_unit: json['carbohydrates_unit'] as String?,
      carbohydrates_value: (json['carbohydrates_value'] as num?)?.toDouble(),
      fiber_unit: json['fiber_unit'] as String?,
      fiber_value: (json['fiber_value'] as num?)?.toDouble(),
      proteins_unit: json['proteins_unit'] as String?,
      proteins_value: (json['proteins_value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$NutrimentsApiModelImplToJson(
        _$NutrimentsApiModelImpl instance) =>
    <String, dynamic>{
      'energy-kcal': instance.energy_kcal,
      'fat_unit': instance.fat_unit,
      'fat_value': instance.fat_value,
      'carbohydrates_unit': instance.carbohydrates_unit,
      'carbohydrates_value': instance.carbohydrates_value,
      'fiber_unit': instance.fiber_unit,
      'fiber_value': instance.fiber_value,
      'proteins_unit': instance.proteins_unit,
      'proteins_value': instance.proteins_value,
    };
