part of 'edit_profile.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();
  final pageController = PageController();
  int currentTab = 0;

  void setTab(int index) {
    currentTab = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  /// Regex to match nested education/experience field keys
  /// e.g., degree_0_0, school_1_1, exp_startDate_0_0, etc.
  static final _nestedFieldPattern = RegExp(
    r'^(degree|school|startDate|endDate|company|designation|exp_startDate|exp_endDate)_\d+_\d+$',
  );

  void onSave(BuildContext context) {
    try {
      final form = formKey.currentState!;
      final isValid = form.saveAndValidate();
      if (!isValid) return;

      context.dismissKeyboard();
      final cubit = UserCubit.c(context);
      final userData = cubit.state.userData!;

      /// Remove nested field keys from form data
      final cleanedFormData = Map<String, dynamic>.from(form.value)
        ..removeWhere((key, _) => _nestedFieldPattern.hasMatch(key));

      final formData = {
        ...cleanedFormData,

        /// Ensure education and experience are always included,
        /// even if those pages haven't been visited yet
        _FormKeys.education:
            form.value[_FormKeys.education] ?? userData.education,
        _FormKeys.experience:
            form.value[_FormKeys.experience] ?? userData.experience,
      };
      cubit.update(formData);
    } catch (e) {
      e.appLog(level: .error);
      UIFlash.error(context, 'Something went wrong during form submission.');
    }
  }

  bool pickingFile = false;
  void pickResumeFile(BuildContext context) async {
    pickingFile = true;
    notifyListeners();
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null && context.mounted) {
        ''.pop(context); // close modal
        final xfile = result.xFiles.first;
        final file = File(xfile.path);
        UserCubit.c(context).generateProfile(file);
      }
    } catch (e) {
      e.appLog(level: .error);
      if (!context.mounted) return;
      UIFlash.error(context, 'Failed to pickup the resume file.');
    } finally {
      pickingFile = false;
      notifyListeners();
    }
  }

  void onUpdate(
    BuildContext context, {
    required GeneratedProfile profile,
  }) {
    try {
      UserCubit.c(context).update(profile.toJson());
    } catch (e) {
      e.appLog(level: .error);
      UIFlash.error(context, 'Failed to update generated profile!');
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
