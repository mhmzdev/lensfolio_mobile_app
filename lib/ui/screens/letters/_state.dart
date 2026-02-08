part of 'letters.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  void generateCoverLetter(BuildContext context) {
    try {
      final form = formKey.currentState!;
      final isValid = form.saveAndValidate();
      if (!isValid) return;

      final cubit = UserCubit.c(context);
      final user = cubit.state.userData!;

      final projectCubit = ProjectsCubit.c(context);
      final projects = projectCubit.state.projects;

      final formData = form.value;
      final tools = user.techStack.map((t) => t.technologies);
      final flatTools = tools.expand((t) => t).toList();
      final payload = {
        ...formData,
        'candidate_name': user.fullName,
        'candidate_location': user.cityState,
        'target_seniority': user.preferredRoles,
        'skills': user.skills,
        'tools': flatTools,
        'portfolio_url': user.website,
        'tone': 'warm',
        'length': 'standard',
        if (user.preferredRoles.isAvailable)
          'target_seniority': user.preferredRoles,
        if (user.skills.isAvailable) 'skills': user.skills,
        if (user.education.isAvailable)
          'education': user.education.map((e) => e.toJson()).toList(),
        if (user.experience.isAvailable)
          'experience': user.experience.map((e) => e.toJson()).toList(),
        if (projects.available)
          'projects': projects!.map((e) => e.toJson()).toList(),
      };

      CoverLetterCubit.c(context).generate(payload);
    } catch (e) {
      UIFlash.error(
        context,
        'Something went wrong in while submitting the form!',
      );
    }
  }
}
