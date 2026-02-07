part of '../home.dart';

class _UploadProfilePictureListener extends StatelessWidget {
  const _UploadProfilePictureListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FileCubit, FileState>(
      listenWhen: (a, b) => a.uploadProfilePicture != b.uploadProfilePicture,
      listener: (_, state) {
        if (state.uploadProfilePicture.isFailed) {
          UIFlash.error(context, state.uploadProfilePicture.errorMessage);
        }
        if (state.uploadProfilePicture.isSuccess) {
          UIFlash.success(context, 'Request completed successfully');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
