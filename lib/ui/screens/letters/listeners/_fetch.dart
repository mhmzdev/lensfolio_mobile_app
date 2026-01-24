part of '../letters.dart';

class _FetchListener extends StatelessWidget {
  const _FetchListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoverLetterCubit, CoverLetterState>(
      listenWhen: (prev, curr) => prev.fetch != curr.fetch,
      listener: (context, state) {
        if (state.fetch.isFailed) {
          UIFlash.error(context, state.fetch.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
