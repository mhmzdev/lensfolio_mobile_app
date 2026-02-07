// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEducation _$UserEducationFromJson(Map<String, dynamic> json) =>
    _UserEducation(
      degree: json['degree'] as String,
      school: json['school'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$UserEducationToJson(_UserEducation instance) =>
    <String, dynamic>{
      'degree': instance.degree,
      'school': instance.school,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
    };
