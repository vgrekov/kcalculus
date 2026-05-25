// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';

part 'test_model.freezed.dart';
part 'test_model.g.dart';
part 'test_model.jfields.dart';

@freezed
@JsonFields()
sealed class TestModel with _$TestModel {
  const factory TestModel({
    int? id,
    String? name,
    @JsonKey(name: 'desc') String? description,
  }) = _TestModel;

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}
