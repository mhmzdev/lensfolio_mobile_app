part of '../add_project.dart';

class _UpdateListener extends StatelessWidget {
  const _UpdateListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listenWhen: (prev, curr) => prev.update != curr.update,
      listener: (context, state) {
        if (state.update.isFailed) {
          UIFlash.error(context, state.update.errorMessage);
        }
        if (state.update.isSuccess) {
          ProjectsCubit.c(context).fetchAll();
          ''.pop(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
