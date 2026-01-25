import 'package:freezed_annotation/freezed_annotation.dart';

part 'letter_prompt_response.freezed.dart';
part 'letter_prompt_response.g.dart';

@freezed
sealed class LetterPromptResponse with _$LetterPromptResponse {
  const factory LetterPromptResponse({
    @JsonKey(name: 'letter_body') String? letterBody,

    /// required values
    @JsonKey(name: 'company_name') String? companyName,
    String? position,
    @JsonKey(name: 'job_description') String? jobDescription,

    /// optional values
    @JsonKey(name: 'candidate_name') String? candidateName,
    @JsonKey(name: 'candidate_location') String? candidateLocation,
    @JsonKey(name: 'target_seniority') List<String>? targetSeniority,
    List<String>? skills,
    List<String>? tools,
    @JsonKey(name: 'portfolio_url') String? portfolioUrl,
    String? tone,
    String? length,

    /// error
    String? error,
  }) = _LetterPromptResponse;

  factory LetterPromptResponse.fromJson(Map<String, Object?> json) =>
      _$LetterPromptResponseFromJson(json);
}
