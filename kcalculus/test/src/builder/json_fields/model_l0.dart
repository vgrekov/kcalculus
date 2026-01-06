// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';

import 'model_l1.dart';
import 'model_l2.dart';

part 'model_l0.freezed.dart';
part 'model_l0.jfields.dart';

@freezed
@JsonFields()
sealed class ModelL0 with _$ModelL0 {
  const factory ModelL0({
    String? id,
    required String name,
    @JsonKey(name: 'desc') String? description,
    ModelL1? child,
    @JsonKey(name: 'grand_child') ModelL2? grandChild,
  }) = _ModelL0;
}
