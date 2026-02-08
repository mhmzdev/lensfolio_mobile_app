import 'package:lensfolio_mobile_app/ui/screens/generated_letter/generated_letter.dart';
import 'package:lensfolio_mobile_app/ui/screens/edit_profile/edit_profile.dart';
import 'package:lensfolio_mobile_app/ui/screens/letters/letters.dart';
import 'package:lensfolio_mobile_app/ui/screens/add_project/add_project.dart';
import 'package:lensfolio_mobile_app/ui/screens/projects/projects.dart';
import 'package:lensfolio_mobile_app/ui/screens/jobs/jobs.dart';
import 'package:lensfolio_mobile_app/ui/screens/home/home.dart';
import 'package:lensfolio_mobile_app/ui/screens/login/login.dart';
import 'package:lensfolio_mobile_app/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

final navigator = GlobalKey<NavigatorState>();

final appRoutes = <String, WidgetBuilder>{
  AppRoutes.addProject: (_) => const AddProjectScreen(),
  AppRoutes.generatedLetter: (_) => const GeneratedLetterScreen(),
  AppRoutes.editProfile: (_) => const EditProfileScreen(),
  AppRoutes.login: (_) => const LoginScreen(),
  AppRoutes.splash: (_) => const SplashScreen(),
};

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return FadeRoute(child: const HomeScreen(), settings: settings);
    case AppRoutes.jobs:
      return FadeRoute(child: const JobsScreen(), settings: settings);
    case AppRoutes.projects:
      return FadeRoute(child: const ProjectsScreen(), settings: settings);
    case AppRoutes.letters:
      return FadeRoute(child: const LettersScreen(), settings: settings);
    default:
      return null;
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          return FadeTransition(opacity: ani1, child: child);
        },
      );
}
