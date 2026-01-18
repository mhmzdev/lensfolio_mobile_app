part of '../projects.dart';

class _FetchListener extends StatelessWidget {
  const _FetchListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listenWhen: (prev, curr) => prev.fetchAll != curr.fetchAll,
      listener: (context, state) {
        if (state.fetchAll.isFailed) {
          UIFlash.error(context, state.fetchAll.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
