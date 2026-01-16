import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';

/// [AppTouch]is a wrapper for [InkWell] that removes the splash effect.
/// This is useful when you want to use the InkWell widget but don't want the splash effect.
class AppTouch extends StatelessWidget {
  final void Function() onTap;
  final void Function()? onLongPress;
  final void Function(bool)? onHover;
  final bool hasSplash;

  final Widget child;
  const AppTouch({
    super.key,
    required this.onTap,
    required this.child,
    this.onLongPress,
    this.onHover,
    this.hasSplash = true,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: !hasSplash ? Colors.transparent : null,
    onTap: onTap,
    onLongPress: onLongPress,
    onHover: onHover,
    child: Padding(
      padding: Space.a.t04,
      child: child,
    ),
  );
}
