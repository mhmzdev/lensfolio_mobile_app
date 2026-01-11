part of 'flavor.dart';

/// Stage, QA, Prod
enum Flavor { stage, qa, prod }

extension FlavorX on Flavor {
  /// Stage environment
  bool get isStage => this == Flavor.stage;

  /// QA environment, PRODUCTION just with ALICE and LOGS
  /// enabled to test production
  bool get isQa => this == Flavor.qa;

  /// Pure PROD environment
  bool get isProd => this == Flavor.prod;

  /// QA and PROD both hits production Firebase and API. The main
  /// difference is QA has ALICE and LOGS enabled to test production.
  bool get isProduction => this == Flavor.prod || this == Flavor.qa;
}
