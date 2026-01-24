import 'package:freezed_annotation/freezed_annotation.dart';

import 'letter_prompt_response.dart';

part 'cover_letter.freezed.dart';
part 'cover_letter.g.dart';

@freezed
sealed class CoverLetter with _$CoverLetter {
  const CoverLetter._();

  factory CoverLetter({
    required int id,
    required int uid,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'position') required String position,
    @JsonKey(name: 'job_description') String? jobDescription,
    @JsonKey(name: 'letter_body') String? letterBody,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CoverLetter;

  factory CoverLetter.fromJson(Map<String, Object?> json) =>
      _$CoverLetterFromJson(json);

  Future<CoverLetter> fromLetterResponse(
    LetterPromptResponse genResponse,
  ) async => CoverLetter(
    id: id,
    uid: uid,
    companyName: companyName,
    position: position,
    jobDescription: jobDescription,
    letterBody: genResponse.letterBody,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
