part of '../jobs.dart';

class _FetchListener extends StatelessWidget {
  const _FetchListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobsCubit, JobsState>(
      listenWhen: (a, b) => a.fetch != b.fetch,
      listener: (_, state) {
        if (state.fetch.isFailed) {
          UIFlash.error(context, state.fetch.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
