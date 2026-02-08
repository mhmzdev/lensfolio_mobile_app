import 'dart:io';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/project/project.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';
import 'package:lensfolio_mobile_app/services/supabase/database.dart';
import 'package:lensfolio_mobile_app/services/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'projects_mocks.dart';
part 'projects_parser.dart';
part 'projects_data_provider.dart';

class ProjectsRepo {
  static final ProjectsRepo _instance = ProjectsRepo._();
  ProjectsRepo._();

  static ProjectsRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<void> delete(int id, {String? imageUrl}) =>
      _ProjectsProvider.delete(id, imageUrl: imageUrl);

  Future<Project> update(
    int id,
    Map<String, dynamic> values, {
    File? coverImage,
    bool removeExistingImage = false,
  }) =>
      _ProjectsProvider.update(
        id,
        values,
        coverImage: coverImage,
        removeExistingImage: removeExistingImage,
      );

  Future<List<Project>> fetchAll(int uid) => _ProjectsProvider.fetchAll(uid);

  Future<Project> fetchById(int id) => _ProjectsProvider.fetchById(id);

  Future<Project> create(
    int uid,
    Map<String, dynamic> data, {
    File? coverImage,
  }) => _ProjectsProvider.create(uid, data, coverImage: coverImage);
}
