import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';
import 'package:lensfolio_mobile_app/services/supabase/database.dart';
import 'package:lensfolio_mobile_app/services/supabase/supabase.dart';

part 'file_mocks.dart';
part 'file_parser.dart';
part 'file_data_provider.dart';

class FileRepo {
  static final FileRepo _instance = FileRepo._();
  FileRepo._();

  static FileRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<String> uploadResume(File file, String uuid) =>
      _FileProvider.uploadResume(file, uuid);

  Future<File> downloadResume(String filePath) =>
      _FileProvider.downloadResume(filePath);

  Future<String> uploadProfilePicture(File file, String uuid) =>
      _FileProvider.uploadProfilePicture(file, uuid);

  Future<void> deleteFile(String filePath, {required String bucket}) =>
      _FileProvider.deleteFile(filePath, bucket: bucket);
}
