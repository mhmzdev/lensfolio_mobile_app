part of 'register.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  /// Validates and submits the registration form
  void onSubmit(BuildContext context) {
    try {
      final form = formKey.currentState!;
      final isValid = form.saveAndValidate();
      if (!isValid) return;

      context.dismissKeyboard();

      final values = form.value;
      final cleanValue = values.trimStringValues();

      // Validate passwords match
      final password = cleanValue[_FormKeys.password] as String;
      final confirmPassword = cleanValue[_FormKeys.confirmPassword] as String;

      /// TODO: Move this to form validation
      if (password != confirmPassword) {
        UIFlash.error(context, 'Passwords do not match');
        return;
      }

      UserCubit.c(context).register(cleanValue);
    } catch (e) {
      UIFlash.error(
        context,
        'Something went wrong during registration!',
      );
    }
  }
}
