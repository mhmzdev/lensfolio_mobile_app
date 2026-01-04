part of '../configs.dart';

extension MapExtension on Map {
  /// Searches for a key containing the given [keyFragment] and returns the value
  /// of the associated field, cast to type [T].
  ///
  /// Returns null if no matching key is found or if the field's value is null.
  /// Assumes the map values have a 'value' property that can be accessed.
  T? getValue<T>(String keyFragment) {
    final key = keys.firstWhere(
      (k) => k.contains(keyFragment),
      orElse: () => '',
    );

    if (key.isEmpty) return null;

    final field = this[key];
    return field?.value as T?;
  }

  /// Trims string values in the map and returns other values as they are.
  ///
  /// Creates a new map with the same keys but with string values trimmed.
  /// Non-string values are returned unchanged.
  Map<String, V> trimStringValues<K, V>() {
    return map<String, V>((key, value) {
      if (value is String) {
        return MapEntry(key, value.trim() as V);
      }
      return MapEntry(key, value);
    });
  }
}
