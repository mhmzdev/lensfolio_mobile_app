part of '../home.dart';

class _LogoutListener extends StatelessWidget {
  const _LogoutListener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listenWhen: (a, b) => a.logout != b.logout,
      listener: (_, state) {
        if (state.logout.isFailed) {
          UIFlash.error(context, state.logout.errorMessage);
        }
        if (state.logout.isSuccess) {
          SetupCubit.resetCubit(context);
          AppRoutes.login.pushReplace(context);
        }
      },
      builder: (context, state) {
        final loading = state.logout.isLoading;
        return FullScreenLoader(
          loading: loading,
          loadingText: 'Logging out...',
        );
      },
    );
  }
}
