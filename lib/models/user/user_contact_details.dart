import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';

part 'user_contact_details.freezed.dart';
part 'user_contact_details.g.dart';

@freezed
sealed class UserContactDetails with _$UserContactDetails {
  const UserContactDetails._();

  const factory UserContactDetails({
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String address,
  }) = _UserContactDetails;

  factory UserContactDetails.fromJson(Map<String, Object?> json) =>
      _$UserContactDetailsFromJson(json);

  bool get inComplete => !phoneNumber.available || !address.available;
}
