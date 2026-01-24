part of 'cover_letter_repo.dart';

class _CoverLetterProvider {
  static Future<List<CoverLetter>> fetch(int uid) async {
    try {
      final resp = await _CoverLetterMocks.fetch(uid);
      await 1.seconds.delay;
      final raw = resp as List<dynamic>;
      return raw
          .map((e) => CoverLetter.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<CoverLetter> generate(Map<String, dynamic> payload) async {
    try {
      final resp = await _CoverLetterMocks.generate(payload);
      await 1.seconds.delay;
      return CoverLetter.fromJson(resp);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<CoverLetter> edit(int id, Map<String, dynamic> payload) async {
    try {
      final resp = await _CoverLetterMocks.edit(id, payload);
      await 1.seconds.delay;
      return CoverLetter.fromJson(resp);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<void> delete(int id) async {
    try {
      await _CoverLetterMocks.delete(id);
      await 1.seconds.delay;
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
