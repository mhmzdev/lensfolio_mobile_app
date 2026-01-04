import 'package:dio/dio.dart';
import 'package:lensfolio_mobile_app/models/job/job.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

part 'jobs_mocks.dart';
part 'jobs_parser.dart';
part 'jobs_data_provider.dart';

class JobsRepo {
  static final JobsRepo _instance = JobsRepo._();
  JobsRepo._();

  static JobsRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<Job> fetch() => _JobsProvider.fetch();
}
