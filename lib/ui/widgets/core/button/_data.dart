part of 'button.dart';

Map<AppButtonStyle, _AppButtonModel> _mapPropsToData() {
  return {
    AppButtonStyle.primary: _AppButtonModel(
      surface: {
        AppButtonState.def: AppTheme.c.primary,
        AppButtonState.pressed: AppTheme.c.secondary,
        AppButtonState.disabled: AppTheme.c.primary.withValues(alpha: 0.5),
      },
      text: {
        AppButtonState.def: AppTheme.c.background,
      },
    ),
    AppButtonStyle.primaryBorder: _AppButtonModel(
      surface: {
        AppButtonState.def: AppTheme.c.background,
        AppButtonState.disabled: AppTheme.c.subText,
      },
      border: {
        AppButtonState.def: AppTheme.c.primary,
        AppButtonState.pressed: AppTheme.c.secondary,
        AppButtonState.disabled: AppTheme.c.subText,
      },
      text: {
        AppButtonState.def: AppTheme.c.primary,
        AppButtonState.pressed: AppTheme.c.secondary,
        AppButtonState.disabled: AppTheme.c.background,
      },
    ),
    AppButtonStyle.blackBorder: _AppButtonModel(
      surface: {
        AppButtonState.def: Colors.transparent,
      },
      border: {
        AppButtonState.def: AppTheme.c.text,
        AppButtonState.pressed: AppTheme.c.text.withValues(alpha: 0.8),
        AppButtonState.disabled: AppTheme.c.subText,
      },
      text: {
        AppButtonState.def: AppTheme.c.text,
        AppButtonState.pressed: AppTheme.c.text,
        AppButtonState.disabled: AppTheme.c.subText,
      },
    ),
    AppButtonStyle.secondary: _AppButtonModel(
      surface: {
        AppButtonState.def: AppTheme.c.secondary,
        AppButtonState.pressed: AppTheme.c.primary,
        AppButtonState.disabled: AppTheme.c.secondary.withValues(alpha: 0.5),
      },
      text: {
        AppButtonState.def: AppTheme.c.background,
        AppButtonState.disabled: AppTheme.c.background.withValues(alpha: 0.7),
      },
    ),
    AppButtonStyle.error: _AppButtonModel(
      surface: {
        AppButtonState.def: AppTheme.c.dangerBase,
        AppButtonState.pressed: AppTheme.c.dangerShade,
        AppButtonState.disabled: AppTheme.c.dangerBase.withValues(alpha: 0.5),
      },
      text: {
        AppButtonState.def: AppTheme.c.background,
      },
    ),
    AppButtonStyle.black: _AppButtonModel(
      surface: {
        AppButtonState.def: AppTheme.c.text,
        AppButtonState.pressed: AppTheme.c.text.withValues(alpha: 0.9),
        AppButtonState.disabled: AppTheme.c.text.withValues(alpha: 0.5),
      },
      text: {
        AppButtonState.def: AppTheme.c.background,
      },
    ),
    AppButtonStyle.success: _AppButtonModel(
      surface: {
        AppButtonState.def: AppTheme.c.successBase,
        AppButtonState.pressed: AppTheme.c.successShade,
        AppButtonState.disabled: AppTheme.c.successBase.withValues(alpha: 0.5),
      },
      text: {
        AppButtonState.def: AppTheme.c.background,
      },
    ),
  };
}

Map<AppButtonSize, TextStyle> _mapSizeToFontSize() {
  return {
    AppButtonSize.large: AppText.h3.removeHeight(),
    AppButtonSize.medium: AppText.b1.removeHeight(),
    AppButtonSize.small: AppText.b2.removeHeight(),
  };
}
