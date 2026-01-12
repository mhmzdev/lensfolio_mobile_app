import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lensfolio_mobile_app/models/user/user_contact_details.dart';
import 'package:lensfolio_mobile_app/models/user/user_tech_stack.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
sealed class UserData with _$UserData {
  const factory UserData({
    required int id,
    required String fullName,
    required String email,
    String? designation,
    String? cityState,
    String? resumeUrl,
    String? profilePicture,
    String? about,
    String? website,
    UserContactDetails? details,
    @Default([]) List<String> skills,
    @Default([]) List<UserTechStack> techStack,
    @Default([]) List<String> preferredRoles,
    required DateTime createdAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
}
