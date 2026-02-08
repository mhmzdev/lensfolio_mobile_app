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
          final payload = {
            'profile_picture': state.uploadProfilePicture.getData,
          };
          UIFlash.success(
            context,
            'Profile picture updated. Refreshing in 5 mins.',
          );
          _ScreenState.s(context).updateProfile(context, payload: payload);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
