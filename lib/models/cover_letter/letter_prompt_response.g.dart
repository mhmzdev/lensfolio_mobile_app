// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_prompt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LetterPromptResponse _$LetterPromptResponseFromJson(
  Map<String, dynamic> json,
) => _LetterPromptResponse(
  prompt: json['prompt'] as String,
  response: json['response'] as String,
  error: json['error'] as String?,
);

Map<String, dynamic> _$LetterPromptResponseToJson(
  _LetterPromptResponse instance,
) => <String, dynamic>{
  'prompt': instance.prompt,
  'response': instance.response,
  'error': instance.error,
};
