import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';

// ignore: unused_import
// import 'global/bloc_sync/bloc_sync.dart';
import 'package:provider/provider.dart';

import 'router/router.dart';
import 'router/routes.dart';

// bloc-imports-start
import 'blocs/jobs/cubit.dart';
import 'blocs/user/cubit.dart';

// bloc-imports-end

// provider-imports-start
import 'providers/app.dart';
import 'services/route_logger/route_logger.dart';

class Lensfolio extends StatefulWidget {
  const Lensfolio({super.key});

  @override
  State<Lensfolio> createState() => _LensfolioState();
}

/// State for widget Lensfolio.
class _LensfolioState extends State<Lensfolio> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return MultiProvider(
      providers: [
        // bloc-initiate-start
        BlocProvider(create: (_) => JobsCubit()),
        BlocProvider(create: (_) => UserCubit()),

        // bloc-initiate-end

        // provider-initiate-start
        Provider(create: (_) => Connectivity()),
        ChangeNotifierProvider(create: (_) => AppProvider()),

        // provider-initiate-end
      ],
      child: Consumer<AppProvider>(
        builder: (context, state, child) {
          return MaterialApp(
            locale: const Locale('en', 'GB'),
            supportedLocales: const [
              Locale('en', 'GB'),
              Locale('en', 'CA'),
              Locale('en', 'US'),
              Locale('en', 'AU'),
            ],
            title: 'Lensfolio',
            navigatorKey: navigator,
            themeMode: state.themeMode,
            theme: materialLightTheme,
            darkTheme: materialDarkTheme,
            debugShowCheckedModeBanner: false,
            routes: appRoutes,
            navigatorObservers: [RouteLogger()],
            onGenerateRoute: onGenerateRoutes,
            initialRoute: AppRoutes.login,
            // builder: (context, child) => BlocSync(child: child!),
          );
        },
      ),
    );
  }
}
