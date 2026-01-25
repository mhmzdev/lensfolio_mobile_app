part of '../splash.dart';

class _InitListener extends StatelessWidget {
  const _InitListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (a, b) => a.init != b.init || a.logout != b.logout,
      listener: (_, state) {
        if (state.init.isFailed) {
          UIFlash.error(context, state.init.errorMessage);
        }

        if (state.init.isSuccess) {
          final isLoggedIn = state.userData != null;
          if (isLoggedIn) {
            final user = state.userData!;
            SetupCubit.setupCubit(context, user.id);
            AppRoutes.home.pushReplace(context);
          } else {
            AppRoutes.login.slowHeroPushReplacement(
              context,
              screen: const LoginScreen(),
            );
          }
        }

        if (state.logout.isSuccess) {
          UIFlash.error(context, 'Please re-login, session expired');
          AppRoutes.login.pushReplace(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
