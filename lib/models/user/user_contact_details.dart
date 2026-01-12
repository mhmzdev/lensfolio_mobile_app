import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_contact_details.freezed.dart';
part 'user_contact_details.g.dart';

@freezed
sealed class UserContactDetails with _$UserContactDetails {
  const factory UserContactDetails({
    required String phoneNumber,
    required String address,
  }) = _UserContactDetails;

  factory UserContactDetails.fromJson(Map<String, Object?> json) =>
      _$UserContactDetailsFromJson(json);
}
