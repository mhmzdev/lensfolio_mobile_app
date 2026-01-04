part of 'configs.dart';

abstract class AppProps {
  static final quick = 100.milliseconds;
  static final fast = 200.milliseconds;
  static final medium = 300.milliseconds;
  static final normal = 500.milliseconds;

  static const radiusTop = BorderRadius.vertical(top: Radius.circular(8));
}
