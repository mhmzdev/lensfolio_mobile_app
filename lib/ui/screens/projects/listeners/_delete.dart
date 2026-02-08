part of '../projects.dart';

class _DeleteListener extends StatelessWidget {
  const _DeleteListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listenWhen: (prev, curr) => prev.delete != curr.delete,
      listener: (context, state) {
        if (state.delete.isFailed) {
          UIFlash.error(context, state.delete.errorMessage);
        }
        if (state.delete.isSuccess) {
          ''.pop(context); // alert
          ProjectsCubit.c(context).fetchAll();
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
