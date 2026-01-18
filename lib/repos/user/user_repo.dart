import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';
import 'package:lensfolio_mobile_app/services/supabase/supabase.dart';
import 'package:lensfolio_mobile_app/services/supabase/tables.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_mocks.dart';
part 'user_parser.dart';
part 'user_data_provider.dart';

class UserRepo {
  static final UserRepo _instance = UserRepo._();
  UserRepo._();

  static UserRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<UserData> udpate(Map<String, dynamic> values) =>
      _UserProvider.udpate(values);

  Future<UserData> fetch(String email) => _UserProvider.fetch(email);

  Future<AuthResponse> register(Map<String, dynamic> values) =>
      _UserProvider.register(values);

  Future<AuthResponse> login(Map<String, dynamic> values) =>
      _UserProvider.login(values);
}
