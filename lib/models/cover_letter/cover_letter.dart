import 'package:freezed_annotation/freezed_annotation.dart';

part 'cover_letter.freezed.dart';
part 'cover_letter.g.dart';

@freezed
sealed class CoverLetter with _$CoverLetter {
  const factory CoverLetter({
    required int id,
    required int uid,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'position') required String position,
    @JsonKey(name: 'job_description') String? jobDescription,
    @JsonKey(name: 'letter_body') required String letterBody,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _CoverLetter;

  factory CoverLetter.fromJson(Map<String, Object?> json) =>
      _$CoverLetterFromJson(json);
}
