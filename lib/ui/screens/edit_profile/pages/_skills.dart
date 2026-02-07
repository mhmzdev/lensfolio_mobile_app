part of '../edit_profile.dart';

class _Skills extends StatelessWidget {
  const _Skills();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: SpaceToken.t28,
        ),
        Text('Skills', style: AppText.h3b),
        Text(
          'Add in a skill and press enter to add it to the list.',
          style: AppText.b2,
        ),
        Space.y.t12,
        AppFormChipsInput<String>(
          name: _FormKeys.skills,
          placeholder: 'Add a skill e.g. AI Driven Development',
          inputTransformer: (val) => val,
          displayTransformer: (val) => val,
          validator: FormBuilderValidators.required(
            errorText: 'Please add at least one skill',
          ),
        ),
      ],
    );
  }
}
