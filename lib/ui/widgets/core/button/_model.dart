part of 'button.dart';

class _AppButtonModel {
  final Map<AppButtonState, Color> text;
  final Map<AppButtonState, Color>? border;
  final Map<AppButtonState, Color> surface;
  final Map<AppButtonState, List<BoxShadow>> shadow;

  _AppButtonModel({
    this.border,
    // ignore: unused_element_parameter
    this.shadow = const {},
    required this.text,
    required this.surface,
  });
}
