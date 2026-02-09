part of '../register.dart';

class _RegisterListener extends StatelessWidget {
  const _RegisterListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (a, b) => a.register != b.register,
      listener: (_, state) {
        if (state.register.isFailed) {
          UIFlash.error(context, state.register.errorMessage);
        }
        if (state.register.isSuccess) {
          ''.pop(context);
          UIFlash.success(
            context,
            'Account created successfully, please verify your email & login!',
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
