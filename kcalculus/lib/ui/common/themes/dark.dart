part of 'themes.dart';

final _darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: _kSeedColor,
);

final kDarkTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: _darkColorScheme.surface,
  colorScheme: _darkColorScheme,
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
      fatColor: Color.fromARGB(255, 188, 205, 134),
      carbsColor: Color.fromARGB(255, 255, 76, 3),
      proteinColor: Color.fromARGB(255, 202, 3, 70),
    ),
  ],
);
