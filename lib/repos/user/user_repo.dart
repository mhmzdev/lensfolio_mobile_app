import 'package:dio/dio.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

part 'user_mocks.dart';
part 'user_parser.dart';
part 'user_data_provider.dart';

class UserRepo {
  static final UserRepo _instance = UserRepo._();
  UserRepo._();

  static UserRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<UserData> register() => _UserProvider.register();

  Future<UserData> logout() => _UserProvider.logout();

  Future<UserData> fetch() => _UserProvider.fetch();

  Future<UserData> login() => _UserProvider.login();
}
