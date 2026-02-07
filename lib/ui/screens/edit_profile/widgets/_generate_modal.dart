part of '../edit_profile.dart';

class _GenerateModal extends StatelessWidget {
  const _GenerateModal();

  @override
  Widget build(BuildContext context) {
    return AppModal(
      expanded: false,
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.sparkles, color: AppTheme.c.primary),
              Space.x.t08,
              Text('Auto-fill with AI', style: AppText.h2b),
            ],
          ),
          Space.y.t16,
          Text(
            'Upload your resume and let AI do the heavy lifting!',
            style: AppText.b1b,
          ),
          Space.y.t12,
          Text(
            'Our AI will analyze your resume and automatically extract:',
            style: AppText.b2 + AppTheme.c.subText,
          ),
          Space.y.t12,
          ..._buildFeatureList(),
          Space.y.t08,
          Text(
            'You can review and edit any extracted information before saving.',
            style: AppText.b2 + AppTheme.c.subText,
          ),
          Space.y.t24,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  style: .primaryBorder,
                  label: 'Back',
                  icon: LucideIcons.arrow_left,
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Space.x.t12,
              Expanded(
                child: Consumer<_ScreenState>(
                  builder: (context, state, child) => AppButton(
                    label: 'Upload Resume',
                    icon: LucideIcons.upload,
                    onTap: () => state.pickResumeFile(context),
                    state: state.pickingFile ? .disabled : .def,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFeatureList() {
    final features = [
      'Personal details & contact info',
      'Work experience & responsibilities',
      'Education history',
      'Skills & tech stack',
    ];

    return features
        .map(
          (feature) => Padding(
            padding: Space.b.t08,
            child: Row(
              children: [
                Icon(
                  LucideIcons.circle_check,
                  size: 16,
                  color: AppTheme.c.successBase,
                ),
                Space.x.t08,
                Expanded(
                  child: Text(feature, style: AppText.b2),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
