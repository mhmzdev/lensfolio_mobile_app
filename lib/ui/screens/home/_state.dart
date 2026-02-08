part of 'home.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  void shareFile(File file) async {
    try {
      final params = ShareParams(files: [XFile(file.path)]);
      await SharePlus.instance.share(params);
    } catch (e) {
      e.appLog(level: .error);
    }
  }

  bool pickingFile = false;
  void pickResumeFile(BuildContext context, {bool exists = false}) async {
    pickingFile = true;
    notifyListeners();
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null && context.mounted) {
        final xfile = result.xFiles.first;
        final file = File(xfile.path);
        FileCubit.c(context).uploadResume(file, exists: exists);
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

  void updateProfile(
    BuildContext context, {
    required Map<String, dynamic> payload,
  }) {
    try {
      UserCubit.c(context).update(payload);
    } catch (e) {
      e.appLog(level: .error);
      UIFlash.success(context, 'Failed to update profile!');
    }
  }

  void downloadResume(BuildContext context) async {
    try {
      final userCubit = UserCubit.c(context);
      final filePath = userCubit.state.userData!.resumePath;
      if (filePath == null) return;
      FileCubit.c(context).downloadResume(filePath);
    } catch (e) {
      e.appLog(level: .error);
      if (!context.mounted) return;
      UIFlash.error(context, 'Failed to download resume!');
    }
  }
}
