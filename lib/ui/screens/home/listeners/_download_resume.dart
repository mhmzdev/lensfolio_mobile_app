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
          final file = state.downloadResume.data!;
          UIFlash.success(context, 'Resume saved on your device');
          _ScreenState.s(context).shareFile(file);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
