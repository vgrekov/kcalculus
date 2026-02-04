// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImportReport _$ImportReportFromJson(Map<String, dynamic> json) =>
    _ImportReport(
      foods: ImportProgress.fromJson(json['foods'] as Map<String, dynamic>),
      dishes: ImportProgress.fromJson(json['dishes'] as Map<String, dynamic>),
      meals: ImportProgress.fromJson(json['meals'] as Map<String, dynamic>),
      containers: ImportProgress.fromJson(
        json['containers'] as Map<String, dynamic>,
      ),
      defaultNutrients: ImportProgress.fromJson(
        json['defaultNutrients'] as Map<String, dynamic>,
      ),
      nutrientGoals: ImportProgress.fromJson(
        json['nutrientGoals'] as Map<String, dynamic>,
      ),
      settings: ImportProgress.fromJson(
        json['settings'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ImportReportToJson(_ImportReport instance) =>
    <String, dynamic>{
      'foods': instance.foods.toJson(),
      'dishes': instance.dishes.toJson(),
      'meals': instance.meals.toJson(),
      'containers': instance.containers.toJson(),
      'defaultNutrients': instance.defaultNutrients.toJson(),
      'nutrientGoals': instance.nutrientGoals.toJson(),
      'settings': instance.settings.toJson(),
    };
