import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/router/router.dart';
import 'package:lensfolio_mobile_app/providers/app.dart';

// Cubits
import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/jobs/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/projects/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/file/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/cover_letter/cubit.dart';

import '../fakes/fakes.dart';
import '../mocks/app_provider.dart';

/// iPhone 16 pro
const defaultPhoneSize = Size(1206, 2622);

/// iPhone 16 pro
const double defaultDevicePixelRatio = 3;

typedef WidgetTestBody = Future<void> Function(WidgetTester tester);

/// Initializes essential configs required for widget tests.
/// This includes typography which is needed for the theme.
void initTestConfigs() {
  AppText.init();
}

extension WidgetTestExtensions on WidgetTester {
  /// Creates the main multi provider so that any part of it can be substituted
  Future<MultiProvider> createRootWidgetAndPump({
    // Cubits
    UserCubit? userCubit,
    JobsCubit? jobsCubit,
    ProjectsCubit? projectsCubit,
    FileCubit? fileCubit,
    CoverLetterCubit? coverLetterCubit,

    // Provider
    AppProvider? appProvider,

    //
    Widget? body,

    /// For some reason `appRoutes` the global is not working
    /// so we are passing it as a parameter here.
    Map<String, Widget Function(dynamic)>? router,
    Route<dynamic>? Function(RouteSettings settings)? onGenRoutes,
    String? initialRoute,
  }) async {
    if (body != null && initialRoute != null) {
      throw ArgumentError('Cannot have both body and initialRoute');
    }

    // Note: these cubits have some default data. You can change them as needed, but make
    // sure this doesn't interfere with other tests that might be using the data
    final root = MultiProvider(
      providers: [
        /// Blocs
        BlocProvider(create: (_) => userCubit ?? UserCubit()),
        BlocProvider(create: (_) => jobsCubit ?? JobsCubit()),
        BlocProvider(create: (_) => projectsCubit ?? ProjectsCubit()),
        BlocProvider(create: (_) => fileCubit ?? FileCubit()),
        BlocProvider(create: (_) => coverLetterCubit ?? CoverLetterCubit()),

        /// Providers
        Provider<Connectivity>(create: (_) => FakeConnectivity()),
        ChangeNotifierProvider<AppProvider>(
          create: (_) => appProvider ?? TestAppProvider(),
        ),
      ],
      child: Consumer<AppProvider>(
        builder: (context, state, child) {
          return MaterialApp(
            themeMode: state.themeMode,
            theme: materialLightTheme,
            darkTheme: materialDarkTheme,
            initialRoute: initialRoute,
            home: initialRoute != null ? null : body,

            // can be replaced for testing
            routes: router ?? appRoutes,
            onGenerateRoute: onGenRoutes ?? onGenerateRoutes,
          );
        },
      ),
    );
    await pumpWidget(root);
    return root;
  }

  /// Initalizes the tester for widget testing
  void initialise({
    Size physicalSize = defaultPhoneSize,
    double devicePixelRatio = defaultDevicePixelRatio,
  }) {
    WidgetController.hitTestWarningShouldBeFatal = true;

    view.physicalSize = physicalSize;
    view.devicePixelRatio = devicePixelRatio;

    // Initialize essential configs (typography, etc.)
    initTestConfigs();
  }

  /// Initialize the test environment, and run the test with mocks
  Future<void> runWidgetTestZoned(
    WidgetTestBody body, {
    Size physicalSize = defaultPhoneSize,

    /// Fix this, pixel ratio is working different for different screen. Should be same i.e. 3
    double devicePixelRatio = defaultDevicePixelRatio,

    /// Whether to ignore overflow errors during the test
    bool ignoreOverflow = true,
  }) {
    return runZoned(
      () async {
        initialise(
          physicalSize: physicalSize,
          devicePixelRatio: devicePixelRatio,
        );

        // Store original error handler
        final originalOnError = FlutterError.onError;

        // Optionally suppress overflow errors for visual-only issues
        if (ignoreOverflow) {
          FlutterError.onError = (details) {
            final isOverflow = details.exceptionAsString().contains('overflowed');
            if (!isOverflow) {
              originalOnError?.call(details);
            }
          };
        }

        try {
          await body(this);
        } finally {
          // Restore original error handler
          FlutterError.onError = originalOnError;
        }
      },
      zoneValues: {
        #Connectivity: FakeConnectivity(),
      },
    );
  }
}
