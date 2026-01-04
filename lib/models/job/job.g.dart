// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Job _$JobFromJson(Map<String, dynamic> json) => _Job(
  id: (json['id'] as num).toInt(),
  url: json['url'] as String,
  title: json['title'] as String,
  companyName: json['company_name'] as String,
  companyLogo: json['company_logo'] as String,
  category: json['category'] as String,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  jobType: json['jobType'] as String?,
  publicationDate: DateTime.parse(json['publication_date'] as String),
  candidateRequiredLocation: json['candidate_required_location'] as String?,
  salary: json['salary'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$JobToJson(_Job instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'title': instance.title,
  'company_name': instance.companyName,
  'company_logo': instance.companyLogo,
  'category': instance.category,
  'tags': instance.tags,
  'jobType': instance.jobType,
  'publication_date': instance.publicationDate.toIso8601String(),
  'candidate_required_location': instance.candidateRequiredLocation,
  'salary': instance.salary,
  'description': instance.description,
};
