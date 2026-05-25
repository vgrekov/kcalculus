import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/themes/macro_nutrients.dart';

part 'dark.dart';
part 'light.dart';

final _kTextTheme = GoogleFonts.ubuntuCondensedTextTheme();

ColorScheme _buildColorScheme({
  required Brightness brightness,
  required Color surface,
  required Color onSurface,
  required Color primary,
  required Color secondary,
  required Color tertiary,
}) {
  final primaryScheme = ColorScheme.fromSeed(
    seedColor: primary,
    brightness: brightness,
  );

  final secondaryScheme = ColorScheme.fromSeed(
    seedColor: secondary,
    brightness: brightness,
  );

  final tertiaryScheme = ColorScheme.fromSeed(
    seedColor: tertiary,
    brightness: brightness,
  );

  final neutralScheme = ColorScheme.fromSeed(
    seedColor: surface,
    brightness: brightness,
  );

  return neutralScheme.copyWith(
    onSurface: onSurface,

    primary: primary,
    onPrimary: primaryScheme.onPrimary,
    primaryContainer: primaryScheme.primaryContainer,
    onPrimaryContainer: primaryScheme.onPrimaryContainer,

    secondary: secondary,
    onSecondary: secondaryScheme.onSecondary,
    secondaryContainer: secondaryScheme.secondaryContainer,
    onSecondaryContainer: secondaryScheme.onSecondaryContainer,

    tertiary: tertiary,
    onTertiary: tertiaryScheme.onTertiary,
    tertiaryContainer: tertiaryScheme.tertiaryContainer,
    onTertiaryContainer: tertiaryScheme.onTertiaryContainer,
  );
}
