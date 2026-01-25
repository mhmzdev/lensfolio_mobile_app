part of '../letters.dart';

class _LetterCRUD extends StatelessWidget {
  const _LetterCRUD();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CoverLetterCubit, CoverLetterState>(
          listenWhen: (prev, curr) => prev.fetch != curr.fetch,
          listener: (context, state) {
            if (state.fetch.isFailed) {
              UIFlash.error(context, state.fetch.errorMessage);
            }
          },
        ),
        BlocListener<CoverLetterCubit, CoverLetterState>(
          listenWhen: (prev, curr) => prev.delete != curr.delete,
          listener: (context, state) {
            if (state.delete.isFailed) {
              UIFlash.error(context, state.delete.errorMessage);
            }

            if (state.delete.isSuccess) {
              CoverLetterCubit.c(context).fetch();
              UIFlash.success(context, 'Letter has been deleted!');
            }
          },
        ),
      ],
      child: const SizedBox.shrink(),
    );
  }
}
