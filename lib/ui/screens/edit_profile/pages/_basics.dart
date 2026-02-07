part of '../edit_profile.dart';

class _Basics extends StatelessWidget {
  const _Basics();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text('Basic Information', style: AppText.h3b),
        Space.y.t08,
        AppFormTextInput(
          name: _FormKeys.fullName,
          placeholder: 'e.g. John Doe',
          validators: Validators.name(),
          heading: 'Full Name',
          helper: 'Make sure to follow whats written in your CV/Resume.',
          keyboardType: TextInputType.name,
        ),
        Space.y.t20,
        const AppFormTextInput(
          name: _FormKeys.designation,
          placeholder: 'e.g. Software Engineer',
          heading: 'Designation',
          helper:
              'Could be your current, or past. You may use \'Freelancer\' if you are a freelancer.',
        ),
        Space.y.t20,
        AppFormTextInput(
          name: _FormKeys.resumeUrl,
          placeholder: 'e.g. https://your-resume.com',
          heading: 'Resume URL',
          validators: FormBuilderValidators.url(),
          keyboardType: TextInputType.url,
        ),
      ],
    );
  }
}
