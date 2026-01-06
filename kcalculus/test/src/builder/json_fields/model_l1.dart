// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';

import 'model_l2.dart';

part 'model_l1.freezed.dart';
part 'model_l1.jfields.dart';

@freezed
@JsonFields()
sealed class ModelL1 with _$ModelL1 {
  const factory ModelL1({
    String? id,
    required String name,
    @JsonKey(name: 'desc') String? description,
    ModelL2? child,
  }) = _ModelL1;
}
