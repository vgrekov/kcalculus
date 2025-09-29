import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';

part 'amount_firestore_model.freezed.dart';
part 'amount_firestore_model.g.dart';

@freezed
sealed class AmountFirestoreModel with _$AmountFirestoreModel {
  const AmountFirestoreModel._();

  const factory AmountFirestoreModel({
    required String unit,
    required double value,
  }) = _AmountFirestoreModel;

  factory AmountFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$AmountFirestoreModelFromJson(json);

  factory AmountFirestoreModel.fromDomain(Amount model) => AmountFirestoreModel(
        unit: model.unit.name,
        value: model.value,
      );

  Amount toDomain() => Amount(
        unit: Unit.of(unit),
        value: value,
      );
}
