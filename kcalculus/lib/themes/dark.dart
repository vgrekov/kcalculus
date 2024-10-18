import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcalculus/themes/macro_nutrients.dart';

final _colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  surface: const Color.fromARGB(255, 56, 49, 66),
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
      // fatColor: Color.fromARGB(255, 88, 124, 18),
      // fatColor: Color.fromARGB(255, 202, 207, 17),
      fatColor: Color.fromARGB(255, 188, 205, 134),
      carbsColor: Color.fromARGB(255, 255, 76, 3),
      // fiberColor: Color.fromARGB(255, 202, 207, 17),
      fiberColor: Color.fromARGB(255, 202, 207, 17),
      proteinColor: Color.fromARGB(255, 202, 3, 70),
      // fatColor: Color.fromARGB(255, 202, 207, 17),
      // carbsColor: Color.fromARGB(255, 255, 240, 1),
      // fiberColor: Color.fromARGB(255, 188, 205, 134),
      // proteinColor: Color.fromARGB(255, 254, 165, 167),
    ),
  ],
);
