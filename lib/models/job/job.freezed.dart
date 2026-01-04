// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Job {

 int get id; String get url; String get title;@JsonKey(name: 'company_name') String get companyName;@JsonKey(name: 'company_logo') String get companyLogo; String get category; List<String>? get tags; String? get jobType;@JsonKey(name: 'publication_date') DateTime get publicationDate;@JsonKey(name: 'candidate_required_location') String? get candidateRequiredLocation; String? get salary; String? get description;
/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobCopyWith<Job> get copyWith => _$JobCopyWithImpl<Job>(this as Job, _$identity);

  /// Serializes this Job to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Job&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.publicationDate, publicationDate) || other.publicationDate == publicationDate)&&(identical(other.candidateRequiredLocation, candidateRequiredLocation) || other.candidateRequiredLocation == candidateRequiredLocation)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,title,companyName,companyLogo,category,const DeepCollectionEquality().hash(tags),jobType,publicationDate,candidateRequiredLocation,salary,description);

@override
String toString() {
  return 'Job(id: $id, url: $url, title: $title, companyName: $companyName, companyLogo: $companyLogo, category: $category, tags: $tags, jobType: $jobType, publicationDate: $publicationDate, candidateRequiredLocation: $candidateRequiredLocation, salary: $salary, description: $description)';
}


}

/// @nodoc
abstract mixin class $JobCopyWith<$Res>  {
  factory $JobCopyWith(Job value, $Res Function(Job) _then) = _$JobCopyWithImpl;
@useResult
$Res call({
 int id, String url, String title,@JsonKey(name: 'company_name') String companyName,@JsonKey(name: 'company_logo') String companyLogo, String category, List<String>? tags, String? jobType,@JsonKey(name: 'publication_date') DateTime publicationDate,@JsonKey(name: 'candidate_required_location') String? candidateRequiredLocation, String? salary, String? description
});




}
/// @nodoc
class _$JobCopyWithImpl<$Res>
    implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._self, this._then);

  final Job _self;
  final $Res Function(Job) _then;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? title = null,Object? companyName = null,Object? companyLogo = null,Object? category = null,Object? tags = freezed,Object? jobType = freezed,Object? publicationDate = null,Object? candidateRequiredLocation = freezed,Object? salary = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,companyLogo: null == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,publicationDate: null == publicationDate ? _self.publicationDate : publicationDate // ignore: cast_nullable_to_non_nullable
as DateTime,candidateRequiredLocation: freezed == candidateRequiredLocation ? _self.candidateRequiredLocation : candidateRequiredLocation // ignore: cast_nullable_to_non_nullable
as String?,salary: freezed == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Job].
extension JobPatterns on Job {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Job value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Job() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Job value)  $default,){
final _that = this;
switch (_that) {
case _Job():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Job value)?  $default,){
final _that = this;
switch (_that) {
case _Job() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String url,  String title, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'company_logo')  String companyLogo,  String category,  List<String>? tags,  String? jobType, @JsonKey(name: 'publication_date')  DateTime publicationDate, @JsonKey(name: 'candidate_required_location')  String? candidateRequiredLocation,  String? salary,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Job() when $default != null:
return $default(_that.id,_that.url,_that.title,_that.companyName,_that.companyLogo,_that.category,_that.tags,_that.jobType,_that.publicationDate,_that.candidateRequiredLocation,_that.salary,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String url,  String title, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'company_logo')  String companyLogo,  String category,  List<String>? tags,  String? jobType, @JsonKey(name: 'publication_date')  DateTime publicationDate, @JsonKey(name: 'candidate_required_location')  String? candidateRequiredLocation,  String? salary,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Job():
return $default(_that.id,_that.url,_that.title,_that.companyName,_that.companyLogo,_that.category,_that.tags,_that.jobType,_that.publicationDate,_that.candidateRequiredLocation,_that.salary,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String url,  String title, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'company_logo')  String companyLogo,  String category,  List<String>? tags,  String? jobType, @JsonKey(name: 'publication_date')  DateTime publicationDate, @JsonKey(name: 'candidate_required_location')  String? candidateRequiredLocation,  String? salary,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Job() when $default != null:
return $default(_that.id,_that.url,_that.title,_that.companyName,_that.companyLogo,_that.category,_that.tags,_that.jobType,_that.publicationDate,_that.candidateRequiredLocation,_that.salary,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Job implements Job {
  const _Job({required this.id, required this.url, required this.title, @JsonKey(name: 'company_name') required this.companyName, @JsonKey(name: 'company_logo') required this.companyLogo, required this.category, final  List<String>? tags, this.jobType, @JsonKey(name: 'publication_date') required this.publicationDate, @JsonKey(name: 'candidate_required_location') this.candidateRequiredLocation, this.salary, this.description}): _tags = tags;
  factory _Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

@override final  int id;
@override final  String url;
@override final  String title;
@override@JsonKey(name: 'company_name') final  String companyName;
@override@JsonKey(name: 'company_logo') final  String companyLogo;
@override final  String category;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? jobType;
@override@JsonKey(name: 'publication_date') final  DateTime publicationDate;
@override@JsonKey(name: 'candidate_required_location') final  String? candidateRequiredLocation;
@override final  String? salary;
@override final  String? description;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobCopyWith<_Job> get copyWith => __$JobCopyWithImpl<_Job>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Job&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.publicationDate, publicationDate) || other.publicationDate == publicationDate)&&(identical(other.candidateRequiredLocation, candidateRequiredLocation) || other.candidateRequiredLocation == candidateRequiredLocation)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,title,companyName,companyLogo,category,const DeepCollectionEquality().hash(_tags),jobType,publicationDate,candidateRequiredLocation,salary,description);

@override
String toString() {
  return 'Job(id: $id, url: $url, title: $title, companyName: $companyName, companyLogo: $companyLogo, category: $category, tags: $tags, jobType: $jobType, publicationDate: $publicationDate, candidateRequiredLocation: $candidateRequiredLocation, salary: $salary, description: $description)';
}


}

/// @nodoc
abstract mixin class _$JobCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$JobCopyWith(_Job value, $Res Function(_Job) _then) = __$JobCopyWithImpl;
@override @useResult
$Res call({
 int id, String url, String title,@JsonKey(name: 'company_name') String companyName,@JsonKey(name: 'company_logo') String companyLogo, String category, List<String>? tags, String? jobType,@JsonKey(name: 'publication_date') DateTime publicationDate,@JsonKey(name: 'candidate_required_location') String? candidateRequiredLocation, String? salary, String? description
});




}
/// @nodoc
class __$JobCopyWithImpl<$Res>
    implements _$JobCopyWith<$Res> {
  __$JobCopyWithImpl(this._self, this._then);

  final _Job _self;
  final $Res Function(_Job) _then;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? title = null,Object? companyName = null,Object? companyLogo = null,Object? category = null,Object? tags = freezed,Object? jobType = freezed,Object? publicationDate = null,Object? candidateRequiredLocation = freezed,Object? salary = freezed,Object? description = freezed,}) {
  return _then(_Job(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,companyLogo: null == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,publicationDate: null == publicationDate ? _self.publicationDate : publicationDate // ignore: cast_nullable_to_non_nullable
as DateTime,candidateRequiredLocation: freezed == candidateRequiredLocation ? _self.candidateRequiredLocation : candidateRequiredLocation // ignore: cast_nullable_to_non_nullable
as String?,salary: freezed == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
