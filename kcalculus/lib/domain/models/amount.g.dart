// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Amount _$AmountFromJson(Map<String, dynamic> json) => _Amount(
      unit: $enumDecode(_$UnitEnumMap, json['unit']),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$AmountToJson(_Amount instance) => <String, dynamic>{
      'unit': _$UnitEnumMap[instance.unit]!,
      'value': instance.value,
    };

const _$UnitEnumMap = {
  Unit.calorie: 'calorie',
  Unit.piece: 'piece',
  Unit.gram: 'gram',
  Unit.kilogram: 'kilogram',
  Unit.milligram: 'milligram',
  Unit.microgram: 'microgram',
  Unit.litre: 'litre',
  Unit.millilitre: 'millilitre',
  Unit.pound: 'pound',
  Unit.ounce: 'ounce',
  Unit.teaSpoon: 'teaSpoon',
  Unit.tableSpoon: 'tableSpoon',
  Unit.fluidOunce: 'fluidOunce',
  Unit.cup: 'cup',
  Unit.pint: 'pint',
  Unit.quart: 'quart',
  Unit.gallon: 'gallon',
  Unit.teaSpoonUS: 'teaSpoonUS',
  Unit.tableSpoonUS: 'tableSpoonUS',
  Unit.fluidOunceUS: 'fluidOunceUS',
  Unit.pintUS: 'pintUS',
  Unit.quartUS: 'quartUS',
  Unit.gallonUS: 'gallonUS',
  Unit.cupUSLegal: 'cupUSLegal',
  Unit.cupUSCustomary: 'cupUSCustomary',
};
