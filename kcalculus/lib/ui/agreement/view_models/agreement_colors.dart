import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agreement_colors.freezed.dart';

@freezed
sealed class AgreementColors with _$AgreementColors {
  const factory AgreementColors({
    required Color backgroundColor,
    required Color textColor,
  }) = _AgreementColors;
}
