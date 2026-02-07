// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserExperience _$UserExperienceFromJson(Map<String, dynamic> json) =>
    _UserExperience(
      company: json['company'] as String,
      designation: json['designation'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      responsibilities: (json['responsibilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserExperienceToJson(_UserExperience instance) =>
    <String, dynamic>{
      'company': instance.company,
      'designation': instance.designation,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'responsibilities': instance.responsibilities,
    };
