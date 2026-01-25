part of '../login.dart';

class _LoginListener extends StatelessWidget {
  const _LoginListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (a, b) => a.login != b.login,
      listener: (_, state) {
        if (state.login.isFailed) {
          UIFlash.error(context, state.login.errorMessage);
        }
        if (state.login.isSuccess) {
          final user = state.userData!;
          SetupCubit.setupCubit(context, user.id);
          AppRoutes.home.pushReplace(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
