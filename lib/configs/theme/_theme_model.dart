part of '../configs.dart';

class _ThemeModel {
  final Color primary;
  final Color primaryBase;
  final Color primaryShade;
  final Color primaryTint;
  final Color primary900;
  final Color primary800;
  final Color primary600;
  final Color primary500;
  final Color primary400;
  final Color primary200;
  final Color primary100;
  final Color primary50;

  final Color accent950;
  final Color accent900;
  final Color accent850;
  final Color accent800;
  final Color accent750;
  final Color accent700;
  final Color accent650;
  final Color accent600;
  final Color accent550;
  final Color accent500;
  final Color accent450;
  final Color accent400;
  final Color accent350;
  final Color accent300;
  final Color accent250;
  final Color accent200;
  final Color accent150;
  final Color accent100;
  final Color accent50;
  final Color accent30;

  final Color neutral950;
  final Color neutral900;
  final Color neutral850;
  final Color neutral800;
  final Color neutral750;
  final Color neutral700;
  final Color neutral650;
  final Color neutral600;
  final Color neutral550;
  final Color neutral500;
  final Color neutral450;
  final Color neutral400;
  final Color neutral350;
  final Color neutral300;
  final Color neutral250;
  final Color neutral200;
  final Color neutral150;
  final Color neutral100;
  final Color neutral50;
  final Color neutral30;

  final Color secondaryBase;
  final Color secondaryShade;
  final Color secondaryTint;
  final Color secondary900;
  final Color secondary800;
  final Color secondary700;
  final Color secondary500;
  final Color secondary400;
  final Color secondary300;
  final Color secondary50;

  final Color tertiaryBase;
  final Color tertiaryShade;
  final Color tertiaryTint;
  final Color tertiary900;
  final Color tertiary600;

  final Color tertiary500;
  final Color tertiary300;
  final Color tertiary200;
  final Color tertiary100;
  final Color tertiary50;

  final Color successBase;
  final Color successShade;
  final Color successTint;
  final Color success900;
  final Color success800;
  final Color success700;
  final Color success500;
  final Color success400;
  final Color success100;
  final Color success50;

  final Color warningBase;
  final Color warningShade;
  final Color warningTint;
  final Color warning900;
  final Color warning600;
  final Color warning500;
  final Color warning400;
  final Color warning300;
  final Color warning200;
  final Color warning100;
  final Color warning50;

  final Color dangerBase;
  final Color dangerShade;
  final Color dangerTint;
  final Color danger900;
  final Color danger600;
  final Color danger500;
  final Color danger400;
  final Color danger300;
  final Color danger200;
  final Color danger100;
  final Color danger50;

  final Color neutralBlack;
  final Color neutralWhite;

  final Color lightBase;
  final Color lightShade;
  final Color lightTint;

  final Color mediumBase;
  final Color mediumShade;
  final Color mediumTint;

  final Color darkBase;
  final Color darkShade;
  final Color darkTint;

  final Color bronze;

  final LinearGradient primaryGradient;
  final LinearGradient accentGradient;
  final LinearGradient neutralAccGradient;

  const _ThemeModel({
    required this.primary,
    required this.primaryBase,
    required this.primaryShade,
    required this.primaryTint,
    required this.primary900,
    required this.primary800,
    required this.primary600,
    required this.primary500,
    required this.primary400,
    required this.primary200,
    required this.primary100,
    required this.primary50,
    required this.accent950,
    required this.accent900,
    required this.accent850,
    required this.accent800,
    required this.accent750,
    required this.accent700,
    required this.accent650,
    required this.accent600,
    required this.accent550,
    required this.accent500,
    required this.accent450,
    required this.accent400,
    required this.accent350,
    required this.accent300,
    required this.accent250,
    required this.accent200,
    required this.accent150,
    required this.accent100,
    required this.accent50,
    required this.accent30,
    required this.neutral950,
    required this.neutral900,
    required this.neutral850,
    required this.neutral800,
    required this.neutral750,
    required this.neutral700,
    required this.neutral650,
    required this.neutral600,
    required this.neutral550,
    required this.neutral500,
    required this.neutral450,
    required this.neutral400,
    required this.neutral350,
    required this.neutral300,
    required this.neutral250,
    required this.neutral200,
    required this.neutral150,
    required this.neutral100,
    required this.neutral50,
    required this.neutral30,
    required this.secondaryBase,
    required this.secondaryShade,
    required this.secondaryTint,
    required this.secondary900,
    required this.secondary800,
    required this.secondary700,
    required this.secondary500,
    required this.secondary400,
    required this.secondary300,
    required this.secondary50,
    required this.tertiaryBase,
    required this.tertiaryShade,
    required this.tertiaryTint,
    required this.tertiary900,
    required this.tertiary600,
    required this.tertiary500,
    required this.tertiary300,
    required this.tertiary200,
    required this.tertiary100,
    required this.tertiary50,
    required this.successBase,
    required this.successShade,
    required this.successTint,
    required this.success900,
    required this.success800,
    required this.success700,
    required this.success500,
    required this.success400,
    required this.success100,
    required this.success50,
    required this.warningBase,
    required this.warningShade,
    required this.warningTint,
    required this.warning900,
    required this.warning600,
    required this.warning500,
    required this.warning400,
    required this.warning300,
    required this.warning200,
    required this.warning100,
    required this.warning50,
    required this.dangerBase,
    required this.dangerShade,
    required this.dangerTint,
    required this.danger900,
    required this.danger600,
    required this.danger500,
    required this.danger400,
    required this.danger300,
    required this.danger200,
    required this.danger100,
    required this.danger50,
    required this.neutralBlack,
    required this.neutralWhite,
    required this.lightBase,
    required this.lightShade,
    required this.lightTint,
    required this.mediumBase,
    required this.mediumShade,
    required this.mediumTint,
    required this.darkBase,
    required this.darkShade,
    required this.darkTint,
    required this.bronze,
    required this.primaryGradient,
    required this.accentGradient,
    required this.neutralAccGradient,
  });

  _ThemeModel copyWith({
    Color? primary,
    Color? primaryBase,
    Color? primaryShade,
    Color? primaryTint,
    Color? primary900,
    Color? primary800,
    Color? primary600,
    Color? primary500,
    Color? primary400,
    Color? primary200,
    Color? primary100,
    Color? primary50,
    Color? accentBase,
    Color? accentShade,
    Color? accent950,
    Color? accent900,
    Color? accent850,
    Color? accent800,
    Color? accent750,
    Color? accent700,
    Color? accent650,
    Color? accent600,
    Color? accent550,
    Color? accent500,
    Color? accent450,
    Color? accent400,
    Color? accent350,
    Color? accent300,
    Color? accent250,
    Color? accent200,
    Color? accent150,
    Color? accent100,
    Color? accent50,
    Color? accent30,
    Color? accentTint,
    Color? neutral950,
    Color? neutral900,
    Color? neutral850,
    Color? neutral800,
    Color? neutral750,
    Color? neutral700,
    Color? neutral650,
    Color? neutral600,
    Color? neutral550,
    Color? neutral500,
    Color? neutral450,
    Color? neutral400,
    Color? neutral350,
    Color? neutral300,
    Color? neutral250,
    Color? neutral200,
    Color? neutral150,
    Color? neutral100,
    Color? neutral50,
    Color? neutral30,
    Color? secondaryBase,
    Color? secondaryShade,
    Color? secondaryTint,
    Color? secondary900,
    Color? secondary800,
    Color? secondary700,
    Color? secondary500,
    Color? secondary400,
    Color? secondary300,
    Color? secondary50,
    Color? tertiaryBase,
    Color? tertiaryShade,
    Color? tertiaryTint,
    Color? tertiary900,
    Color? tertiary600,
    Color? tertiary500,
    Color? tertiary300,
    Color? tertiary200,
    Color? tertiary100,
    Color? tertiary50,
    Color? successBase,
    Color? successShade,
    Color? successTint,
    Color? success900,
    Color? success800,
    Color? success700,
    Color? success500,
    Color? success400,
    Color? success100,
    Color? success50,
    Color? warningBase,
    Color? warningShade,
    Color? warningTint,
    Color? warning900,
    Color? warning600,
    Color? warning500,
    Color? warning400,
    Color? warning300,
    Color? warning200,
    Color? warning100,
    Color? warning50,
    Color? dangerBase,
    Color? dangerShade,
    Color? dangerTint,
    Color? danger900,
    Color? danger600,
    Color? danger500,
    Color? danger400,
    Color? danger300,
    Color? danger200,
    Color? danger100,
    Color? danger50,
    Color? neutralBlack,
    Color? neutralWhite,
    Color? lightBase,
    Color? lightShade,
    Color? lightTint,
    Color? mediumBase,
    Color? mediumShade,
    Color? mediumTint,
    Color? darkBase,
    Color? darkShade,
    Color? darkTint,
    Color? bronze,
    LinearGradient? primaryGradient,
    LinearGradient? accentGradient,
    LinearGradient? neutralAccGradient,
  }) {
    return _ThemeModel(
      primary: primary ?? this.primary,
      primaryBase: primaryBase ?? this.primaryBase,
      primaryShade: primaryShade ?? this.primaryShade,
      primaryTint: primaryTint ?? this.primaryTint,
      primary900: primary900 ?? this.primary900,
      primary800: primary800 ?? this.primary800,
      primary600: primary600 ?? this.primary600,
      primary500: primary500 ?? this.primary500,
      primary400: primary400 ?? this.primary400,
      primary200: primary200 ?? this.primary200,
      primary100: primary100 ?? this.primary100,
      primary50: primary50 ?? this.primary50,
      accent950: accent950 ?? this.accent950,
      accent900: accent900 ?? this.accent900,
      accent850: accent850 ?? this.accent850,
      accent800: accent800 ?? this.accent800,
      accent750: accent750 ?? this.accent750,
      accent700: accent700 ?? this.accent700,
      accent650: accent650 ?? this.accent650,
      accent600: accent600 ?? this.accent600,
      accent550: accent550 ?? this.accent550,
      accent500: accent500 ?? this.accent500,
      accent450: accent450 ?? this.accent450,
      accent400: accent400 ?? this.accent400,
      accent350: accent350 ?? this.accent350,
      accent300: accent300 ?? this.accent300,
      accent250: accent250 ?? this.accent250,
      accent200: accent200 ?? this.accent200,
      accent150: accent150 ?? this.accent150,
      accent100: accent100 ?? this.accent100,
      accent50: accent50 ?? this.accent50,
      accent30: accent30 ?? this.accent30,
      neutral950: neutral950 ?? this.neutral950,
      neutral900: neutral900 ?? this.neutral900,
      neutral850: neutral850 ?? this.neutral850,
      neutral800: neutral800 ?? this.neutral800,
      neutral750: neutral750 ?? this.neutral750,
      neutral700: neutral700 ?? this.neutral700,
      neutral650: neutral650 ?? this.neutral650,
      neutral600: neutral600 ?? this.neutral600,
      neutral550: neutral550 ?? this.neutral550,
      neutral500: neutral500 ?? this.neutral500,
      neutral450: neutral450 ?? this.neutral450,
      neutral400: neutral400 ?? this.neutral400,
      neutral350: neutral350 ?? this.neutral350,
      neutral300: neutral300 ?? this.neutral300,
      neutral250: neutral250 ?? this.neutral250,
      neutral200: neutral200 ?? this.neutral200,
      neutral150: neutral150 ?? this.neutral150,
      neutral100: neutral100 ?? this.neutral100,
      neutral50: neutral50 ?? this.neutral50,
      neutral30: neutral30 ?? this.neutral30,
      secondaryBase: secondaryBase ?? this.secondaryBase,
      secondaryShade: secondaryShade ?? this.secondaryShade,
      secondaryTint: secondaryTint ?? this.secondaryTint,
      secondary900: secondary900 ?? this.secondary900,
      secondary800: secondary800 ?? this.secondary800,
      secondary700: secondary700 ?? this.secondary700,
      secondary500: secondary500 ?? this.secondary500,
      secondary400: secondary400 ?? this.secondary400,
      secondary300: secondary300 ?? this.secondary300,
      secondary50: secondary50 ?? this.secondary50,
      tertiaryBase: tertiaryBase ?? this.tertiaryBase,
      tertiaryShade: tertiaryShade ?? this.tertiaryShade,
      tertiaryTint: tertiaryTint ?? this.tertiaryTint,
      tertiary900: tertiary900 ?? this.tertiary900,
      tertiary600: tertiary600 ?? this.tertiary600,
      tertiary500: tertiary500 ?? this.tertiary500,
      tertiary300: tertiary300 ?? this.tertiary300,
      tertiary200: tertiary200 ?? this.tertiary200,
      tertiary100: tertiary100 ?? this.tertiary100,
      tertiary50: tertiary50 ?? this.tertiary50,
      successBase: successBase ?? this.successBase,
      successShade: successShade ?? this.successShade,
      successTint: successTint ?? this.successTint,
      success900: success900 ?? this.success900,
      success800: success800 ?? this.success800,
      success700: success700 ?? this.success700,
      success500: success500 ?? this.success500,
      success400: success400 ?? this.success400,
      success100: success100 ?? this.success100,
      success50: success50 ?? this.success50,
      warningBase: warningBase ?? this.warningBase,
      warningShade: warningShade ?? this.warningShade,
      warningTint: warningTint ?? this.warningTint,
      warning900: warning900 ?? this.warning900,
      warning600: warning600 ?? this.warning600,
      warning500: warning500 ?? this.warning500,
      warning400: warning400 ?? this.warning400,
      warning300: warning300 ?? this.warning300,
      warning200: warning200 ?? this.warning200,
      warning100: warning100 ?? this.warning100,
      warning50: warning50 ?? this.warning50,
      dangerBase: dangerBase ?? this.dangerBase,
      dangerShade: dangerShade ?? this.dangerShade,
      dangerTint: dangerTint ?? this.dangerTint,
      danger900: danger900 ?? this.danger900,
      danger600: danger600 ?? this.danger600,
      danger500: danger500 ?? this.danger500,
      danger400: danger400 ?? this.danger400,
      danger300: danger300 ?? this.danger300,
      danger200: danger200 ?? this.danger200,
      danger100: danger100 ?? this.danger100,
      danger50: danger50 ?? this.danger50,
      neutralBlack: neutralBlack ?? this.neutralBlack,
      neutralWhite: neutralWhite ?? this.neutralWhite,
      lightBase: lightBase ?? this.lightBase,
      lightShade: lightShade ?? this.lightShade,
      lightTint: lightTint ?? this.lightTint,
      mediumBase: mediumBase ?? this.mediumBase,
      mediumShade: mediumShade ?? this.mediumShade,
      mediumTint: mediumTint ?? this.mediumTint,
      darkBase: darkBase ?? this.darkBase,
      darkShade: darkShade ?? this.darkShade,
      darkTint: darkTint ?? this.darkTint,
      bronze: bronze ?? this.bronze,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      accentGradient: accentGradient ?? this.accentGradient,
      neutralAccGradient: neutralAccGradient ?? this.neutralAccGradient,
    );
  }
}
