// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_portion_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsdaPortionDbModel _$UsdaPortionDbModelFromJson(Map<String, dynamic> json) =>
    _UsdaPortionDbModel(
      fdc_id: (json['fdc_id'] as num).toInt(),
      measure_unit_id: (json['measure_unit_id'] as num).toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      gram_weight: (json['gram_weight'] as num).toDouble(),
    );

Map<String, dynamic> _$UsdaPortionDbModelToJson(_UsdaPortionDbModel instance) =>
    <String, dynamic>{
      'fdc_id': instance.fdc_id,
      'measure_unit_id': instance.measure_unit_id,
      'amount': instance.amount,
      'gram_weight': instance.gram_weight,
    };
