part of '../bloc_sync.dart';

class _LetterSync extends BlocListener<CoverLetterCubit, CoverLetterState> {
  const _LetterSync() : super(listener: _listener, listenWhen: _listenWhen);

  static bool _listenWhen(CoverLetterState prev, CoverLetterState curr) {
    final checks = [
      prev.generate != curr.generate,
      prev.save != curr.save,
      prev.delete != curr.delete,
      prev.edit != curr.edit,
    ];
    return checks.any((check) => check);
  }

  static void _listener(BuildContext context, CoverLetterState state) {
    if (state.generate.isSuccess) {
      final navContext = navigator.currentContext!;
      AppRoutes.generatedLetter.push(
        navContext,
        arguments: {
          'letterPromptResponse': state.generate.data,
        },
      );
    }

    final crudChecks = [
      state.save.isSuccess,
      state.delete.isSuccess,
      state.edit.isSuccess,
    ];

    if (crudChecks.any((check) => check)) {
      CoverLetterCubit.c(context).fetch();
    }
  }
}
