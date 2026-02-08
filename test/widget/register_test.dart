import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lensfolio_mobile_app/ui/screens/register/register.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';

import '../helpers/tester_extensions.dart';

void main() {
  group('RegisterScreen', () {
    testWidgets('renders the app logo', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const RegisterScreen(),
        );
        await t.pumpAndSettle();

        expect(find.byType(RegisterScreen), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      });
    });

    testWidgets('renders screen with title and subtitle', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const RegisterScreen(),
        );
        await t.pumpAndSettle();

        // Verify title (appears in header and button)
        expect(find.text('Create Account'), findsNWidgets(2));

        // Verify subtitle
        expect(
          find.text(
            'Join Lensfolio to build and showcase your professional portfolio.',
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets('displays all form fields', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const RegisterScreen(),
        );
        await t.pumpAndSettle();

        // Verify 4 form fields exist
        expect(find.byType(AppFormTextInput), findsNWidgets(4));

        // Verify form field headings (may appear multiple times due to labels)
        expect(find.text('Full Name'), findsWidgets);
        expect(find.text('Email'), findsWidgets);
        expect(find.text('Password'), findsWidgets);
        expect(find.text('Confirm Password'), findsWidgets);
      });
    });

    testWidgets('displays create account button', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const RegisterScreen(),
        );
        await t.pumpAndSettle();

        // Find the AppButton
        expect(find.byType(AppButton), findsOneWidget);
      });
    });

    testWidgets('displays login link', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const RegisterScreen(),
        );
        await t.pumpAndSettle();

        // Verify login link
        expect(find.text('Already have an account? '), findsOneWidget);
        expect(find.text('Login'), findsOneWidget);
      });
    });

    testWidgets('can enter form data', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const RegisterScreen(),
        );
        await t.pumpAndSettle();

        // Find text fields
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(4));

        // Enter full name
        await t.enterText(textFields.at(0), 'Jane Smith');
        await t.pumpAndSettle();

        // Enter email
        await t.enterText(textFields.at(1), 'jane@example.com');
        await t.pumpAndSettle();

        // Enter password
        await t.enterText(textFields.at(2), 'Password1!');
        await t.pumpAndSettle();

        // Enter confirm password
        await t.enterText(textFields.at(3), 'Password1!');
        await t.pumpAndSettle();

        // Verify entered text (may find multiple due to placeholder + input)
        expect(find.text('Jane Smith'), findsWidgets);
        expect(find.text('jane@example.com'), findsWidgets);
      });
    });
  });
}
