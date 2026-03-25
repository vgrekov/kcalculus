part of 'themes.dart';

final _darkColorScheme = _buildColorScheme(
  brightness: Brightness.dark,
  surface: Color(0xFF181F1C),
  onSurface: Color(0xFFE5DCC5),
  primary: Color(0xFFEA7317),
  secondary: Color(0xFF649071),
  tertiary: Color(0xFF3E8989),
);

final kDarkTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: _darkColorScheme.surface,
  colorScheme: _darkColorScheme,
  textTheme: _kTextTheme.copyWith(
    titleSmall: _kTextTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: _kTextTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: _kTextTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.bold,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: _darkColorScheme.primary,
    foregroundColor: _darkColorScheme.onPrimary,
  ),
  extensions: <ThemeExtension<dynamic>>[
    const MacroNutrientsTheme(
      fatColor: Color(0xFFFFCA28),
      carbsColor: Color(0xFF4CAF50),
      proteinColor: Color(0xFFEF5350),
    ),
    ListStyle(
      itemBorderRadius: BorderRadiusGeometry.circular(8),
      horizontalGap: 8,
      verticalGap: 8,
    ),
  ],
);
