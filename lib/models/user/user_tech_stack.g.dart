// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tech_stack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTechStack _$UserTechStackFromJson(Map<String, dynamic> json) =>
    _UserTechStack(
      category: $enumDecode(_$TechStackEnumMap, json['category']),
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserTechStackToJson(_UserTechStack instance) =>
    <String, dynamic>{
      'category': _$TechStackEnumMap[instance.category]!,
      'technologies': instance.technologies,
    };

const _$TechStackEnumMap = {
  TechStack.frontend: 'frontend',
  TechStack.backend: 'backend',
  TechStack.database: 'database',
  TechStack.devops: 'devops',
  TechStack.design: 'design',
  TechStack.other: 'other',
};
