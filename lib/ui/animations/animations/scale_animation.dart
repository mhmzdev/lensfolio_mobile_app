import 'package:flutter/material.dart';

class ScaleAnimatedWidget extends StatefulWidget {
  final Widget child;

  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool autoStart;

  final double initialScale;
  final double finalScale;
  final double overshootScale;

  final VoidCallback? onAnimationComplete;
  final VoidCallback? onAnimationStart;

  final bool reverseOnDispose;

  const ScaleAnimatedWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.curve = Curves.elasticOut,
    this.autoStart = true,
    this.initialScale = 0.7,
    this.finalScale = 1.0,
    this.overshootScale = 1.15,
    this.onAnimationComplete,
    this.onAnimationStart,
    this.reverseOnDispose = false,
  });

  @override
  State<ScaleAnimatedWidget> createState() => _ScaleAnimatedWidgetState();
}

class _ScaleAnimatedWidgetState extends State<ScaleAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.initialScale,
          end: widget.overshootScale,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.overshootScale,
          end: widget.finalScale,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete?.call();
      } else if (status == AnimationStatus.forward) {
        widget.onAnimationStart?.call();
      }
    });

    if (widget.autoStart) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startWithDelay();
      });
    }
  }

  void _startWithDelay() {
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    if (widget.reverseOnDispose && _controller.isCompleted) {
      _controller.reverse();
    }
    _controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    _startWithDelay();
  }

  void reverseAnimation() {
    _controller.reverse();
  }

  void resetAnimation() {
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scaleAnimation, child: widget.child);
  }
}

extension ScaleAnimationExtension on Widget {
  Widget withScaleAnimation({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    Curve curve = Curves.elasticOut,
    bool autoStart = true,
    double initialScale = 0.7,
    double finalScale = 1.0,
    double overshootScale = 1.10,
    VoidCallback? onComplete,
  }) {
    return ScaleAnimatedWidget(
      duration: duration,
      delay: delay,
      curve: curve,
      autoStart: autoStart,
      initialScale: initialScale,
      finalScale: finalScale,
      overshootScale: overshootScale,
      onAnimationComplete: onComplete,
      child: this,
    );
  }
}
