import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/services/http/alice.dart';

import 'app.dart';

import 'services/cache/app_cache.dart';
import 'services/firebase/crash/crashlytics.dart';
import 'services/firebase/performance/performance.dart';
import 'services/firebase/remote/remote_configs.dart';
import 'services/flavor/flavor.dart';
import 'services/supabase/supabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await AppFlavor.init();

  // Database
  await AppSupabase.init();

  /// Services
  AppAlice.ins.init();
  await EnhancedCrashlytics.ins.init();
  await AppPerformance.ins.init();
  await FireRemoteConfig.ins.init();

  /// Caching
  await AppCache.ins.init();

  runApp(const Lensfolio());
}
