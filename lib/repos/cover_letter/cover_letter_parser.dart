// ignore_for_file: unused_element

part of 'cover_letter_repo.dart';

class _CoverLetterParser {
  static Map<String, dynamic> save(
    LetterPromptResponse letter,
    int uid,
  ) => {
    'uid': uid,
    'letter': letter.toJson(),
    'created_at': DateTime.now().toIso8601String(),
  };

  static Map fetch(Map data) => data;

  static Map generate(Map data) => data;

  static Map edit(Map data) => data;

  static Map delete(Map data) => data;
}
