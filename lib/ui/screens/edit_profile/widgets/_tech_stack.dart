part of '../edit_profile.dart';

class _TechStack extends StatelessWidget {
  const _TechStack();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: SpaceToken.t28,
        ),
        Text('Tech Stack', style: AppText.h3b),
        Text(
          'Add in your technologies for each category and press enter to add them.',
          style: AppText.b2,
        ),
        Space.y.t12,
        FormBuilderField<List<UserTechStack>>(
          name: _FormKeys.techStack,
          builder: (field) {
            final currentValues = field.value ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: TechStack.values.map((category) {
                final entry = currentValues.firstWhere(
                  (e) => e.category == category,
                  orElse: () =>
                      UserTechStack(category: category, technologies: []),
                );

                return Padding(
                  padding: Space.v.t08,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.name.titleCase, style: AppText.b1b),
                      Space.y.t04,
                      AppChipsInput<String>(
                        values: entry.technologies,
                        onChanged: (newTechnologies) {
                          final newList = List<UserTechStack>.from(
                            currentValues,
                          );
                          final index = newList.indexWhere(
                            (e) => e.category == category,
                          );

                          if (index != -1) {
                            newList[index] = entry.copyWith(
                              technologies: newTechnologies,
                            );
                          } else {
                            newList.add(
                              UserTechStack(
                                category: category,
                                technologies: newTechnologies,
                              ),
                            );
                          }
                          field.didChange(newList);
                        },
                        inputTransformer: (val) => val,
                        displayTransformer: (val) => val,
                        placeholder: 'Add ${category.name} tech stack...',
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
