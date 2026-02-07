import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/focus_handler.dart';

class AppModal extends StatelessWidget {
  const AppModal({
    super.key,
    this.padding,
    this.expanded = true,
    required this.child,
    this.canPop = true,
    this.bottomSafe = true,
  });

  final Widget child;
  final bool expanded;
  final bool canPop;
  final EdgeInsets? padding;
  final bool bottomSafe;

  @override
  Widget build(BuildContext context) {
    App.init(context);

    Widget body = Padding(
      padding: padding ?? Space.a.t16,
      child: child,
    );

    if (expanded) {
      body = Expanded(child: body);
    } else {
      body = Flexible(child: body);
    }

    return PopScope(
      canPop: canPop,
      child: GestureDetector(
        onTap: () => FocusHandler.tap(context),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.c.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Space.y.t20,
                Center(
                  child: Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppTheme.c.subText,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                body,
                if (bottomSafe) Space.bottom,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
