import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/user/user_contact_details.dart';
import 'package:lensfolio_mobile_app/models/user/user_tech_stack.dart';
import 'package:lensfolio_mobile_app/services/cache/app_cache.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
sealed class UserData with _$UserData {
  const UserData._();

  factory UserData({
    /// 'id' is the user's id in the database. We'll use this
    /// to do operations related to the user's data.
    required int id,

    /// 'uuid' is the user's uuid created by SupebaseAuth.
    /// We'll use this to do operations related to the user's
    /// account.
    ///
    /// String uuid, // THIS IS NOT IN USER_DATA but in USER from SupabaseAuth
    ///
    @JsonKey(name: 'full_name') required String fullName,
    required String email,
    String? designation,
    @JsonKey(name: 'city_state') String? cityState,
    @JsonKey(name: 'resume_url') String? resumeUrl,
    @JsonKey(name: 'profile_picture') String? profilePicture,
    String? about,
    String? website,
    @JsonKey(name: 'contact_details') UserContactDetails? contactDetails,
    @Default([]) List<String> skills,
    @JsonKey(name: 'tech_stack') @Default([]) List<UserTechStack> techStack,
    @JsonKey(name: 'preferred_roles') @Default([]) List<String> preferredRoles,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);

  String get initials => fullName.substring(0, 2).toUpperCase();

  bool get inCompleteProfile =>
      designation.available ||
      cityState.available ||
      resumeUrl.available ||
      profilePicture.available ||
      about.available ||
      website.available ||
      skills.available ||
      techStack.available ||
      preferredRoles.available ||
      contactDetails?.inComplete == true ||
      skills.available ||
      techStack.available ||
      preferredRoles.available;

  /// Caching helpers
  UserData? get fromCache => AppCache.ins.user;
  void toCache() => AppCache.ins.setUser(this);
}
