import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lensfolio_mobile_app/models/cover_letter/letter_prompt_response.dart';

part 'cover_letter.freezed.dart';
part 'cover_letter.g.dart';

@freezed
sealed class CoverLetter with _$CoverLetter {
  const CoverLetter._();

  factory CoverLetter({
    required int id,
    required int uid,
    @JsonKey(name: 'letter') required LetterPromptResponse letter,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CoverLetter;

  factory CoverLetter.fromJson(Map<String, Object?> json) =>
      _$CoverLetterFromJson(json);
}
