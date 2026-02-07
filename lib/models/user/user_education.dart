import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_education.freezed.dart';
part 'user_education.g.dart';

@freezed
sealed class UserEducation with _$UserEducation {
  const factory UserEducation({
    required String degree,
    required String school,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
  }) = _UserEducation;

  factory UserEducation.fromJson(Map<String, Object?> json) =>
      _$UserEducationFromJson(json);
}
