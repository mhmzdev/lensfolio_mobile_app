// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_letter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoverLetter _$CoverLetterFromJson(Map<String, dynamic> json) => _CoverLetter(
  id: (json['id'] as num).toInt(),
  uid: (json['uid'] as num).toInt(),
  companyName: json['company_name'] as String,
  position: json['position'] as String,
  jobDescription: json['job_description'] as String?,
  letterBody: json['letter_body'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CoverLetterToJson(_CoverLetter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'company_name': instance.companyName,
      'position': instance.position,
      'job_description': instance.jobDescription,
      'letter_body': instance.letterBody,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
