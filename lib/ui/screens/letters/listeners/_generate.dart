part of '../letters.dart';

class _GenerateListener extends StatelessWidget {
  const _GenerateListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoverLetterCubit, CoverLetterState>(
      listenWhen: (a, b) => a.generate != b.generate,
      listener: (_, state) {
        if (state.generate.isFailed) {
          UIFlash.error(context, state.generate.errorMessage);
        }
        if (state.generate.isSuccess) {
          UIFlash.success(context, 'Cover letter generated successfully');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
