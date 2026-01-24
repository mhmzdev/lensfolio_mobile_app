part of '../letters.dart';

class _LetterGenerator extends StatelessWidget {
  const _LetterGenerator();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);

    return Container(
      padding: Space.a.t20,
      decoration: AppProps.softBoxDecoration,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.sparkles,
                size: SpaceToken.t24,
                color: AppTheme.c.primary,
              ),
              Space.x.t08,
              Text('AI Cover Letter Generator', style: AppText.h3b),
            ],
          ),
          Space.y.t16,
          AppFormTextInput(
            name: _FormKeys.companyName,
            placeholder: 'e.g. Google',
            heading: 'Company Name',
            keyboardType: TextInputType.name,
            validators: FormBuilderValidators.required(
              errorText: 'Company name is required',
            ),
          ),
          Space.y.t16,
          AppFormTextInput(
            name: _FormKeys.position,
            placeholder: 'e.g. Software Engineer',
            heading: 'Position',
            keyboardType: TextInputType.name,
            validators: FormBuilderValidators.required(
              errorText: 'Position is required',
            ),
          ),
          Space.y.t16,
          const AppFormTextInput(
            name: _FormKeys.jobDescription,
            placeholder:
                'e.g. We are seeking a talented Flutter Developer to join our dynamic team. The ideal candidate will have experience building cross-platform mobile applications using Flutter and Dart. You will be responsible for developing high-quality mobile apps, collaborating with cross-functional teams, and ensuring optimal performance across iOS and Android platforms. Strong knowledge of state management, RESTful APIs, and modern development practices is required.',
            heading: 'Job Description (Optional)',
            keyboardType: TextInputType.multiline,
          ),
          Space.y.t20,
          AppButton(
            label: 'Generate Letter',
            icon: LucideIcons.sparkles,
            style: .primary,
            onTap: () => screenState.generateCoverLetter(context),
          ),
        ],
      ),
    );
  }
}
