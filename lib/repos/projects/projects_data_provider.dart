part of 'projects_repo.dart';

class _ProjectsProvider {
  static Future<void> delete(int id) async {
    try {
      // final raw = <String, dynamic>{};
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<Project> update(int id, Map<String, dynamic> values) async {
    try {
      final resp = await _ProjectsMocks.update(id, values);
      await 1.seconds.delay;
      final raw = resp['data'] as Map<String, dynamic>;
      return Project.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<List<Project>> fetchAll(int uid) async {
    try {
      final resp = await _ProjectsMocks.fetchAll(uid);
      await 1.seconds.delay;
      final raw = resp['data'] as List<dynamic>;
      return raw
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<Project> fetchById(int id) async {
    try {
      final resp = await _ProjectsMocks.fetchById(id);
      await 1.seconds.delay;
      final raw = resp['data'] as Map<String, dynamic>;
      return Project.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<Project> create(int uid, Map<String, dynamic> data) async {
    try {
      final resp = await _ProjectsMocks.create(uid, data);
      await 1.seconds.delay;
      final raw = resp['data'] as Map<String, dynamic>;
      return Project.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
