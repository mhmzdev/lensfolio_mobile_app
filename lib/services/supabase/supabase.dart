import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../flavor/flavor.dart';

class AppSupabase {
  static final AppSupabase _instance = AppSupabase._();
  AppSupabase._();

  static AppSupabase get ins => _instance;

  static late final SupabaseClient supabase;

  static Future<void> init() async {
    try {
      await Supabase.initialize(
        url: AppFlavor.supabaseCreds.url,
        anonKey: AppFlavor.supabaseCreds.anonKey,
      );
      supabase = Supabase.instance.client;
    } catch (e) {
      'Error initializing Supabase: $e'.appLog(
        level: AppLogLevel.error,
        tag: 'SUPABASE',
      );
    }
  }
}
