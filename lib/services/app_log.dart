import 'dart:developer';
import 'dart:io';

import 'firebase/crash/crashlytics.dart';

enum AppLogLevel {
  debug('💬', '\x1B[37m'), // White
  info('ℹ️', '\x1B[36m'), // Cyan
  warning('⚠️', '\x1B[33m'), // Yellow
  error('❌', '\x1B[31m'), // Red
  success('✅', '\x1B[32m'), // Green
  ;

  final String emoji;
  final String colorCode;

  const AppLogLevel(this.emoji, this.colorCode);
}

extension LogExtension on Object {
  void appLog({
    String tag = 'APP_LOG',
    AppLogLevel level = AppLogLevel.debug,
    bool enableColors = true,
    bool showCallerInfo = false,
    bool toCrashlytics = false,
  }) {
    final now = DateTime.now().toIso8601String();

    final color = (enableColors && _supportsAnsiColors) ? level.colorCode : '';
    final reset = (enableColors && _supportsAnsiColors) ? '\x1B[0m' : '';

    final callerInfo = showCallerInfo ? _getCallerInfo() : '';
    final callerSection = callerInfo.isNotEmpty ? ' $callerInfo' : '';

    final message = '${level.emoji} [$tag:$callerSection] $now $this';
    log('$color$message$reset');

    if (toCrashlytics && level != AppLogLevel.error) {
      message.flog();
    }

    if (level == AppLogLevel.error) {
      // final callerInfo = _getCallerInfo();
      // final callerSection = callerInfo.isNotEmpty ? ' $callerInfo' : '';
      // final messageWithCaller = '[$tag:$callerSection] $now $this';
      // messageWithCaller.flog();
    }
  }

  bool get _supportsAnsiColors =>
      !Platform.isWindows || stdout.supportsAnsiEscapes;

  String _getCallerInfo() {
    try {
      final line = StackTrace.current.toString().split('\n')[2].trim();
      final match = RegExp(r'\((.+?):(\d+):\d+\)$').firstMatch(line);
      if (match != null) {
        final file =
            match.group(1)?.split(Platform.pathSeparator).last ?? 'unknown';
        final lineNum = match.group(2) ?? '0';
        return '$file:$lineNum';
      }
    } catch (_) {}
    return '';
  }
}
