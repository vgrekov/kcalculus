// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeType = const String.fromEnvironment('theme').toLowerCase();
  ColorScheme scheme;
  switch (themeType) {
    case 'light':
      scheme = kLightTheme.colorScheme;
      break;
    case 'dark':
      scheme = kDarkTheme.colorScheme;
      break;
    default:
      print(
        '❌ Please specify a correct theme type using --dart-define=theme=[light|dark]',
      );
      return;
  }

  final outputPath = const String.fromEnvironment('output');
  if (outputPath.isEmpty) {
    print(
      '❌ Please specify a destination using --dart-define=output=path/to/file.json',
    );
    return;
  }

  final json = _colorSchemeToJson(scheme);

  final prettyStr = const JsonEncoder.withIndent('  ').convert(json);

  try {
    final targetFile = File(outputPath);

    await targetFile.parent.create(recursive: true);

    await targetFile.writeAsString(prettyStr);

    print('✅ Theme [$themeType] written to: ${targetFile.absolute.path}');
  } catch (e) {
    print('❌ Failed to write file to disk: $e');
  }
}

Map<String, dynamic> _colorSchemeToJson(ColorScheme scheme) => {
  'brightness': scheme.brightness.name,

  'primary': _colorToHex(scheme.primary),
  'onPrimary': _colorToHex(scheme.onPrimary),
  'primaryContainer': _colorToHex(scheme.primaryContainer),
  'onPrimaryContainer': _colorToHex(scheme.onPrimaryContainer),

  'secondary': _colorToHex(scheme.secondary),
  'onSecondary': _colorToHex(scheme.onSecondary),
  'secondaryContainer': _colorToHex(scheme.secondaryContainer),
  'onSecondaryContainer': _colorToHex(scheme.onSecondaryContainer),

  'tertiary': _colorToHex(scheme.tertiary),
  'onTertiary': _colorToHex(scheme.onTertiary),
  'tertiaryContainer': _colorToHex(scheme.tertiaryContainer),
  'onTertiaryContainer': _colorToHex(scheme.onTertiaryContainer),

  'error': _colorToHex(scheme.error),
  'onError': _colorToHex(scheme.onError),
  'errorContainer': _colorToHex(scheme.errorContainer),
  'onErrorContainer': _colorToHex(scheme.onErrorContainer),

  'surface': _colorToHex(scheme.surface),
  'onSurface': _colorToHex(scheme.onSurface),
  'surfaceDim': _colorToHex(scheme.surfaceDim),
  'surfaceBright': _colorToHex(scheme.surfaceBright),
  'surfaceContainerLowest': _colorToHex(scheme.surfaceContainerLowest),
  'surfaceContainerLow': _colorToHex(scheme.surfaceContainerLow),
  'surfaceContainer': _colorToHex(scheme.surfaceContainer),
  'surfaceContainerHigh': _colorToHex(scheme.surfaceContainerHigh),
  'surfaceContainerHighest': _colorToHex(scheme.surfaceContainerHighest),
  'onSurfaceVariant': _colorToHex(scheme.onSurfaceVariant),

  'outline': _colorToHex(scheme.outline),
  'outlineVariant': _colorToHex(scheme.outlineVariant),
  'shadow': _colorToHex(scheme.shadow),
  'scrim': _colorToHex(scheme.scrim),
  'inverseSurface': _colorToHex(scheme.inverseSurface),
  'onInverseSurface': _colorToHex(scheme.onInverseSurface),
  'inversePrimary': _colorToHex(scheme.inversePrimary),
  'surfaceTint': _colorToHex(scheme.surfaceTint),

  'primaryFixed': _colorToHex(scheme.primaryFixed),
  'primaryFixedDim': _colorToHex(scheme.primaryFixedDim),
  'onPrimaryFixed': _colorToHex(scheme.onPrimaryFixed),
  'onPrimaryFixedVariant': _colorToHex(scheme.onPrimaryFixedVariant),
  'secondaryFixed': _colorToHex(scheme.secondaryFixed),
  'secondaryFixedDim': _colorToHex(scheme.secondaryFixedDim),
  'onSecondaryFixed': _colorToHex(scheme.onSecondaryFixed),
  'onSecondaryFixedVariant': _colorToHex(scheme.onSecondaryFixedVariant),
  'tertiaryFixed': _colorToHex(scheme.tertiaryFixed),
  'tertiaryFixedDim': _colorToHex(scheme.tertiaryFixedDim),
  'onTertiaryFixed': _colorToHex(scheme.onTertiaryFixed),
  'onTertiaryFixedVariant': _colorToHex(scheme.onTertiaryFixedVariant),
};

String _colorToHex(Color color) {
  return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}';
}
