import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:flutter/material.dart';

class Animator extends StatefulWidget {
  final Widget? child;
  final Duration? time;

  const Animator(Key? key, this.child, this.time) : super(key: key);

  @override
  AnimatorState createState() => AnimatorState();
}

class AnimatorState extends State<Animator>
    with SingleTickerProviderStateMixin {
  Timer? timer;
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: AppProps.normal,
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInOut,
    );
    timer = Timer(widget.time!, animationController!.forward);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation!.value,
          child: Transform.translate(
            offset: Offset(0.0, (1 - animation!.value) * 20),
            child: child,
          ),
        );
      },
    );
  }
}

Timer? timer;
Duration duration = const Duration();

Duration wait() {
  if (timer == null || !timer!.isActive) {
    timer = Timer(const Duration(microseconds: 120), () {
      duration = const Duration();
    });
  }
  duration += const Duration(milliseconds: 100);
  return duration;
}

class _WidgetAnimator extends StatelessWidget {
  final Widget child;
  final Duration? customDelay;

  const _WidgetAnimator({required this.child, this.customDelay});

  @override
  Widget build(BuildContext context) {
    return Animator(key, child, customDelay ?? wait());
  }
}

extension WidgetAnimatorX on Widget {
  Widget withBottomAnimation({Duration? delay}) {
    return _WidgetAnimator(customDelay: delay, child: this);
  }
}
