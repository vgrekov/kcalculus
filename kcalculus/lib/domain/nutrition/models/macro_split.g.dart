// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macro_split.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MacroSplit _$MacroSplitFromJson(Map<String, dynamic> json) => _MacroSplit(
  fatPercentage: (json['fatPercentage'] as num).toDouble(),
  carbsPercentage: (json['carbsPercentage'] as num).toDouble(),
  proteinPercentage: (json['proteinPercentage'] as num).toDouble(),
);

Map<String, dynamic> _$MacroSplitToJson(_MacroSplit instance) =>
    <String, dynamic>{
      'fatPercentage': instance.fatPercentage,
      'carbsPercentage': instance.carbsPercentage,
      'proteinPercentage': instance.proteinPercentage,
    };
