// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kcalculus/utils/json_fields/annotations/json_fields.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:source_gen/source_gen.dart';

class JsonFieldsGenerator extends GeneratorForAnnotation<JsonFields> {
  final _jsonFieldsChecker = TypeChecker.typeNamed(JsonFields);

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

    final fields = _readJsonFields(element);

    return template.renderString({
      'lib_name': libName,
      'class_name': className,
      'fields': fields.entries.indexed.map(
        (e) => {
          'name': e.$2.key,
          'json_name': e.$2.value.jsonName,
          'json_fields_class': e.$2.value.jsonFieldsClassName,
          'json_fields_class_found': e.$2.value.jsonFieldsClassName != null,
          'first': e.$1 == 0,
          'last': e.$1 == fields.length - 1,
        },
      ),
    });
  }

  Map<String, _JsonField> _readJsonFields(ClassElement classElement) {
    final resolved = <String, _JsonField>{};

    _resolveConstructorParams(classElement, resolved);
    _resolveFields(classElement, resolved);

    return resolved;
  }

  void _resolveConstructorParams(
    ClassElement classElement,
    Map<String, _JsonField> resolved,
  ) {
    for (final constructor in classElement.constructors) {
      for (final param in constructor.formalParameters) {
        _resolveElement(param, resolved);
      }
    }
  }

  void _resolveFields(
    ClassElement classElement,
    Map<String, _JsonField> resolved,
  ) {
    for (final field in classElement.fields) {
      if (field.isStatic) continue;

      _resolveElement(field, resolved);
    }
  }

  void _resolveElement(
    VariableElement element,
    Map<String, _JsonField> resolved,
  ) {
    final fieldName = element.name;
    if (fieldName == null) return;

    final jsonKeyName = _readJsonKeyName(element);
    final jsonFieldsClassName = _jsonFieldsClassName(element);

    if (jsonKeyName != null) {
      resolved[fieldName] = _JsonField(
        jsonName: jsonKeyName,
        jsonFieldsClassName: jsonFieldsClassName,
      );
    } else {
      resolved.putIfAbsent(
        fieldName,
        () => _JsonField(
          jsonName: jsonKeyName ?? fieldName,
          jsonFieldsClassName: jsonFieldsClassName,
        ),
      );
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

  String? _jsonFieldsClassName(VariableElement element) {
    final typeElement = element.type.element;

    if (typeElement != null) {
      final hasJsonFieldsAnnotation = _jsonFieldsChecker.hasAnnotationOfExact(
        typeElement,
        throwOnUnresolved: false,
      );

      if (hasJsonFieldsAnnotation) {
        return typeElement.name;
      }
    }

    return null;
  }
}

class _JsonField {
  const _JsonField({
    required this.jsonName,
    this.jsonFieldsClassName,
  });

  final String jsonName;

  final String? jsonFieldsClassName;
}
