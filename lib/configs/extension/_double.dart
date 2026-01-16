part of '../configs.dart';

extension SuperDouble on double {
  double un() => AppUnit.un(this);
  double sp() => AppUnit.sp(this);
  double font() => AppUnit.font(this);
  Widget h() => SizedBox(height: this);
  Widget w() => SizedBox(width: this);
  Widget box() => SizedBox(height: this, width: this);

  BorderRadius radius() => BorderRadius.circular(this);
}
