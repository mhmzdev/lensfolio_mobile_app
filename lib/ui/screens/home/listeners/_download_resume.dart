part of '../home.dart';

class _DownloadResumeListener extends StatelessWidget {
  const _DownloadResumeListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FileCubit, FileState>(
      listenWhen: (a, b) => a.downloadResume != b.downloadResume,
      listener: (_, state) {
        if (state.downloadResume.isFailed) {
          UIFlash.error(context, state.downloadResume.errorMessage);
        }
        if (state.downloadResume.isSuccess) {
          UIFlash.success(context, 'Resume saved on your device!');
          /// TODO: Save the file locally
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
