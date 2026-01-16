import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/gen/assets/fonts.gen.dart';

/// A widget that renders text with special styling for content within curly braces.
///
/// Text wrapped in {curly braces} will be styled with [specialStyle],
/// while the rest uses [style]. Useful for highlighting specific parts of text.
class ComplexText extends StatelessWidget {
  final String? string;
  final TextStyle? style;
  final TextStyle? specialStyle;

  const ComplexText({
    super.key,
    this.string,
    this.style,
    this.specialStyle,
  });

  @override
  Widget build(BuildContext context) {
    final regex = RegExp('{(.*?)}');
    final split = string!.split(regex);
    final complex = regex.firstMatch(string!);
    final renders = <String?>[];
    final list = <int>[];
    for (var i = 0; i < split.length; i++) {
      renders.add(split[i]);
      final next = i + 1;
      if (next < split.length) {
        list.add(next);
        renders.add(complex![list.length]);
      }
    }
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: AppTheme.c.text,
          fontFamily: FontFamily.nunito,
        ),
        children: renders.asMap().entries.map((entry) {
          return TextSpan(
            text: entry.value,
            style: list.contains(entry.key) ? specialStyle : style,
          );
        }).toList(),
      ),
    );
  }
}
