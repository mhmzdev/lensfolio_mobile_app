import 'package:form_builder_validators/form_builder_validators.dart';

class Validators {
  static String? Function(String?) email({bool required = true}) {
    return FormBuilderValidators.compose([
      if (required)
        FormBuilderValidators.required(errorText: 'Email cannot be empty.'),
      FormBuilderValidators.email(
        errorText: 'Invalid email address, please check again.',
      ),
    ]);
  }

  static String? Function(String?) name() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: 'Name cannot be empty.'),
      FormBuilderValidators.minLength(
        2,
        errorText: 'Name cannot be less than 2 characters',
      ),
      (String? value) {
        if (value != null && containsSymbol(value)) {
          return 'Name cannot have symbols in it.';
        }
        return null;
      },
    ]);
  }

  static String? Function(String?) password() {
    const validation =
        r'^(?=.*[A-Z])(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%.])[A-Za-z\d!@#$%.]{6,}$';

    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Password cannot be empty.';
      }

      final hasValid = RegExp(validation).hasMatch(value);
      if (!hasValid) {
        return 'Must contains 1 UPPER, 1 lower, 1 digit, 1 special character and 6 characters long.';
      }

      if (value.length < 6) {
        return 'Password must be at least 6 characters long.';
      }
      return null;
    };
  }

  static bool containsSymbol(String input) {
    final regExp = RegExp(r'[^\w\s]');
    return regExp.hasMatch(input);
  }

  static bool validPhone(String input) {
    // Remove any non-digit characters except +
    final cleanInput = input.replaceAll(RegExp(r'[^\d+]'), '');
    // Check if it starts with + and has 10-15 digits
    final phoneRegex = RegExp(r'^\+[1-9]\d{9,14}$');
    return phoneRegex.hasMatch(cleanInput);
  }

  static bool validEmail(String input) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(input);
  }

  static String? Function(String?) url() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      return FormBuilderValidators.url(
        errorText: 'Enter a valid URL.',
        requireProtocol: true,
      )(value);
    };
  }
}
