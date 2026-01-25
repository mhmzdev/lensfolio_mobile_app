// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_prompt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LetterPromptResponse _$LetterPromptResponseFromJson(
  Map<String, dynamic> json,
) => _LetterPromptResponse(
  letterBody: json['letter_body'] as String?,
  companyName: json['company_name'] as String?,
  position: json['position'] as String?,
  jobDescription: json['job_description'] as String?,
  candidateName: json['candidate_name'] as String?,
  candidateLocation: json['candidate_location'] as String?,
  targetSeniority: (json['target_seniority'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
  tools: (json['tools'] as List<dynamic>?)?.map((e) => e as String).toList(),
  portfolioUrl: json['portfolio_url'] as String?,
  tone: json['tone'] as String?,
  length: json['length'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$LetterPromptResponseToJson(
  _LetterPromptResponse instance,
) => <String, dynamic>{
  'letter_body': instance.letterBody,
  'company_name': instance.companyName,
  'position': instance.position,
  'job_description': instance.jobDescription,
  'candidate_name': instance.candidateName,
  'candidate_location': instance.candidateLocation,
  'target_seniority': instance.targetSeniority,
  'skills': instance.skills,
  'tools': instance.tools,
  'portfolio_url': instance.portfolioUrl,
  'tone': instance.tone,
  'length': instance.length,
  'error': instance.error,
};
