part of 'generated_letter.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  _ScreenState(this.letterPromptResponse);

  final formKey = GlobalKey<FormBuilderState>();

  late LetterPromptResponse letterPromptResponse;

  void onCopy(BuildContext context) async {
    try {
      final form = formKey.currentState!;
      final isValid = form.saveAndValidate();
      if (!isValid) return;
      final values = form.value;
      final letterBody = values[_FormKeys.letterBody] as String;
      await Clipboard.setData(ClipboardData(text: letterBody));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        UIFlash.success(
          context,
          'Letter copied to clipboard',
          position: .bottom,
        );
      });
    } catch (e) {
      if (!context.mounted) return;
      UIFlash.error(
        context,
        'Something went wrong in while copying the letter!',
        position: .bottom,
      );
    }
  }

  void onSave(BuildContext context) {
    context.dismissKeyboard();

    try {
      final form = formKey.currentState!;
      final isValid = form.saveAndValidate();
      if (!isValid) return;
      final values = form.value;
      final letterBody = values[_FormKeys.letterBody] as String;
      final letter = letterPromptResponse.copyWith(letterBody: letterBody);
      CoverLetterCubit.c(context).save(letter);
    } catch (e) {
      if (!context.mounted) return;
      UIFlash.error(
        context,
        'Something went wrong in while saving the letter!',
        position: .bottom,
      );
    }
  }
}
