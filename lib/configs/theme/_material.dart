part of '../configs.dart';

final materialLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: false,
  primaryColor: _lightTheme.primary,
  colorScheme: ColorScheme.light(
    primary: _lightTheme.primary,
    secondary: _lightTheme.secondary,
    surface: _lightTheme.background,
    error: _lightTheme.dangerBase,
    onPrimary: _lightTheme.background,
    onError: _lightTheme.background,
  ),
  scaffoldBackgroundColor: _lightTheme.background,
  textTheme: TextTheme(
    displayLarge: TextStyle(color: _lightTheme.text),
    displayMedium: TextStyle(color: _lightTheme.text),
    displaySmall: TextStyle(color: _lightTheme.text),
    headlineLarge: TextStyle(color: _lightTheme.text),
    headlineMedium: TextStyle(color: _lightTheme.text),
    headlineSmall: TextStyle(color: _lightTheme.text),
    titleLarge: TextStyle(color: _lightTheme.text),
    titleMedium: TextStyle(color: _lightTheme.text),
    titleSmall: TextStyle(color: _lightTheme.text),
    bodyLarge: TextStyle(color: _lightTheme.text),
    bodyMedium: TextStyle(color: _lightTheme.text),
    bodySmall: TextStyle(color: _lightTheme.text),
    labelLarge: TextStyle(color: _lightTheme.subText),
    labelMedium: TextStyle(color: _lightTheme.subText),
    labelSmall: TextStyle(color: _lightTheme.subText),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _lightTheme.text,
      textStyle: AppText.b1b,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: _lightTheme.background,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _lightTheme.primary,
    selectionColor: _lightTheme.primary.withValues(alpha: 0.3),
    selectionHandleColor: _lightTheme.primary,
  ),
);

final materialDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,
  primaryColor: _darkTheme.primary,
  colorScheme: ColorScheme.dark(
    primary: _darkTheme.primary,
    secondary: _darkTheme.secondary,
    surface: _darkTheme.background,
    error: _darkTheme.dangerBase,
    onPrimary: _darkTheme.background,
    onError: _darkTheme.background,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _darkTheme.primary,
    selectionColor: _darkTheme.primary.withValues(alpha: 0.3),
    selectionHandleColor: _darkTheme.primary,
  ),
  scaffoldBackgroundColor: _darkTheme.background,
  textTheme: TextTheme(
    displayLarge: TextStyle(color: _darkTheme.text),
    displayMedium: TextStyle(color: _darkTheme.text),
    displaySmall: TextStyle(color: _darkTheme.text),
    headlineLarge: TextStyle(color: _darkTheme.text),
    headlineMedium: TextStyle(color: _darkTheme.text),
    headlineSmall: TextStyle(color: _darkTheme.text),
    titleLarge: TextStyle(color: _darkTheme.text),
    titleMedium: TextStyle(color: _darkTheme.text),
    titleSmall: TextStyle(color: _darkTheme.text),
    bodyLarge: TextStyle(color: _darkTheme.text),
    bodyMedium: TextStyle(color: _darkTheme.text),
    bodySmall: TextStyle(color: _darkTheme.text),
    labelLarge: TextStyle(color: _darkTheme.subText),
    labelMedium: TextStyle(color: _darkTheme.subText),
    labelSmall: TextStyle(color: _darkTheme.subText),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _darkTheme.text,
      textStyle: AppText.b1b,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: _darkTheme.background,
  ),
);
