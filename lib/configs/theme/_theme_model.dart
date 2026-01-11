part of '../configs.dart';

class _ThemeModel {
  final Color primary;
  final Color secondary;
  final Color text;
  final Color subText;
  final Color background;
  final Color successBase;
  final Color successShade;
  final Color successTint;
  final Color warningBase;
  final Color warningShade;
  final Color warningTint;
  final Color dangerBase;
  final Color dangerShade;
  final Color dangerTint;
  final LinearGradient primaryGradient;

  const _ThemeModel({
    required this.primary,
    required this.secondary,
    required this.text,
    required this.subText,
    required this.background,
    required this.successBase,
    required this.successShade,
    required this.successTint,
    required this.warningBase,
    required this.warningShade,
    required this.warningTint,
    required this.dangerBase,
    required this.dangerShade,
    required this.dangerTint,
    required this.primaryGradient,
  });

  _ThemeModel copyWith({
    Color? primary,
    Color? secondary,
    Color? text,
    Color? subText,
    Color? background,
    Color? successBase,
    Color? successShade,
    Color? successTint,
    Color? warningBase,
    Color? warningShade,
    Color? warningTint,
    Color? dangerBase,
    Color? dangerShade,
    Color? dangerTint,
    LinearGradient? primaryGradient,
  }) {
    return _ThemeModel(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      text: text ?? this.text,
      subText: subText ?? this.subText,
      background: background ?? this.background,
      successBase: successBase ?? this.successBase,
      successShade: successShade ?? this.successShade,
      successTint: successTint ?? this.successTint,
      warningBase: warningBase ?? this.warningBase,
      warningShade: warningShade ?? this.warningShade,
      warningTint: warningTint ?? this.warningTint,
      dangerBase: dangerBase ?? this.dangerBase,
      dangerShade: dangerShade ?? this.dangerShade,
      dangerTint: dangerTint ?? this.dangerTint,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }
}
