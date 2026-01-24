// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_prompt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LetterPromptResponse _$LetterPromptResponseFromJson(
  Map<String, dynamic> json,
) => _LetterPromptResponse(
  letterBody: json['letter_body'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$LetterPromptResponseToJson(
  _LetterPromptResponse instance,
) => <String, dynamic>{
  'letter_body': instance.letterBody,
  'error': instance.error,
};
