part of 'themes.dart';

final _lightColorScheme = _buildColorScheme(
  brightness: Brightness.light,
  surface: Color(0xFFE5DCC5),
  onSurface: Color(0xFF181F1C),
  primary: Color(0xFFEA7317),
  secondary: Color(0xFF649071),
  tertiary: Color(0xFF3E8989),
);

final kLightTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: _lightColorScheme.surface,
  colorScheme: _lightColorScheme,
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
    backgroundColor: _lightColorScheme.primary,
    foregroundColor: _lightColorScheme.onPrimary,
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
