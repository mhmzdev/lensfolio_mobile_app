import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/services/cache/app_cache.dart';
import 'package:lensfolio_mobile_app/services/flavor/flavor.dart';
import 'package:lensfolio_mobile_app/services/supabase/supabase.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppFlavor.init();
  await AppSupabase.init();

  await AppCache.ins.init();

  runApp(const Lensfolio());
}
