part of '../configs.dart';

sealed class AppColors {
  // Base colors
  static const primary = Color(0xff723FED);
  static const secondary = Color(0xff2762EB);

  // Gradients
  static const gradientPrimary = LinearGradient(
    colors: [
      Color(0xff723FED),
      Color(0xff2762EB),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

sealed class AppColorsLight {
  // Base colors
  static const primary = Color(0xff723FED);
  static const secondary = Color(0xff2762EB);

  // Text colors
  static const text = Color(0xff020817);
  static const subText = Color(0xff64748B);
  static const background = Color(0xffFFFFFF);

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
}

sealed class AppColorsDark {
  // Base colors
  static const primary = Color(0xff723FED);
  static const secondary = Color(0xff2762EB);

  // Text colors
  static const text = Color(0xffFFFFFF);
  static const subText = Color(0xff64748B);
  static const background = Color(0xff020817);

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
}
