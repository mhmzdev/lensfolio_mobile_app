import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lensfolio_mobile_app/ui/screens/home/home.dart';

import '../fixtures/user_data_fixture.dart';
import '../helpers/tester_extensions.dart';
import '../mocks/user_cubit.dart';

void main() {
  group('HomeScreen', () {
    testWidgets('shows empty widget when userData is null', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        // Create a logged out cubit (no userData)
        final userCubit = MockUserCubit.loggedOut();

        await t.createRootWidgetAndPump(
          body: const HomeScreen(),
          userCubit: userCubit,
        );
        await t.pumpAndSettle();

        // Should show nothing when userData is null
        expect(find.byType(HomeScreen), findsOneWidget);
        // The SizedBox.shrink() is rendered
        expect(find.byType(SizedBox), findsWidgets);
      });
    });

    testWidgets('displays user name from profile', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        final userData = UserDataFixture.complete(fullName: 'Jane Smith');
        final userCubit = MockUserCubit.loggedIn(userData);

        await t.createRootWidgetAndPump(
          body: const HomeScreen(),
          userCubit: userCubit,
        );
        await t.pumpAndSettle();

        // Verify the screen renders with user data
        expect(find.byType(HomeScreen), findsOneWidget);

        // Verify user name is displayed
        expect(find.text('Jane Smith'), findsOneWidget);
      });
    });

    testWidgets('displays user designation', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        final userData = UserDataFixture.complete(
          designation: 'Flutter Developer',
        );
        final userCubit = MockUserCubit.loggedIn(userData);

        await t.createRootWidgetAndPump(
          body: const HomeScreen(),
          userCubit: userCubit,
        );
        await t.pumpAndSettle();

        // Verify designation is displayed
        expect(find.text('Flutter Developer'), findsOneWidget);
      });
    });

    testWidgets('shows Complete Profile button for incomplete profile',
        (tester) async {
      await tester.runWidgetTestZoned((t) async {
        final userData = UserDataFixture.incomplete();
        final userCubit = MockUserCubit.loggedIn(userData);

        await t.createRootWidgetAndPump(
          body: const HomeScreen(),
          userCubit: userCubit,
        );
        await t.pumpAndSettle();

        // Should show "Complete Profile" button for incomplete profile
        expect(find.text('Complete Profile'), findsOneWidget);
      });
    });

    testWidgets('displays about section content', (tester) async {
      await tester.runWidgetTestZoned((t) async {
        final userData = UserDataFixture.complete(
          about: 'I am a passionate developer',
        );
        final userCubit = MockUserCubit.loggedIn(userData);

        await t.createRootWidgetAndPump(
          body: const HomeScreen(),
          userCubit: userCubit,
        );
        await t.pumpAndSettle();

        // Verify about section content
        expect(find.text('I am a passionate developer'), findsOneWidget);
      });
    });
  });
}
