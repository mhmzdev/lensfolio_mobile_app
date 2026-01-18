// ignore_for_file: unused_element

part of 'jobs_repo.dart';

class _JobsParser {
  static Map<String, dynamic> fetch(
    String? search,
    String? category,
    int? limit,
  ) {
    try {
      return {
        if (search.available) 'search': search,
        if (category.available) 'category': category,
        if (limit != null) 'limit': limit,
      };
    } catch (e) {
      'Error parsing jobs query parameters: $e'.appLog(
        tag: 'JOBS_PARSER: fetch()',
        level: AppLogLevel.error,
      );
      return {};
    }
  }
}
