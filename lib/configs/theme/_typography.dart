part of '../configs.dart';

/// [AppText] is a class that contains the text styles for the app.
class AppText {
  /// Font Size 24
  static late TextStyle h1;

  /// Font Size 24, Bold
  static late TextStyle h1b;

  /// Font Size 20
  static late TextStyle h2;

  /// Font Size 20, Bold
  static late TextStyle h2b;

  /// Font Size 18
  static late TextStyle h3;

  /// Font Size 18, Bold
  static late TextStyle h3b;

  /// Font Size 14
  static late TextStyle b1;

  /// Font Size 14, Bold
  static late TextStyle b1b;

  /// Font Size 12
  static late TextStyle b2;

  /// Font Size 12, Bold
  static late TextStyle b2b;

  /// Font Size 10
  static late TextStyle l1;

  /// Font Size 10, Bold
  static late TextStyle l1b;

  static void init() {
    const base = TextStyle(
      fontFamily: FontFamily.nunito,
    );

    h1 = base.copyWith(fontSize: 24);
    h1b = h1.copyWith(fontWeight: FontWeight.w700);

    h2 = base.copyWith(fontSize: 20);
    h2b = h2.copyWith(fontWeight: FontWeight.w700);

    h3 = base.copyWith(fontSize: 18);
    h3b = h3.copyWith(fontWeight: FontWeight.w700);

    b1 = base.copyWith(
      fontSize: 14,
    );
    b1b = b1.copyWith(fontWeight: FontWeight.w700);

    b2 = base.copyWith(
      fontSize: 12,
    );
    b2b = b2.copyWith(fontWeight: FontWeight.w700);

    l1 = base.copyWith(
      fontSize: 10,
    );
    l1b = l1.copyWith(fontWeight: FontWeight.w700);
  }
}
