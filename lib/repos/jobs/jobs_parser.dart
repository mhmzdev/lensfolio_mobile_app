// ignore_for_file: unused_element

part of 'jobs_repo.dart';

class _JobsParser {
  static Map<String, dynamic> fetch(
    String? search,
    String? category,
    int? limit,
  ) => {
    if (search.available) 'search': search,
    if (category.available) 'category': category,
    if (limit != null) 'limit': limit,
  };
}
