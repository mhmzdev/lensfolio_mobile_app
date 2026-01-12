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
          AppRoutes.home.pushReplace(context);
          UIFlash.success(context, 'User logged in successfully');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
