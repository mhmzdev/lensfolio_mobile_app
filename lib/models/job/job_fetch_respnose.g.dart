// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_fetch_respnose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobFetchRespnose _$JobFetchRespnoseFromJson(Map<String, dynamic> json) =>
    _JobFetchRespnose(
      jobCount: (json['job-count'] as num).toInt(),
      totalJobCount: (json['total-job-count'] as num).toInt(),
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobFetchRespnoseToJson(_JobFetchRespnose instance) =>
    <String, dynamic>{
      'job-count': instance.jobCount,
      'total-job-count': instance.totalJobCount,
      'jobs': instance.jobs.map((e) => e.toJson()).toList(),
    };
