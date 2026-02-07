part of '../edit_profile.dart';

class _UpdateListener extends StatelessWidget {
  const _UpdateListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (a, b) => a.update != b.update,
      listener: (_, state) {
        if (state.update.isFailed) {
          UIFlash.error(context, state.update.errorMessage);
        }
        if (state.update.isSuccess) {
          UserCubit.c(context).fetch();
          ''.pop(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
