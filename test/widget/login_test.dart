import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lensfolio_mobile_app/ui/screens/login/login.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';

import '../helpers/tester_extensions.dart';

void main() {
  group('LoginScreen', () {
    testWidgets('renders login screen with all elements', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const LoginScreen(),
        );
        await t.pumpAndSettle();

        // Verify the screen renders
        expect(find.byType(LoginScreen), findsOneWidget);

        // Verify title (there are 2 "Login" texts - title and button)
        expect(find.text('Login'), findsNWidgets(2));

        // Verify subtitle
        expect(
          find.text(
            'Welcome back to Lensfolio. Please enter your email and password to continue.',
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets('displays email and password form fields', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const LoginScreen(),
        );
        await t.pumpAndSettle();

        // Verify form field headings
        expect(find.text('Email'), findsOneWidget);
        expect(find.text('Password'), findsOneWidget);

        // Verify placeholders are present in form fields
        expect(find.text('john.doe@example.com'), findsOneWidget);
        expect(find.text('Enter your password'), findsOneWidget);
      });
    });

    testWidgets('displays login button', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const LoginScreen(),
        );
        await t.pumpAndSettle();

        // Find the AppButton with Login label
        expect(find.byType(AppButton), findsOneWidget);
      });
    });

    testWidgets('displays forgot password link', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const LoginScreen(),
        );
        await t.pumpAndSettle();

        // Verify forgot password link
        expect(find.text('Forgot Password?'), findsOneWidget);
      });
    });

    testWidgets('can enter email and password', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        await t.createRootWidgetAndPump(
          body: const LoginScreen(),
        );
        await t.pumpAndSettle();

        // Find text fields and enter text
        final emailField = find.byType(TextField).first;
        final passwordField = find.byType(TextField).last;

        await t.enterText(emailField, 'test@example.com');
        await t.pumpAndSettle();

        await t.enterText(passwordField, 'password123');
        await t.pumpAndSettle();

        // Verify the text was entered
        expect(find.text('test@example.com'), findsOneWidget);
        expect(find.text('password123'), findsOneWidget);
      });
    });
  });
}
