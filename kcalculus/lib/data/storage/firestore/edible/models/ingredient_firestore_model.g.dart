// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientFirestoreModel _$IngredientFirestoreModelFromJson(
  Map<String, dynamic> json,
) => _IngredientFirestoreModel(
  edibleId: json['edibleId'] as String,
  amount: AmountFirestoreModel.fromJson(json['amount'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IngredientFirestoreModelToJson(
  _IngredientFirestoreModel instance,
) => <String, dynamic>{
  'edibleId': instance.edibleId,
  'amount': instance.amount.toJson(),
};
