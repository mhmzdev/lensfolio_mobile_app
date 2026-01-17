import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';

class FullScreenLoader extends StatefulWidget {
  const FullScreenLoader({
    super.key,
    this.loading = false,
    this.bg,
    this.loadingText = 'Loading...',
  });
  final bool loading;
  final Color? bg;
  final String loadingText;

  static void modal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (_) {
        return const FullScreenLoader(loading: true);
      },
    );
  }

  @override
  State<FullScreenLoader> createState() => _FullScreenLoaderState();
}

class _FullScreenLoaderState extends State<FullScreenLoader> {
  @override
  void initState() {
    mount = widget.loading;
    super.initState();
  }

  late bool mount;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    if (!widget.loading) return const SizedBox.shrink();

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: Container(
        width: AppMedia.width,
        height: AppMedia.height,
        alignment: Alignment.center,
        color:
            widget.bg?.withValues(alpha: 0.5) ??
            Colors.black.withValues(alpha: .45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppIconLoader(),
            Space.y.t12,
            Text(
              widget.loadingText,
              textAlign: TextAlign.center,
              style: AppText.b1b.cl(AppTheme.c.background),
            ),
          ],
        ),
      ),
    );
  }
}

class AppIconLoader extends StatelessWidget {
  final double radius;
  final double? strokeWidth;
  final Color? overlayColor;
  const AppIconLoader({
    super.key,
    this.radius = 60.0,
    this.strokeWidth,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    final stroke = radius * 0.078;

    return Stack(
      alignment: Alignment.center,
      children: [
        Assets.app.icon.image(height: radius * 0.6),
        SizedBox(
          height: radius - stroke,
          width: radius - stroke,
          child: CircularProgressIndicator(
            color: overlayColor ?? AppTheme.c.background,
            strokeWidth: strokeWidth ?? stroke,
          ),
        ),
      ],
    );
  }
}
