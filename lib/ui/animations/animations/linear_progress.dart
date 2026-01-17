import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:flutter/material.dart';

class AnimatedLinearProgress extends StatelessWidget {
  final double value;
  final Color backgroundColor;
  final Color valueColor;
  final double minHeight;
  final BorderRadius? borderRadius;
  final Duration duration;
  final Curve curve;
  final Duration delay;

  const AnimatedLinearProgress({
    super.key,
    required this.value,
    required this.backgroundColor,
    required this.valueColor,
    this.minHeight = 10,
    this.borderRadius,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.easeOutCubic,
    this.delay = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return LinearProgressIndicator(
            value: 0.0,
            backgroundColor: backgroundColor,
            minHeight: minHeight,
            borderRadius: borderRadius,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
          );
        }

        return TweenAnimationBuilder<double>(
          duration: duration,
          curve: curve,
          tween: Tween(begin: 0.0, end: value),
          builder: (context, animatedValue, child) {
            return LinearProgressIndicator(
              value: animatedValue,
              backgroundColor: backgroundColor,
              minHeight: minHeight,
              borderRadius: borderRadius,
              valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            );
          },
        );
      },
    );
  }
}
