part of '../configs.dart';

sealed class AppColors {
  // Gradients
  static const gradientPrimary = LinearGradient(
    colors: [
      AppColorsLight.primaryShade,
      AppColorsLight.primaryTint,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static final accentGradient = LinearGradient(
    colors: [
      accent950,
      accent950.withValues(alpha: 0.55),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const neutralAccGradient = LinearGradient(
    colors: [
      AppColorsLight.neutralBlack,
      accent900,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Primary shades
  static const primary = Color(0xff8D1B71);
  static const primary900 = Color(0xff930087);
  static const primary800 = Color(0xffc000a3);
  static const primary600 = Color(0xffe000ac);
  static const primary500 = Color(0xfff000b0);
  static const primary400 = Color(0xffff1fbc);
  static const primary200 = Color(0xffff8ddf);
  static const primary100 = Color(0xfffdbcee);
  static const primary50 = Color(0xfffee0f9);

  // Accent shades - Full range
  static const accent950 = Color(0xff09001A);
  static const accent900 = Color(0xff14052F);
  static const accent850 = Color(0xff1F0E3E);
  static const accent800 = Color(0xff2C1C4A);
  static const accent750 = Color(0xff392A56);
  static const accent700 = Color(0xff473A60);
  static const accent650 = Color(0xff54486A);
  static const accent600 = Color(0xff615577);
  static const accent550 = Color(0xff6E6284);
  static const accent500 = Color(0xff7B6F91);
  static const accent450 = Color(0xff887F99);
  static const accent400 = Color(0xff968EA4);
  static const accent350 = Color(0xffA39CB0);
  static const accent300 = Color(0xffB0AABC);
  static const accent250 = Color(0xffBDB7C7);
  static const accent200 = Color(0xffCAC4D4);
  static const accent150 = Color(0xffD7D1E1);
  static const accent100 = Color(0xffE4DFED);
  static const accent50 = Color(0xffF0EDF7);
  static const accent30 = Color(0xffF6F3FB);

  // Neutral shades - Full range
  static const neutral950 = Color(0xff0D0D0D);
  static const neutral900 = Color(0xff1A1A1A);
  static const neutral850 = Color(0xff262626);
  static const neutral800 = Color(0xff333333);
  static const neutral750 = Color(0xff404040);
  static const neutral700 = Color(0xff4D4D4D);
  static const neutral650 = Color(0xff595959);
  static const neutral600 = Color(0xff666666);
  static const neutral550 = Color(0xff737373);
  static const neutral500 = Color(0xff808080);
  static const neutral450 = Color(0xff8C8C8C);
  static const neutral400 = Color(0xff999999);
  static const neutral350 = Color(0xffA6A6A6);
  static const neutral300 = Color(0xffB3B3B3);
  static const neutral250 = Color(0xffBFBFBF);
  static const neutral200 = Color(0xffCCCCCC);
  static const neutral150 = Color(0xffD9D9D9);
  static const neutral100 = Color(0xffE6E6E6);
  static const neutral50 = Color(0xffF2F2F2);
  static const neutral30 = Color(0xffF7F7F7);

  // Secondary shades
  static const secondary900 = Color(0xff00808e);
  static const secondary800 = Color(0xff00a6b5);
  static const secondary700 = Color(0xff00c1cf);
  static const secondary500 = Color(0xff00e8f0);
  static const secondary400 = Color(0xff00eef5);
  static const secondary300 = Color(0xff00f7fa);
  static const secondary50 = Color(0xffd6fffe);

  // Tertiary shades
  static const tertiary900 = Color(0xff200066);
  static const tertiary600 = Color(0xff4417BF);
  static const tertiary500 = Color(0xff4C23D1);
  static const tertiary300 = Color(0xff6561DB);
  static const tertiary200 = Color(0xff9494E5);
  static const tertiary100 = Color(0xffC4C3F0);
  static const tertiary50 = Color(0xffE7E7F9);

  // Success shades
  static const success900 = Color(0xff006c5e);
  static const success800 = Color(0xff008c70);
  static const success700 = Color(0xff009e7c);
  static const success500 = Color(0xff00c191);
  static const success400 = Color(0xff00cc96);
  static const success100 = Color(0xffb5edd7);
  static const success50 = Color(0xffe1f8ef);

  // Warning shades
  static const warning900 = Color(0xffff7007);
  static const warning600 = Color(0xffffb40a);
  static const warning500 = Color(0xffffc211);
  static const warning400 = Color(0xffffca2c);
  static const warning300 = Color(0xffffd551);
  static const warning200 = Color(0xffffe083);
  static const warning100 = Color(0xffffecb4);
  static const warning50 = Color(0xfffff8e1);

  // Danger shades
  static const danger900 = Color(0xff80002f);
  static const danger600 = Color(0xffc41c46);
  static const danger500 = Color(0xffd52a4f);
  static const danger400 = Color(0xffe13b5c);
  static const danger300 = Color(0xffe95c74);
  static const danger200 = Color(0xfff18a9b);
  static const danger100 = Color(0xfff8b7c2);
  static const danger50 = Color(0xfffce3e7);

  // Bronze
  static const bronze = Color(0xffcf916a);
}

sealed class AppColorsLight {
  // Primary colors
  static const primary = Color(0xff8D1B71);
  static const primaryBase = Color(0xffff1fbc);
  static const primaryShade = Color(0xffcc00a7);
  static const primaryTint = Color(0xfffd54cb);

  // Accent colors
  static const accentBase = AppColors.accent500;
  static const accentShade = AppColors.accent700;
  static const accentTint = AppColors.accent300;

  // Neutral colors
  static const neutralBlack = Color(0xff000000);
  static const neutralWhite = Color(0xffffffff);

  // Secondary colors
  static const secondaryBase = Color(0xff5cffff);
  static const secondaryShade = Color(0xff00dae5);
  static const secondaryTint = Color(0xffa3ffff);

  // Tertiary colors
  static const tertiaryBase = Color(0xff3d00ad);
  static const tertiaryShade = Color(0xff2c0085);
  static const tertiaryTint = Color(0xff503bd8);

  // Success colors
  static const successBase = Color(0xff2ed6a4);
  static const successShade = Color(0xff00b188);
  static const successTint = Color(0xff80e1be);

  // Warning colors
  static const warningBase = Color(0xffffa109);
  static const warningShade = Color(0xffff9008);
  static const warningTint = Color(0xffffd551);

  // Danger colors
  static const dangerBase = Color(0xffb6113d);
  static const dangerShade = Color(0xffa30736);
  static const dangerTint = Color(0xffe13b5c);

  // Light colors
  static const lightBase = Color(0xfff7f7f7);
  static const lightShade = Color(0xffd9d9d9);
  static const lightTint = Color(0xfff2f2f2);

  // Medium colors
  static const mediumBase = Color(0xff666666);
  static const mediumShade = Color(0xff4d4d4d);
  static const mediumTint = Color(0xff737373);

  // Dark colors
  static const darkBase = Color(0xff333333);
  static const darkShade = Color(0xff262626);
  static const darkTint = Color(0xff4d4d4d);
}

sealed class AppColorsDark {
  // Primary colors
  static const primary = Color(0xff8D1B71);
  static const primaryBase = Color(0xffff1fbc);
  static const primaryShade = Color(0xffcc00a7);
  static const primaryTint = Color(0xfffd54cb);

  // Accent colors
  static const accentBase = AppColors.accent500;
  static const accentShade = AppColors.accent700;
  static const accentTint = AppColors.accent300;

  // Neutral colors
  static const neutralBlack = Color(0xff000000);
  static const neutralWhite = Color(0xffffffff);

  // Secondary colors
  static const secondaryBase = Color(0xff5cffff);
  static const secondaryShade = Color(0xff00dae5);
  static const secondaryTint = Color(0xffa3ffff);

  // Tertiary colors
  static const tertiaryBase = Color(0xff3d00ad);
  static const tertiaryShade = Color(0xff2c0085);
  static const tertiaryTint = Color(0xff503bd8);

  // Success colors
  static const successBase = Color(0xff2ed6a4);
  static const successShade = Color(0xff00b188);
  static const successTint = Color(0xff80e1be);

  // Warning colors
  static const warningBase = Color(0xffffa109);
  static const warningShade = Color(0xffff9008);
  static const warningTint = Color(0xffffd551);

  // Danger colors
  static const dangerBase = Color(0xffb6113d);
  static const dangerShade = Color(0xffa30736);
  static const dangerTint = Color(0xffe13b5c);

  // Light colors
  static const lightBase = Color(0xfff7f7f7);
  static const lightShade = Color(0xffd9d9d9);
  static const lightTint = Color(0xfff2f2f2);

  // Medium colors
  static const mediumBase = Color(0xff666666);
  static const mediumShade = Color(0xff4d4d4d);
  static const mediumTint = Color(0xff737373);

  // Dark colors
  static const darkBase = Color(0xff333333);
  static const darkShade = Color(0xff262626);
  static const darkTint = Color(0xff4d4d4d);
}
