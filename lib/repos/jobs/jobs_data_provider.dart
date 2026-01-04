part of 'jobs_repo.dart';

class _JobsProvider {
  static Future<Job> fetch() async {
    try {
      final raw = <String, dynamic>{};
      return Job.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
