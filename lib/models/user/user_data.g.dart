// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  designation: json['designation'] as String?,
  cityState: json['city_state'] as String?,
  resumeUrl: json['resume_url'] as String?,
  profilePicture: json['profile_picture'] as String?,
  about: json['about'] as String?,
  website: json['website'] as String?,
  contactDetails: json['contact_details'] == null
      ? null
      : UserContactDetails.fromJson(
          json['contact_details'] as Map<String, dynamic>,
        ),
  skills:
      (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  techStack:
      (json['tech_stack'] as List<dynamic>?)
          ?.map((e) => UserTechStack.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  preferredRoles:
      (json['preferred_roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'full_name': instance.fullName,
  'email': instance.email,
  'designation': instance.designation,
  'city_state': instance.cityState,
  'resume_url': instance.resumeUrl,
  'profile_picture': instance.profilePicture,
  'about': instance.about,
  'website': instance.website,
  'contact_details': instance.contactDetails?.toJson(),
  'skills': instance.skills,
  'tech_stack': instance.techStack.map((e) => e.toJson()).toList(),
  'preferred_roles': instance.preferredRoles,
  'created_at': instance.createdAt.toIso8601String(),
};
