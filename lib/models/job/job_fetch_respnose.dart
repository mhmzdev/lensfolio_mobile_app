import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lensfolio_mobile_app/models/job/job.dart';

part 'job_fetch_respnose.freezed.dart';
part 'job_fetch_respnose.g.dart';

@freezed
sealed class JobFetchRespnose with _$JobFetchRespnose {
  const factory JobFetchRespnose({
    @JsonKey(name: 'job-count') required int jobCount,
    @JsonKey(name: 'total-job-count') required int totalJobCount,
    required List<Job> jobs,
  }) = _JobFetchRespnose;

  factory JobFetchRespnose.fromJson(Map<String, Object?> json) =>
      _$JobFetchRespnoseFromJson(json);
}
