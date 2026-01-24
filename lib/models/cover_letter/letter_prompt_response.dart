import 'package:freezed_annotation/freezed_annotation.dart';

part 'letter_prompt_response.freezed.dart';
part 'letter_prompt_response.g.dart';

@freezed
sealed class LetterPromptResponse with _$LetterPromptResponse {
  const factory LetterPromptResponse({
    required String prompt,
    required String response,
    String? error,
  }) = _LetterPromptResponse;

  factory LetterPromptResponse.fromJson(Map<String, Object?> json) =>
      _$LetterPromptResponseFromJson(json);
}
