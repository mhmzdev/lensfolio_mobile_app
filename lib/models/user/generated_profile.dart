import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lensfolio_mobile_app/models/user/user_contact_details.dart';
import 'package:lensfolio_mobile_app/models/user/user_education.dart';
import 'package:lensfolio_mobile_app/models/user/user_experience.dart';
import 'package:lensfolio_mobile_app/models/user/user_tech_stack.dart';

part 'generated_profile.freezed.dart';
part 'generated_profile.g.dart';

@freezed
sealed class GeneratedProfile with _$GeneratedProfile {
  const factory GeneratedProfile({
    @JsonKey(name: 'full_name') required String fullName,
    required String email,
    String? designation,
    @JsonKey(name: 'city_state') String? cityState,
    String? about,
    String? website,
    @JsonKey(name: 'contact_details') UserContactDetails? contactDetails,
    @Default([]) List<String> skills,
    @JsonKey(name: 'tech_stack') @Default([]) List<UserTechStack> techStack,
    @JsonKey(name: 'preferred_roles') @Default([]) List<String> preferredRoles,
    @Default([]) List<UserEducation> education,
    @Default([]) List<UserExperience> experience,
  }) = _GeneratedProfile;

  factory GeneratedProfile.fromJson(Map<String, Object?> json) =>
      _$GeneratedProfileFromJson(json);
}
