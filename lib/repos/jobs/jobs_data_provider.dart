part of 'jobs_repo.dart';

class _JobsProvider {
  static Future<JobFetchRespnose> fetch() async {
    try {
      final resp = await _JobsMocks.fetch();
      await 1.seconds.delay;

      final raw = resp['data'] as Map<String, dynamic>;
      return JobFetchRespnose.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
