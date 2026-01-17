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
      details?.inComplete == true ||
      skills.available ||
      techStack.available ||
      preferredRoles.available;

  /// Caching helpers
  UserData? get fromCache => AppCache.ins.user;
  void toCache() => AppCache.ins.setUser(this);
}
