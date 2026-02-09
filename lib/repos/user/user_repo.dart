import 'dart:convert';
import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/services.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';
import 'package:lensfolio_mobile_app/models/user/generated_profile.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/models/user/user_education.dart';
import 'package:lensfolio_mobile_app/models/user/user_experience.dart';
import 'package:lensfolio_mobile_app/models/user/user_tech_stack.dart';
import 'package:lensfolio_mobile_app/services/agent_tool.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';
import 'package:lensfolio_mobile_app/services/firebase/remote/remote_configs.dart';
import 'package:lensfolio_mobile_app/services/supabase/supabase.dart';
import 'package:lensfolio_mobile_app/services/supabase/database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_mocks.dart';
part 'user_parser.dart';
part 'user_data_provider.dart';

class UserRepo {
  static final UserRepo _instance = UserRepo._();
  UserRepo._();

  static UserRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<GeneratedProfile> generateProfile(File file) =>
      _UserProvider.generateProfile(file);

  Future<UserData> update(Map<String, dynamic> values) {
    final payload = _UserParser.update(values);
    return _UserProvider.update(payload);
  }

  Future<UserData> fetch(String uuid) => _UserProvider.fetch(uuid);

  Future<void> register(Map<String, dynamic> values) =>
      _UserProvider.register(values);

  Future<AuthResponse> login(Map<String, dynamic> values) =>
      _UserProvider.login(values);
}
