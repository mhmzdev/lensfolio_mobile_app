part of '../configs.dart';

extension SuperNum on num {
  String get currency => '\$${toStringAsFixed(2)}';

  double un() => AppUnit.un(this);
  double sp() => AppUnit.sp(this);
  double font() => AppUnit.font(this);
}
