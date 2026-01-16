part of '../configs.dart';

extension SuperInt on int {
  double un() => AppUnit.un(this);
  double sp() => AppUnit.sp(this);
  double font() => AppUnit.font(this);

  BorderRadius radius() => BorderRadius.circular(toDouble());
  BorderRadius top() => BorderRadius.vertical(top: Radius.circular(toDouble()));
  BorderRadius bottom() =>
      BorderRadius.vertical(bottom: Radius.circular(toDouble()));
}
