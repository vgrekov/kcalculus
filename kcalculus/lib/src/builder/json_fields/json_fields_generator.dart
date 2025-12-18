// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kcalculus/utils/json_fields/annotations/json_fields.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:source_gen/source_gen.dart';

class JsonFieldsGenerator extends GeneratorForAnnotation<JsonFields> {
  final _jsonKeyChecker = TypeChecker.typeNamed(JsonKey);

  @override
  Future<String?> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) return null;

    final libName = buildStep.inputId.pathSegments.last;

    final className = element.name;

    final templateAsset = AssetId(
      'kcalculus',
      'lib/src/builder/json_fields/templates/json_fields.dart.mustache',
    );

    final content = await buildStep.readAsString(templateAsset);

    final template = Template(content);

    return template.renderString({
      'lib_name': libName,
      'class_name': className,
      'fields': _readJsonFields(element).entries.map(
        (e) => {
          'fieldName': e.key,
          'jsonFieldName': e.value,
        },
      ),
    });
  }

  Map<String, String> _readJsonFields(ClassElement classElement) {
    final resolved = <String, String>{};

    _resolveConstructorParams(classElement, resolved);
    _resolveFields(classElement, resolved);

    return resolved;
  }

  void _resolveConstructorParams(
    ClassElement classElement,
    Map<String, String> resolved,
  ) {
    for (final constructor in classElement.constructors) {
      for (final param in constructor.formalParameters) {
        final fieldName = param.name;
        if (fieldName == null) continue;

        final jsonKeyName = _readJsonKeyName(param);

        if (jsonKeyName != null) {
          resolved[fieldName] = jsonKeyName;
        } else {
          resolved.putIfAbsent(
            fieldName,
            () => jsonKeyName ?? fieldName,
          );
        }
      }
    }
  }

  void _resolveFields(
    ClassElement classElement,
    Map<String, String> resolved,
  ) {
    for (final field in classElement.fields) {
      if (field.isStatic) continue;

      final fieldName = field.name;
      if (fieldName == null) continue;

      final jsonKeyName = _readJsonKeyName(field);

      if (jsonKeyName != null) {
        resolved[fieldName] = jsonKeyName;
      } else {
        resolved.putIfAbsent(
          fieldName,
          () => jsonKeyName ?? fieldName,
        );
      }
    }
  }

  Iterable<(ElementAnnotation, DartObject)> _readElementAnnotations(
    Element element,
    TypeChecker typeChecker,
  ) sync* {
    for (final annotation in element.metadata.annotations) {
      final value = annotation.computeConstantValue();
      if (value == null) continue;

      final type = value.type;
      if (type == null) continue;

      if (typeChecker.isAssignableFromType(type)) {
        yield (annotation, value);
      }
    }
  }

  String? _readJsonKeyName(Element element) {
    final jsonKeyObj = _readElementAnnotations(
      element,
      _jsonKeyChecker,
    ).firstOrNull?.$2;

    if (jsonKeyObj == null) return null;

    final jsonKeyReader = ConstantReader(jsonKeyObj);

    final jsonKeyName = jsonKeyReader.read('name');

    return jsonKeyName.isNull ? null : jsonKeyName.stringValue;
  }
}
