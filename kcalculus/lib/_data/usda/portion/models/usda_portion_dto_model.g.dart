// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_portion_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsdaPortionDtoModel _$UsdaPortionDtoModelFromJson(Map<String, dynamic> json) =>
    _UsdaPortionDtoModel(
      measureUnitId: (json['measureUnitId'] as num).toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      gramWeight: (json['gramWeight'] as num).toDouble(),
    );

Map<String, dynamic> _$UsdaPortionDtoModelToJson(
        _UsdaPortionDtoModel instance) =>
    <String, dynamic>{
      'measureUnitId': instance.measureUnitId,
      'amount': instance.amount,
      'gramWeight': instance.gramWeight,
    };
