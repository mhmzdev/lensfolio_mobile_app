part of '../edit_profile.dart';

class _FormData {
  static Map<String, dynamic> initialValues(UserData userData) {
    return {
      _FormKeys.fullName: userData.fullName,
      _FormKeys.designation: userData.designation,
      _FormKeys.cityState: userData.cityState,
      _FormKeys.resumeUrl: userData.resumeUrl,
      _FormKeys.phoneNumber: userData.contactDetails?.phoneNumber,
      _FormKeys.address: userData.contactDetails?.address,
    };
  }
}
