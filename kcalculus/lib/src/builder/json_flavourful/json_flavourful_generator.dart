// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kcalculus/utils/json_flavourful/annotations/json_flavoured_base.dart';
import 'package:kcalculus/utils/json_flavourful/annotations/json_flavourful.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:source_gen/source_gen.dart';

class JsonFlavourfulGenerator extends GeneratorForAnnotation<JsonFlavourful> {
  final _jsonKeyChecker = TypeChecker.typeNamed(JsonKey);

  final _jsonFlavouredChecker = TypeChecker.typeNamed(JsonFlavouredBase);

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
      'flavoured_fields': _readJsonFlavouredFields(element).map(
        (f) => {
          'name': f.name,
          'json_name': f.jsonName,
          'annotation': _annotationObjectSource(f.annotation),
        },
      ),
    });
  }

  Iterable<_FlavouredField> _readJsonFlavouredFields(
    ClassElement classElement,
  ) {
    final resolved = <String, _FlavouredField>{};

    _resolveJsonFlavouredConstructorParams(classElement, resolved);
    _resolveJsonFlavouredFields(classElement, resolved);

    return resolved.values;
  }

  void _resolveJsonFlavouredConstructorParams(
    ClassElement classElement,
    Map<String, _FlavouredField> resolved,
  ) {
    for (final constructor in classElement.constructors) {
      for (final param in constructor.formalParameters) {
        _resolveJsonFlavouredField(param, resolved);
      }
    }
  }

  void _resolveJsonFlavouredFields(
    ClassElement classElement,
    Map<String, _FlavouredField> resolved,
  ) {
    for (final field in classElement.fields) {
      if (field.isStatic) continue;

      _resolveJsonFlavouredField(field, resolved);
    }
  }

  void _resolveJsonFlavouredField(
    VariableElement element,
    Map<String, _FlavouredField> resolved,
  ) {
    final name = element.name;
    if (name == null) return;

    final annotation = _readElementAnnotations(
      element,
      _jsonFlavouredChecker,
    ).firstOrNull;
    if (annotation == null) return;

    final jsonName = _readJsonFieldName(element);
    if (jsonName == null) return;

    resolved.putIfAbsent(
      jsonName,
      () => _FlavouredField(
        name: name,
        jsonName: jsonName,
        annotation: annotation.$1,
      ),
    );
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

class _FlavouredField {
  const _FlavouredField({
    required this.name,
    required this.jsonName,
    required this.annotation,
  });

  final String name;

  final String jsonName;

  final ElementAnnotation annotation;
}
