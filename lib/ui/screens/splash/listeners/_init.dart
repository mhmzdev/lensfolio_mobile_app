part of '../splash.dart';

class _InitListener extends StatelessWidget {
  const _InitListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (a, b) => a.init != b.init,
      listener: (_, state) {
        if (state.init.isFailed) {
          UIFlash.error(context, state.init.errorMessage);
        }

        if (state.init.isSuccess) {
          final isLoggedIn = state.userData != null;
          if (isLoggedIn) {
            AppRoutes.home.pushReplace(context);
          } else {
            AppRoutes.login.slowHeroPushReplacement(
              context,
              screen: const LoginScreen(),
            );
          }
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
