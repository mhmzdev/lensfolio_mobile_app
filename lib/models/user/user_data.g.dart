// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  uid: json['uid'] as String,
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'uid': instance.uid,
  'fullName': instance.fullName,
  'email': instance.email,
  'createdAt': instance.createdAt.toIso8601String(),
};
