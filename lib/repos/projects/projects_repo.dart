import 'package:dio/dio.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';

import 'package:lensfolio_mobile_app/models/project/project.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

part 'projects_mocks.dart';
part 'projects_parser.dart';
part 'projects_data_provider.dart';

class ProjectsRepo {
  static final ProjectsRepo _instance = ProjectsRepo._();
  ProjectsRepo._();

  static ProjectsRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<void> delete(int id) => _ProjectsProvider.delete(id);

  Future<Project> update(int id, Map<String, dynamic> values) =>
      _ProjectsProvider.update(id, values);

  Future<List<Project>> fetchAll(int uid) => _ProjectsProvider.fetchAll(uid);

  Future<Project> fetchById(int id) => _ProjectsProvider.fetchById(id);

  Future<Project> create(int uid, Map<String, dynamic> data) =>
      _ProjectsProvider.create(uid, data);
}
