part of '../edit_profile.dart';

class _ContactDetails extends StatelessWidget {
  const _ContactDetails();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Divider(
          height: SpaceToken.t28,
        ),
        Text('Contact Details', style: AppText.h3b),
        Space.y.t08,
        const AppFormTextInput(
          name: _FormKeys.cityState,
          placeholder: 'Enter your City, State',
          heading: 'City, State',
        ),
        Space.y.t20,
        const AppFormTextInput(
          name: _FormKeys.address,
          placeholder: 'e.g. 123 Main St, Anytown, USA',
          heading: 'Address',
          helper: 'This is your complete address',
        ),
        Space.y.t20,
        AppFormTextInput(
          name: _FormKeys.phoneNumber,
          placeholder: 'e.g. +1234567890',
          heading: 'Phone Number',
          keyboardType: TextInputType.phone,
          helper: 'Make sure to add country code',
          validators: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Phone number cannot be empty.',
            ),
            FormBuilderValidators.startsWith(
              '+',
              errorText: 'Phone number must start with + CountryCode',
            ),
          ]),
        ),
      ],
    );
  }
}
