import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UIFlash {
  static final iconLeft = -SpaceToken.t20;

  static void info(
    BuildContext context,
    String message, {
    Duration? duration,
    SnackBarPosition? position,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
        backgroundColor: AppTheme.c.secondary, //
        icon: Icon(
          LucideIcons.badge_info,
          color: AppTheme.c.background,
          size: SpaceToken.t100,
        ),
        iconPositionLeft: iconLeft,
        iconPositionTop: 0,
        maxLines: 3,
      ),
      displayDuration: duration ?? 4.seconds,
      snackBarPosition: position ?? SnackBarPosition.top,
    );
  }

  static void success(
    BuildContext context,
    String message, {
    Duration? duration,
    SnackBarPosition? position,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        textStyle: AppText.h3.cl(AppTheme.c.background).w(6),
        backgroundColor: AppTheme.c.primary, //
        icon: Icon(
          Icons.check_circle,
          color: AppTheme.c.successBase,
          size: SpaceToken.t100,
        ),
        iconPositionLeft: iconLeft,
        iconPositionTop: 0,
        iconRotationAngle: 0,
        maxLines: 3,
      ),
      displayDuration: duration ?? 4.seconds,
      snackBarPosition: position ?? SnackBarPosition.top,
    );
  }

  static void error(
    BuildContext context,
    String message, {
    Duration? duration,
    SnackBarPosition? position,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        backgroundColor: AppTheme.c.dangerBase, //
        maxLines: 3,
        icon: Icon(
          Icons.error_outline_rounded,
          color: AppTheme.c.dangerTint,
          size: SpaceToken.t100,
        ),
        iconPositionLeft: iconLeft,
        iconPositionTop: 0,
      ),
      displayDuration: duration ?? 4.seconds,
      snackBarPosition: position ?? SnackBarPosition.top,
    );
  }
}
