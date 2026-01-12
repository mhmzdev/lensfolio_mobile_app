import 'package:dio/dio.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';
import 'package:supercharged/supercharged.dart';

part 'user_mocks.dart';
part 'user_parser.dart';
part 'user_data_provider.dart';

class UserRepo {
  static final UserRepo _instance = UserRepo._();
  UserRepo._();

  static UserRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<UserData> register() => _UserProvider.register();

  Future<UserData> login(Map<String, dynamic> values) => _UserProvider.login(values);
}
