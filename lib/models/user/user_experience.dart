import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_experience.freezed.dart';
part 'user_experience.g.dart';

@freezed
sealed class UserExperience with _$UserExperience {
  const factory UserExperience({
    required String company,
    required String designation,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    required List<String> responsibilities,
  }) = _UserExperience;

  factory UserExperience.fromJson(Map<String, Object?> json) =>
      _$UserExperienceFromJson(json);
}
