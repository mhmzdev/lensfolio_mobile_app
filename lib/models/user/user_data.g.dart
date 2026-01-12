// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  designation: json['designation'] as String?,
  cityState: json['cityState'] as String?,
  resumeUrl: json['resumeUrl'] as String?,
  profilePicture: json['profilePicture'] as String?,
  about: json['about'] as String?,
  website: json['website'] as String?,
  details: json['details'] == null
      ? null
      : UserContactDetails.fromJson(json['details'] as Map<String, dynamic>),
  skills:
      (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  techStack:
      (json['techStack'] as List<dynamic>?)
          ?.map((e) => UserTechStack.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  preferredRoles:
      (json['preferredRoles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'designation': instance.designation,
  'cityState': instance.cityState,
  'resumeUrl': instance.resumeUrl,
  'profilePicture': instance.profilePicture,
  'about': instance.about,
  'website': instance.website,
  'details': instance.details?.toJson(),
  'skills': instance.skills,
  'techStack': instance.techStack.map((e) => e.toJson()).toList(),
  'preferredRoles': instance.preferredRoles,
  'createdAt': instance.createdAt.toIso8601String(),
};
