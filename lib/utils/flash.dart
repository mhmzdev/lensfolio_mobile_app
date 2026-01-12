import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UIFlash {
  static final iconLeft = -SpaceToken.t28;

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
          Icons.note_outlined,
          color: AppTheme.c.secondary.withValues(alpha: 0.5),
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
        textStyle: AppText.h3.cl(AppTheme.c.text).sfPro.w(6),
        backgroundColor: AppTheme.c.successShade, //
        icon: Icon(
          Icons.check_circle,
          color: AppTheme.c.successTint,
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
