part of '../home.dart';

class _DeleteListener extends StatelessWidget {
  const _DeleteListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (a, b) => a.delete != b.delete,
      listener: (_, state) {
        if (state.delete.isFailed) {
          UIFlash.error(context, state.delete.errorMessage);
        }
        if (state.delete.isSuccess) {
          UIFlash.success(context, 'Account deleted successfully');
          Navigator.popUntil(context, (r) => r.isFirst);
          AppRoutes.login.pushReplace(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
