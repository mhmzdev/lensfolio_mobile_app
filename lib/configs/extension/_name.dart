part of '../configs.dart';

extension NameInitials on String {
  /// Returns the initials of a full name, e.g. "John Doe" → "JD"
  String get initials =>
      trim().split(' ').where((e) => e.isNotEmpty).map((e) => e[0]).join();
}
