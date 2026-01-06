// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';

part 'model_l2.freezed.dart';
part 'model_l2.jfields.dart';

@freezed
@JsonFields()
sealed class ModelL2 with _$ModelL2 {
  const factory ModelL2({
    String? id,
    required String name,
    @JsonKey(name: 'desc') String? description,
  }) = _ModelL2;
}
