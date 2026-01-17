part of 'jobs_repo.dart';

class _JobsProvider {
  static Future<JobFetchRespnose> fetch(Map<String, dynamic>? queryParam) async {
    try {
      final resp = await AppApi().ins.get(
        '/remote-jobs',
        queryParameters: queryParam,
      );
      final raw = resp.data as Map<String, dynamic>;
      return JobFetchRespnose.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
