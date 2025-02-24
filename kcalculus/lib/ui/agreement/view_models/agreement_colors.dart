import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agreement_colors.freezed.dart';

@freezed
class AgreementColors with _$AgreementColors {
  const factory AgreementColors({
    required Color backgroundColor,
    required Color textColor,
  }) = _AgreementColors;
}
