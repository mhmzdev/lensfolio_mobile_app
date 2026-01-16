part of 'button.dart';

Map<AppButtonStyle, _AppButtonModel> _mapPropsToData() {
  return {
    .primary: _AppButtonModel(
      surface: {
        .def: AppTheme.c.primary,
        .pressed: AppTheme.c.secondary,
        .disabled: AppTheme.c.primary.withValues(alpha: 0.5),
      },
      text: {
        .def: AppTheme.c.background,
        .disabled: AppTheme.c.primary,
      },
    ),
    .primaryBorder: _AppButtonModel(
      surface: {
        .def: AppTheme.c.background,
        .disabled: AppTheme.c.primary.addOpacity(.1),
      },
      border: {
        .def: AppTheme.c.primary,
        .pressed: AppTheme.c.secondary,
        .disabled: AppTheme.c.primary,
      },
      text: {
        .def: AppTheme.c.primary,
        .pressed: AppTheme.c.secondary,
        .disabled: AppTheme.c.primary,
      },
    ),
    .secondary: _AppButtonModel(
      surface: {
        .def: AppTheme.c.secondary,
        .pressed: AppTheme.c.primary,
        .disabled: AppTheme.c.secondary.withValues(alpha: 0.5),
      },
      text: {
        .def: AppTheme.c.background,
        .disabled: AppTheme.c.background.withValues(alpha: 0.7),
      },
    ),
    .black: _AppButtonModel(
      surface: {
        .def: AppTheme.c.text,
        .pressed: AppTheme.c.text.withValues(alpha: 0.9),
        .disabled: AppTheme.c.text.withValues(alpha: 0.5),
      },
      text: {
        .def: AppTheme.c.background,
        .disabled: AppTheme.c.text,
      },
    ),
    .blackBorder: _AppButtonModel(
      surface: {
        .def: AppTheme.c.background,
        .disabled: AppTheme.c.text.withValues(alpha: 0.1),
      },
      border: {
        .def: AppTheme.c.text,
        .pressed: AppTheme.c.text.withValues(alpha: 0.8),
        .disabled: AppTheme.c.text,
      },
      text: {
        .def: AppTheme.c.text,
        .pressed: AppTheme.c.text.withValues(alpha: 0.8),
        .disabled: AppTheme.c.text,
      },
    ),
    .error: _AppButtonModel(
      surface: {
        .def: AppTheme.c.dangerBase,
        .pressed: AppTheme.c.dangerShade,
        .disabled: AppTheme.c.dangerBase.withValues(alpha: 0.5),
      },
      text: {
        .def: AppTheme.c.background,
        .disabled: AppTheme.c.background,
      },
    ),
    .success: _AppButtonModel(
      surface: {
        .def: AppTheme.c.successBase,
        .pressed: AppTheme.c.successShade,
        .disabled: AppTheme.c.successBase.withValues(alpha: 0.5),
      },
      text: {
        .def: AppTheme.c.background,
        .disabled: AppTheme.c.background,
      },
    ),
  };
}

Map<AppButtonSize, TextStyle> _mapSizeToFontSize() {
  return {
    .large: AppText.h3.removeHeight(),
    .medium: AppText.b1.removeHeight(),
    .small: AppText.b2.removeHeight(),
  };
}

Map<AppButtonRadius, BorderRadius> _mapRadiusToBorderRadius() {
  return {
    .normal: 8.radius(),
    .rounded: 12.radius(),
    .capsule: 50.radius(),
  };
}
