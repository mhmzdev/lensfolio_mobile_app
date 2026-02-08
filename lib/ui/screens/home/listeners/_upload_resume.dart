part of '../home.dart';

class _UploadResumeListener extends StatelessWidget {
  const _UploadResumeListener();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);

    return BlocListener<FileCubit, FileState>(
      listenWhen: (a, b) => a.uploadResume != b.uploadResume,
      listener: (_, state) {
        if (state.uploadResume.isFailed) {
          UIFlash.error(context, state.uploadResume.errorMessage);
        }
        if (state.uploadResume.isSuccess) {
          final payload = {
            'resume_path': state.uploadResume.data,
          };
          screenState.updateProfile(context, payload: payload);
          UIFlash.success(context, 'Resume uploaded successfully');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
