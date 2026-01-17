// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_fetch_respnose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobFetchRespnose {

@JsonKey(name: 'job-count') int get jobCount;@JsonKey(name: 'total-job-count') int get totalJobCount; List<Job> get jobs;
/// Create a copy of JobFetchRespnose
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobFetchRespnoseCopyWith<JobFetchRespnose> get copyWith => _$JobFetchRespnoseCopyWithImpl<JobFetchRespnose>(this as JobFetchRespnose, _$identity);

  /// Serializes this JobFetchRespnose to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobFetchRespnose&&(identical(other.jobCount, jobCount) || other.jobCount == jobCount)&&(identical(other.totalJobCount, totalJobCount) || other.totalJobCount == totalJobCount)&&const DeepCollectionEquality().equals(other.jobs, jobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobCount,totalJobCount,const DeepCollectionEquality().hash(jobs));

@override
String toString() {
  return 'JobFetchRespnose(jobCount: $jobCount, totalJobCount: $totalJobCount, jobs: $jobs)';
}


}

/// @nodoc
abstract mixin class $JobFetchRespnoseCopyWith<$Res>  {
  factory $JobFetchRespnoseCopyWith(JobFetchRespnose value, $Res Function(JobFetchRespnose) _then) = _$JobFetchRespnoseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'job-count') int jobCount,@JsonKey(name: 'total-job-count') int totalJobCount, List<Job> jobs
});




}
/// @nodoc
class _$JobFetchRespnoseCopyWithImpl<$Res>
    implements $JobFetchRespnoseCopyWith<$Res> {
  _$JobFetchRespnoseCopyWithImpl(this._self, this._then);

  final JobFetchRespnose _self;
  final $Res Function(JobFetchRespnose) _then;

/// Create a copy of JobFetchRespnose
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobCount = null,Object? totalJobCount = null,Object? jobs = null,}) {
  return _then(_self.copyWith(
jobCount: null == jobCount ? _self.jobCount : jobCount // ignore: cast_nullable_to_non_nullable
as int,totalJobCount: null == totalJobCount ? _self.totalJobCount : totalJobCount // ignore: cast_nullable_to_non_nullable
as int,jobs: null == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<Job>,
  ));
}

}


/// Adds pattern-matching-related methods to [JobFetchRespnose].
extension JobFetchRespnosePatterns on JobFetchRespnose {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobFetchRespnose value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobFetchRespnose() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobFetchRespnose value)  $default,){
final _that = this;
switch (_that) {
case _JobFetchRespnose():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobFetchRespnose value)?  $default,){
final _that = this;
switch (_that) {
case _JobFetchRespnose() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'job-count')  int jobCount, @JsonKey(name: 'total-job-count')  int totalJobCount,  List<Job> jobs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobFetchRespnose() when $default != null:
return $default(_that.jobCount,_that.totalJobCount,_that.jobs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'job-count')  int jobCount, @JsonKey(name: 'total-job-count')  int totalJobCount,  List<Job> jobs)  $default,) {final _that = this;
switch (_that) {
case _JobFetchRespnose():
return $default(_that.jobCount,_that.totalJobCount,_that.jobs);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'job-count')  int jobCount, @JsonKey(name: 'total-job-count')  int totalJobCount,  List<Job> jobs)?  $default,) {final _that = this;
switch (_that) {
case _JobFetchRespnose() when $default != null:
return $default(_that.jobCount,_that.totalJobCount,_that.jobs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobFetchRespnose implements JobFetchRespnose {
  const _JobFetchRespnose({@JsonKey(name: 'job-count') required this.jobCount, @JsonKey(name: 'total-job-count') required this.totalJobCount, required final  List<Job> jobs}): _jobs = jobs;
  factory _JobFetchRespnose.fromJson(Map<String, dynamic> json) => _$JobFetchRespnoseFromJson(json);

@override@JsonKey(name: 'job-count') final  int jobCount;
@override@JsonKey(name: 'total-job-count') final  int totalJobCount;
 final  List<Job> _jobs;
@override List<Job> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}


/// Create a copy of JobFetchRespnose
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobFetchRespnoseCopyWith<_JobFetchRespnose> get copyWith => __$JobFetchRespnoseCopyWithImpl<_JobFetchRespnose>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobFetchRespnoseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobFetchRespnose&&(identical(other.jobCount, jobCount) || other.jobCount == jobCount)&&(identical(other.totalJobCount, totalJobCount) || other.totalJobCount == totalJobCount)&&const DeepCollectionEquality().equals(other._jobs, _jobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobCount,totalJobCount,const DeepCollectionEquality().hash(_jobs));

@override
String toString() {
  return 'JobFetchRespnose(jobCount: $jobCount, totalJobCount: $totalJobCount, jobs: $jobs)';
}


}

/// @nodoc
abstract mixin class _$JobFetchRespnoseCopyWith<$Res> implements $JobFetchRespnoseCopyWith<$Res> {
  factory _$JobFetchRespnoseCopyWith(_JobFetchRespnose value, $Res Function(_JobFetchRespnose) _then) = __$JobFetchRespnoseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'job-count') int jobCount,@JsonKey(name: 'total-job-count') int totalJobCount, List<Job> jobs
});




}
/// @nodoc
class __$JobFetchRespnoseCopyWithImpl<$Res>
    implements _$JobFetchRespnoseCopyWith<$Res> {
  __$JobFetchRespnoseCopyWithImpl(this._self, this._then);

  final _JobFetchRespnose _self;
  final $Res Function(_JobFetchRespnose) _then;

/// Create a copy of JobFetchRespnose
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobCount = null,Object? totalJobCount = null,Object? jobs = null,}) {
  return _then(_JobFetchRespnose(
jobCount: null == jobCount ? _self.jobCount : jobCount // ignore: cast_nullable_to_non_nullable
as int,totalJobCount: null == totalJobCount ? _self.totalJobCount : totalJobCount // ignore: cast_nullable_to_non_nullable
as int,jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<Job>,
  ));
}


}

// dart format on
