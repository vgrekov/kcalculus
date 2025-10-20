part of 'themes.dart';

final _lightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: _kSeedColor,
);

final kLightTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: _lightColorScheme.surface,
  colorScheme: _lightColorScheme,
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
    const ListStyle(
      horizontalGap: 4,
      verticalGap: 4,
    ),
  ],
);
