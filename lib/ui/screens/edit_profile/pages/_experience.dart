part of '../edit_profile.dart';

class _Experience extends StatelessWidget {
  const _Experience();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Experience', style: AppText.h3b),
        Text(
          'Add your professional work experience and roles.',
          style: AppText.b2,
        ),
        Space.y.t12,
        FormBuilderField<List<UserExperience>>(
          name: _FormKeys.experience,
          builder: (field) {
            final experienceList = field.value ?? [];

            return Column(
              children: [
                ...experienceList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final experience = entry.value;

                  return _ExperienceItem(
                    index: index,
                    experience: experience,
                    onChanged: (updated) {
                      final newList = List<UserExperience>.from(experienceList);
                      newList[index] = updated;
                      field.didChange(newList);
                    },
                    onRemove: () {
                      final newList = List<UserExperience>.from(experienceList);
                      newList.removeAt(index);
                      field.didChange(newList);
                    },
                  );
                }),
                Space.y.t16,
                AppButton(
                  label: 'Add Experience',
                  style: .primaryBorder,
                  icon: LucideIcons.plus,
                  onTap: () {
                    final newList = List<UserExperience>.from(experienceList);
                    newList.add(
                      UserExperience(
                        company: '',
                        designation: '',
                        startDate: DateTime.now(),
                        responsibilities: [],
                      ),
                    );
                    field.didChange(newList);
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final int index;
  final UserExperience experience;
  final ValueChanged<UserExperience> onChanged;
  final VoidCallback onRemove;

  const _ExperienceItem({
    required this.index,
    required this.experience,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Space.v.t08,
      padding: Space.a.t16,
      decoration: BoxDecoration(
        color: AppTheme.c.text.withValues(alpha: .03),
        borderRadius: 12.radius(),
        border: Border.all(color: AppTheme.c.text.withValues(alpha: .08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Job Entry #${index + 1}', style: AppText.b1b),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: onRemove,
                icon: Icon(
                  LucideIcons.trash_2,
                  size: 20,
                  color: AppTheme.c.dangerBase,
                ),
              ),
            ],
          ),
          Space.y.t12,
          AppFormTextInput(
            name: 'company_${index}_$index',
            heading: 'Company Name',
            placeholder: 'e.g. Google, Apple, Freelance',
            initialValue: experience.company,
            onChanged: (val) =>
                onChanged(experience.copyWith(company: val ?? '')),
          ),
          Space.y.t12,
          AppFormTextInput(
            name: 'designation_${index}_$index',
            heading: 'Designation / Role',
            placeholder: 'e.g. Senior Software Engineer',
            initialValue: experience.designation,
            onChanged: (val) =>
                onChanged(experience.copyWith(designation: val ?? '')),
          ),
          Space.y.t12,
          Row(
            children: [
              Expanded(
                child: AppFormDateInput(
                  name: 'exp_startDate_${index}_$index',
                  heading: 'Start Date',
                  initialValue: experience.startDate,
                  onChanged: (date) {
                    if (date != null) {
                      onChanged(experience.copyWith(startDate: date));
                    }
                  },
                ),
              ),
              Space.x.t12,
              Expanded(
                child: AppFormDateInput(
                  name: 'exp_endDate_${index}_$index',
                  heading: 'End Date',
                  initialValue: experience.endDate,
                  onChanged: (date) =>
                      onChanged(experience.copyWith(endDate: date)),
                ),
              ),
            ],
          ),
          Space.y.t16,
          Text('Responsibilities', style: AppText.b2 + FontWeight.w600),
          Space.y.t04,
          AppChipsInput<String>(
            values: experience.responsibilities,
            onChanged: (responsibilities) => onChanged(
              experience.copyWith(responsibilities: responsibilities),
            ),
            inputTransformer: (val) => val,
            displayTransformer: (val) => val,
            placeholder: 'Add responsibility and press enter...',
          ),
        ],
      ),
    );
  }
}
