part of '../edit_profile.dart';

class _Education extends StatelessWidget {
  const _Education();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Education', style: AppText.h3b),
        Text(
          'Add your academic background and qualifications.',
          style: AppText.b2,
        ),
        Space.y.t12,
        FormBuilderField<List<UserEducation>>(
          name: _FormKeys.education,
          builder: (field) {
            final educationList = field.value ?? [];

            return Column(
              children: [
                ...educationList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final education = entry.value;

                  return _EducationItem(
                    index: index,
                    education: education,
                    onChanged: (updated) {
                      final newList = List<UserEducation>.from(educationList);
                      newList[index] = updated;
                      field.didChange(newList);
                    },
                    onRemove: () {
                      final newList = List<UserEducation>.from(educationList);
                      newList.removeAt(index);
                      field.didChange(newList);
                    },
                  );
                }),
                Space.y.t16,
                AppButton(
                  label: 'Add Education',
                  style: .primaryBorder,
                  icon: LucideIcons.plus,
                  onTap: () {
                    final newList = List<UserEducation>.from(educationList);
                    newList.add(
                      UserEducation(
                        degree: '',
                        school: '',
                        startDate: DateTime.now(),
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

class _EducationItem extends StatelessWidget {
  final int index;
  final UserEducation education;
  final ValueChanged<UserEducation> onChanged;
  final VoidCallback onRemove;

  const _EducationItem({
    required this.index,
    required this.education,
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
              Text('Education Entry #${index + 1}', style: AppText.b1b),
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
            name: 'degree_${index}_$index',
            heading: 'Degree / Qualification',
            placeholder: 'e.g. Bachelor of Science in Computer Science',
            initialValue: education.degree,
            onChanged: (val) =>
                onChanged(education.copyWith(degree: val ?? '')),
          ),
          Space.y.t12,
          AppFormTextInput(
            name: 'school_${index}_$index',
            heading: 'School / University',
            placeholder: 'e.g. Stanford University',
            initialValue: education.school,
            onChanged: (val) =>
                onChanged(education.copyWith(school: val ?? '')),
          ),
          Space.y.t12,
          Row(
            children: [
              Expanded(
                child: AppFormDateInput(
                  name: 'startDate_${index}_$index',
                  heading: 'Start Date',
                  placeholder: 'e.g. Feb, 2020',
                  initialValue: education.startDate,
                  onChanged: (date) {
                    if (date == null) return;
                    onChanged(education.copyWith(startDate: date));
                  },
                ),
              ),
              Space.x.t12,
              Expanded(
                child: AppFormDateInput(
                  name: 'endDate_${index}_$index',
                  heading: 'End Date',
                  placeholder: 'e.g. Feb, 2024',
                  initialValue: education.endDate,
                  onChanged: (date) =>
                      onChanged(education.copyWith(endDate: date)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
