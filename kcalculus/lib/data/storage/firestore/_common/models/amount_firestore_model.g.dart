// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AmountFirestoreModel _$AmountFirestoreModelFromJson(
  Map<String, dynamic> json,
) => _AmountFirestoreModel(
  unit: json['unit'] as String,
  value: (json['value'] as num).toDouble(),
);

Map<String, dynamic> _$AmountFirestoreModelToJson(
  _AmountFirestoreModel instance,
) => <String, dynamic>{'unit': instance.unit, 'value': instance.value};
