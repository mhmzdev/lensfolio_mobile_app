import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';

import 'full_screen_loader.dart';

/// {@template paginated_loader}
/// PaginatedLoader widget.
/// {@endtemplate}
class FloatingLoader extends StatelessWidget {
  /// {@macro paginated_loader}
  const FloatingLoader({
    super.key, // ignore: unused_element
    this.title,
    required this.message,
    this.left,
    this.right,
    this.bottom,
  });

  final double? left;
  final double? right;
  final double? bottom;

  final String message;
  final String? title;

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Positioned(
      left: left ?? SpaceToken.t12,
      right: right ?? SpaceToken.t12,
      bottom: bottom ?? SpaceToken.t12 + context.bottomSafe(),
      child: Container(
        padding: Space.a.t16,
        decoration: AppProps.softBoxDecoration.copyWith(
          color: AppTheme.c.background,
          boxShadow: [
            BoxShadow(
              color: AppTheme.c.text.addOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            AppIconLoader(
              radius: 36,
              overlayColor: AppTheme.c.secondary,
            ),
            Space.x.t16,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'Loading',
                    style: AppText.h3b.cl(AppTheme.c.text),
                  ),
                  Text(message, style: AppText.b1.cl(AppTheme.c.subText)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
