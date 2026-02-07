part of '../edit_profile.dart';

class _GenerateProfileListener extends StatelessWidget {
  const _GenerateProfileListener();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);
    return BlocConsumer<UserCubit, UserState>(
      listenWhen: (a, b) => a.generateProfile != b.generateProfile,
      listener: (_, state) {
        if (state.generateProfile.isFailed) {
          UIFlash.error(context, state.generateProfile.errorMessage);
        }
        if (state.generateProfile.isSuccess) {
          screenState.onUpdate(context, profile: state.generateProfile.getData);
          UIFlash.success(context, 'Profile generated successfully!');
        }
      },
      builder: (context, state) {
        final loading = state.generateProfile.isLoading;
        return FullScreenLoader(
          loading: loading,
          loadingText: 'Generating profile...',
        );
      },
    );
  }
}
