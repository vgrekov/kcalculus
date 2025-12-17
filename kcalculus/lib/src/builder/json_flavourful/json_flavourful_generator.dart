// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:kcalculus/utils/json_flavourful/annotations/json_flavoured.dart';
import 'package:kcalculus/utils/json_flavourful/annotations/json_flavourful.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:build/build.dart';

class JsonFlavourfulGenerator extends GeneratorForAnnotation<JsonFlavourful> {
  final _jsonKeyChecker = TypeChecker.typeNamed(JsonKey);

  final _jsonFlavouredChecker = TypeChecker.typeNamed(JsonFlavoured);

  @override
  Future<String?> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) return null;

    final libName = buildStep.inputId.pathSegments.last;

    final className = element.name;

    final annotationType = annotation.objectValue.type;

    String? flavourType;

    if (annotationType is InterfaceType) {
      flavourType =
          annotationType.typeArguments.firstOrNull?.element?.displayName;
    }

    final templateAsset = AssetId(
      'kcalculus',
      'lib/src/builder/json_flavourful/templates/json_flavourful_extension.dart.mustache',
    );

    final content = await buildStep.readAsString(templateAsset);

    final template = Template(content);

    return template.renderString({
      'lib_name': libName,
      'class_name': className,
      'flavour_type': flavourType,
      'flavour_type_deducted': flavourType != null,
      'flavoured_fields': _readJsonFlavouredFields(element).entries.map(
        (e) => {
          'key': e.key,
          'value': e.value,
        },
      ),
    });
  }

  Map<String, String> _readJsonFlavouredFields(ClassElement classElement) {
    final resolved = <String, ElementAnnotation>{};

    _resolveJsonFlavouredConstructorParams(classElement, resolved);
    _resolveJsonFlavouredFields(classElement, resolved);

    return {
      for (final entry in resolved.entries)
        entry.key: _annotationObjectSource(entry.value),
    };
  }

  void _resolveJsonFlavouredConstructorParams(
    ClassElement classElement,
    Map<String, ElementAnnotation> resolved,
  ) {
    for (final constructor in classElement.constructors) {
      for (final param in constructor.formalParameters) {
        final annotation = _readElementAnnotations(
          param,
          _jsonFlavouredChecker,
        ).firstOrNull;

        if (annotation == null) continue;

        final name = _readJsonFieldName(param);

        if (name == null) continue;

        resolved.putIfAbsent(
          name,
          () => annotation.$1,
        );
      }
    }
  }

  void _resolveJsonFlavouredFields(
    ClassElement classElement,
    Map<String, ElementAnnotation> resolved,
  ) {
    for (final field in classElement.fields) {
      if (field.isStatic) continue;

      final annotation = _readElementAnnotations(
        field,
        _jsonFlavouredChecker,
      ).firstOrNull;

      if (annotation == null) continue;

      final name = _readJsonFieldName(field);

      if (name == null) continue;

      resolved.putIfAbsent(
        name,
        () => annotation.$1,
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

      if (typeChecker.isExactlyType(type)) {
        yield (annotation, value);
      }
    }
  }

  String? _readJsonFieldName(Element element) {
    final jsonKeyObj = _readElementAnnotations(
      element,
      _jsonKeyChecker,
    ).firstOrNull?.$2;

    if (jsonKeyObj == null) return element.name;

    final jsonKeyReader = ConstantReader(jsonKeyObj);

    final jsonKeyName = jsonKeyReader.read('name');

    return jsonKeyName.isNull ? element.name : jsonKeyName.stringValue;
  }

  String _annotationObjectSource(ElementAnnotation annotation) {
    final source = annotation.toSource();
    return source.startsWith('@') ? source.substring(1) : source;
  }
}
