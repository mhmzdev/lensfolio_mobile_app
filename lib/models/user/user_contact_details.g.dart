// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_contact_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserContactDetails _$UserContactDetailsFromJson(Map<String, dynamic> json) =>
    _UserContactDetails(
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserContactDetailsToJson(_UserContactDetails instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'address': instance.address,
    };
