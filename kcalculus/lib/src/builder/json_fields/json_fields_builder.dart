// ignore_for_file: depend_on_referenced_packages

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'json_fields_generator.dart';

Builder jsonFieldsBuilder(BuilderOptions options) => LibraryBuilder(
  JsonFieldsGenerator(),
  generatedExtension: '.jfields.dart',
);
