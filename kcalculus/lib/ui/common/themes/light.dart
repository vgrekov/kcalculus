import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcalculus/ui/common/themes/macro_nutrients.dart';

final _colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 187, 153, 237),
  surface: const Color.fromARGB(255, 219, 217, 223),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: _colorScheme.surface,
  colorScheme: _colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    const MacroNutrientsTheme(
      fatColor: Color.fromARGB(255, 92, 100, 64),
      carbsColor: Color.fromARGB(255, 141, 50, 14),
      fiberColor: Color.fromARGB(255, 117, 121, 11),
      proteinColor: Color.fromARGB(255, 118, 1, 40),
    ),
  ],
);
