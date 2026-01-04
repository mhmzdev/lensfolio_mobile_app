part of '../configs.dart';

final materialLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: false,
  primaryColor: _lightTheme.primaryBase,
  primaryColorDark: _lightTheme.primaryShade,
  colorScheme: ColorScheme.light(
    primary: _lightTheme.primaryBase,
    secondary: _lightTheme.secondaryBase,
    surface: _lightTheme.lightBase,
    error: _lightTheme.dangerBase,
    onPrimary: _lightTheme.neutralWhite,
    onError: _lightTheme.neutralWhite,
  ),
  scaffoldBackgroundColor: _lightTheme.neutralWhite,
  textTheme: TextTheme(
    displayLarge: TextStyle(color: _lightTheme.neutralBlack),
    displayMedium: TextStyle(color: _lightTheme.neutralBlack),
    displaySmall: TextStyle(color: _lightTheme.neutralBlack),
    headlineLarge: TextStyle(color: _lightTheme.neutralBlack),
    headlineMedium: TextStyle(color: _lightTheme.neutralBlack),
    headlineSmall: TextStyle(color: _lightTheme.neutralBlack),
    titleLarge: TextStyle(color: _lightTheme.neutralBlack),
    titleMedium: TextStyle(color: _lightTheme.neutralBlack),
    titleSmall: TextStyle(color: _lightTheme.neutralBlack),
    bodyLarge: TextStyle(color: _lightTheme.neutralBlack),
    bodyMedium: TextStyle(color: _lightTheme.neutralBlack),
    bodySmall: TextStyle(color: _lightTheme.neutralBlack),
    labelLarge: TextStyle(color: _lightTheme.lightShade),
    labelMedium: TextStyle(color: _lightTheme.lightShade),
    labelSmall: TextStyle(color: _lightTheme.lightShade),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _lightTheme.neutralBlack,
      textStyle: AppText.b1b,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: _lightTheme.neutralWhite,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _lightTheme.primaryBase,
    selectionColor: _lightTheme.primaryBase.withValues(alpha: 0.3),
    selectionHandleColor: _lightTheme.primaryBase,
  ),
);

final materialDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,
  primaryColor: _darkTheme.primaryBase,
  primaryColorDark: _darkTheme.primaryShade,
  colorScheme: ColorScheme.dark(
    primary: _darkTheme.primaryBase,
    secondary: _darkTheme.secondaryBase,
    surface: _darkTheme.darkBase,
    error: _darkTheme.dangerBase,
    onPrimary: _darkTheme.neutralWhite,
    onError: _darkTheme.neutralWhite,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _darkTheme.primaryBase,
    selectionColor: _darkTheme.primaryBase.withValues(alpha: 0.3),
    selectionHandleColor: _darkTheme.primaryBase,
  ),
  scaffoldBackgroundColor: _darkTheme.accent950,
  textTheme: TextTheme(
    displayLarge: TextStyle(color: _darkTheme.neutralWhite),
    displayMedium: TextStyle(color: _darkTheme.neutralWhite),
    displaySmall: TextStyle(color: _darkTheme.neutralWhite),
    headlineLarge: TextStyle(color: _darkTheme.neutralWhite),
    headlineMedium: TextStyle(color: _darkTheme.neutralWhite),
    headlineSmall: TextStyle(color: _darkTheme.neutralWhite),
    titleLarge: TextStyle(color: _darkTheme.neutralWhite),
    titleMedium: TextStyle(color: _darkTheme.neutralWhite),
    titleSmall: TextStyle(color: _darkTheme.neutralWhite),
    bodyLarge: TextStyle(color: _darkTheme.neutralWhite),
    bodyMedium: TextStyle(color: _darkTheme.neutralWhite),
    bodySmall: TextStyle(color: _darkTheme.neutralWhite),
    labelLarge: TextStyle(color: _darkTheme.lightShade),
    labelMedium: TextStyle(color: _darkTheme.lightShade),
    labelSmall: TextStyle(color: _darkTheme.lightShade),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _darkTheme.neutralWhite,
      textStyle: AppText.b1b,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: _darkTheme.neutralWhite,
  ),
);
