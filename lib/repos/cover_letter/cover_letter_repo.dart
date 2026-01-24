import 'package:dio/dio.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/cover_letter/cover_letter.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

part 'cover_letter_mocks.dart';
part 'cover_letter_parser.dart';
part 'cover_letter_data_provider.dart';

class CoverLetterRepo {
  static final CoverLetterRepo _instance = CoverLetterRepo._();
  CoverLetterRepo._();

  static CoverLetterRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<List<CoverLetter>> fetch(int uid) => _CoverLetterProvider.fetch(uid);

  Future<CoverLetter> generate(Map<String, dynamic> payload) =>
      _CoverLetterProvider.generate(payload);

  Future<CoverLetter> edit(int id, Map<String, dynamic> payload) =>
      _CoverLetterProvider.edit(id, payload);

  Future<void> delete(int id) => _CoverLetterProvider.delete(id);
}
