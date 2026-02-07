part of 'button.dart';

enum AppButtonStyle {
  primary,
  primaryBorder,
  black,
  blackBorder,
  secondary,
  error,
  success,
}

enum AppButtonSize {
  small,
  medium,
  large,
}

enum AppButtonRadius {
  normal,
  rounded,
  capsule,
}

enum AppButtonState {
  def,
  pressed,
  disabled,
}

extension AppButtonStateExt on AppButtonState {
  bool get isDisabled => this == AppButtonState.disabled;
}
