// ignore_for_file: depend_on_referenced_packages

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'json_flavourful_generator.dart';

Builder jsonFlavourfulBuilder(BuilderOptions options) => LibraryBuilder(
  JsonFlavourfulGenerator(),
  generatedExtension: '.jflav.dart',
);
