part of '../add_project.dart';

class _CreateListener extends StatelessWidget {
  const _CreateListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listenWhen: (prev, curr) => prev.create != curr.create,
      listener: (context, state) {
        if (state.create.isFailed) {
          UIFlash.error(context, state.create.errorMessage);
        }
        if (state.create.isSuccess) {
          ProjectsCubit.c(context).fetchAll();
          ''.pop(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
