part of '../generated_letter.dart';

class _SaveListener extends StatelessWidget {
  const _SaveListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoverLetterCubit, CoverLetterState>(
      listenWhen: (a, b) => a.save != b.save,
      listener: (_, state) {
        if (state.save.isFailed) {
          UIFlash.error(context, state.save.errorMessage);
        }
        if (state.save.isSuccess) {
          ''.pop(context);
          CoverLetterCubit.c(context).fetch();
          UIFlash.success(context, 'Letter has been saved!');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
