import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'portion_edit_ui_state.freezed.dart';

@freezed
class PortionEditUiState with _$PortionEditUiState {
  const PortionEditUiState._();

  const factory PortionEditUiState({
    Edible? edible,
    Unit? amountUnit,
    double? amountValue,
  }) = _PortionEditUiState;

  Amount? getAmount() {
    if (amountUnit != null && amountValue != null) {
      return Amount(
        unit: amountUnit!,
        value: amountValue!,
      );
    }

    return null;
  }
}
