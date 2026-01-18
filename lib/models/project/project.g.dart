// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: (json['id'] as num).toInt(),
  uid: (json['uid'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  technologies: (json['technologies'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  imageUrl: json['image_url'] as String?,
  githubUrl: json['github_url'] as String?,
  liveUrl: json['live_url'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'title': instance.title,
  'description': instance.description,
  'technologies': instance.technologies,
  'image_url': instance.imageUrl,
  'github_url': instance.githubUrl,
  'live_url': instance.liveUrl,
  'created_at': instance.createdAt.toIso8601String(),
};
