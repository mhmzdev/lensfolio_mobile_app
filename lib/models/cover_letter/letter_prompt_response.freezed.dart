// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_prompt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LetterPromptResponse {

@JsonKey(name: 'letter_body') String? get letterBody;/// required values
@JsonKey(name: 'company_name') String? get companyName; String? get position;@JsonKey(name: 'job_description') String? get jobDescription;/// optional values
@JsonKey(name: 'candidate_name') String? get candidateName;@JsonKey(name: 'candidate_location') String? get candidateLocation;@JsonKey(name: 'target_seniority') List<String>? get targetSeniority; List<String>? get skills; List<String>? get tools;@JsonKey(name: 'portfolio_url') String? get portfolioUrl; String? get tone; String? get length;/// error
 String? get error;
/// Create a copy of LetterPromptResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterPromptResponseCopyWith<LetterPromptResponse> get copyWith => _$LetterPromptResponseCopyWithImpl<LetterPromptResponse>(this as LetterPromptResponse, _$identity);

  /// Serializes this LetterPromptResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LetterPromptResponse&&(identical(other.letterBody, letterBody) || other.letterBody == letterBody)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.position, position) || other.position == position)&&(identical(other.jobDescription, jobDescription) || other.jobDescription == jobDescription)&&(identical(other.candidateName, candidateName) || other.candidateName == candidateName)&&(identical(other.candidateLocation, candidateLocation) || other.candidateLocation == candidateLocation)&&const DeepCollectionEquality().equals(other.targetSeniority, targetSeniority)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.tools, tools)&&(identical(other.portfolioUrl, portfolioUrl) || other.portfolioUrl == portfolioUrl)&&(identical(other.tone, tone) || other.tone == tone)&&(identical(other.length, length) || other.length == length)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,letterBody,companyName,position,jobDescription,candidateName,candidateLocation,const DeepCollectionEquality().hash(targetSeniority),const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(tools),portfolioUrl,tone,length,error);

@override
String toString() {
  return 'LetterPromptResponse(letterBody: $letterBody, companyName: $companyName, position: $position, jobDescription: $jobDescription, candidateName: $candidateName, candidateLocation: $candidateLocation, targetSeniority: $targetSeniority, skills: $skills, tools: $tools, portfolioUrl: $portfolioUrl, tone: $tone, length: $length, error: $error)';
}


}

/// @nodoc
abstract mixin class $LetterPromptResponseCopyWith<$Res>  {
  factory $LetterPromptResponseCopyWith(LetterPromptResponse value, $Res Function(LetterPromptResponse) _then) = _$LetterPromptResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'letter_body') String? letterBody,@JsonKey(name: 'company_name') String? companyName, String? position,@JsonKey(name: 'job_description') String? jobDescription,@JsonKey(name: 'candidate_name') String? candidateName,@JsonKey(name: 'candidate_location') String? candidateLocation,@JsonKey(name: 'target_seniority') List<String>? targetSeniority, List<String>? skills, List<String>? tools,@JsonKey(name: 'portfolio_url') String? portfolioUrl, String? tone, String? length, String? error
});




}
/// @nodoc
class _$LetterPromptResponseCopyWithImpl<$Res>
    implements $LetterPromptResponseCopyWith<$Res> {
  _$LetterPromptResponseCopyWithImpl(this._self, this._then);

  final LetterPromptResponse _self;
  final $Res Function(LetterPromptResponse) _then;

/// Create a copy of LetterPromptResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? letterBody = freezed,Object? companyName = freezed,Object? position = freezed,Object? jobDescription = freezed,Object? candidateName = freezed,Object? candidateLocation = freezed,Object? targetSeniority = freezed,Object? skills = freezed,Object? tools = freezed,Object? portfolioUrl = freezed,Object? tone = freezed,Object? length = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
letterBody: freezed == letterBody ? _self.letterBody : letterBody // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,jobDescription: freezed == jobDescription ? _self.jobDescription : jobDescription // ignore: cast_nullable_to_non_nullable
as String?,candidateName: freezed == candidateName ? _self.candidateName : candidateName // ignore: cast_nullable_to_non_nullable
as String?,candidateLocation: freezed == candidateLocation ? _self.candidateLocation : candidateLocation // ignore: cast_nullable_to_non_nullable
as String?,targetSeniority: freezed == targetSeniority ? _self.targetSeniority : targetSeniority // ignore: cast_nullable_to_non_nullable
as List<String>?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,tools: freezed == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<String>?,portfolioUrl: freezed == portfolioUrl ? _self.portfolioUrl : portfolioUrl // ignore: cast_nullable_to_non_nullable
as String?,tone: freezed == tone ? _self.tone : tone // ignore: cast_nullable_to_non_nullable
as String?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LetterPromptResponse].
extension LetterPromptResponsePatterns on LetterPromptResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LetterPromptResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LetterPromptResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LetterPromptResponse value)  $default,){
final _that = this;
switch (_that) {
case _LetterPromptResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LetterPromptResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LetterPromptResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'letter_body')  String? letterBody, @JsonKey(name: 'company_name')  String? companyName,  String? position, @JsonKey(name: 'job_description')  String? jobDescription, @JsonKey(name: 'candidate_name')  String? candidateName, @JsonKey(name: 'candidate_location')  String? candidateLocation, @JsonKey(name: 'target_seniority')  List<String>? targetSeniority,  List<String>? skills,  List<String>? tools, @JsonKey(name: 'portfolio_url')  String? portfolioUrl,  String? tone,  String? length,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LetterPromptResponse() when $default != null:
return $default(_that.letterBody,_that.companyName,_that.position,_that.jobDescription,_that.candidateName,_that.candidateLocation,_that.targetSeniority,_that.skills,_that.tools,_that.portfolioUrl,_that.tone,_that.length,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'letter_body')  String? letterBody, @JsonKey(name: 'company_name')  String? companyName,  String? position, @JsonKey(name: 'job_description')  String? jobDescription, @JsonKey(name: 'candidate_name')  String? candidateName, @JsonKey(name: 'candidate_location')  String? candidateLocation, @JsonKey(name: 'target_seniority')  List<String>? targetSeniority,  List<String>? skills,  List<String>? tools, @JsonKey(name: 'portfolio_url')  String? portfolioUrl,  String? tone,  String? length,  String? error)  $default,) {final _that = this;
switch (_that) {
case _LetterPromptResponse():
return $default(_that.letterBody,_that.companyName,_that.position,_that.jobDescription,_that.candidateName,_that.candidateLocation,_that.targetSeniority,_that.skills,_that.tools,_that.portfolioUrl,_that.tone,_that.length,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'letter_body')  String? letterBody, @JsonKey(name: 'company_name')  String? companyName,  String? position, @JsonKey(name: 'job_description')  String? jobDescription, @JsonKey(name: 'candidate_name')  String? candidateName, @JsonKey(name: 'candidate_location')  String? candidateLocation, @JsonKey(name: 'target_seniority')  List<String>? targetSeniority,  List<String>? skills,  List<String>? tools, @JsonKey(name: 'portfolio_url')  String? portfolioUrl,  String? tone,  String? length,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _LetterPromptResponse() when $default != null:
return $default(_that.letterBody,_that.companyName,_that.position,_that.jobDescription,_that.candidateName,_that.candidateLocation,_that.targetSeniority,_that.skills,_that.tools,_that.portfolioUrl,_that.tone,_that.length,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LetterPromptResponse implements LetterPromptResponse {
  const _LetterPromptResponse({@JsonKey(name: 'letter_body') this.letterBody, @JsonKey(name: 'company_name') this.companyName, this.position, @JsonKey(name: 'job_description') this.jobDescription, @JsonKey(name: 'candidate_name') this.candidateName, @JsonKey(name: 'candidate_location') this.candidateLocation, @JsonKey(name: 'target_seniority') final  List<String>? targetSeniority, final  List<String>? skills, final  List<String>? tools, @JsonKey(name: 'portfolio_url') this.portfolioUrl, this.tone, this.length, this.error}): _targetSeniority = targetSeniority,_skills = skills,_tools = tools;
  factory _LetterPromptResponse.fromJson(Map<String, dynamic> json) => _$LetterPromptResponseFromJson(json);

@override@JsonKey(name: 'letter_body') final  String? letterBody;
/// required values
@override@JsonKey(name: 'company_name') final  String? companyName;
@override final  String? position;
@override@JsonKey(name: 'job_description') final  String? jobDescription;
/// optional values
@override@JsonKey(name: 'candidate_name') final  String? candidateName;
@override@JsonKey(name: 'candidate_location') final  String? candidateLocation;
 final  List<String>? _targetSeniority;
@override@JsonKey(name: 'target_seniority') List<String>? get targetSeniority {
  final value = _targetSeniority;
  if (value == null) return null;
  if (_targetSeniority is EqualUnmodifiableListView) return _targetSeniority;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _tools;
@override List<String>? get tools {
  final value = _tools;
  if (value == null) return null;
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'portfolio_url') final  String? portfolioUrl;
@override final  String? tone;
@override final  String? length;
/// error
@override final  String? error;

/// Create a copy of LetterPromptResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LetterPromptResponseCopyWith<_LetterPromptResponse> get copyWith => __$LetterPromptResponseCopyWithImpl<_LetterPromptResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LetterPromptResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LetterPromptResponse&&(identical(other.letterBody, letterBody) || other.letterBody == letterBody)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.position, position) || other.position == position)&&(identical(other.jobDescription, jobDescription) || other.jobDescription == jobDescription)&&(identical(other.candidateName, candidateName) || other.candidateName == candidateName)&&(identical(other.candidateLocation, candidateLocation) || other.candidateLocation == candidateLocation)&&const DeepCollectionEquality().equals(other._targetSeniority, _targetSeniority)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._tools, _tools)&&(identical(other.portfolioUrl, portfolioUrl) || other.portfolioUrl == portfolioUrl)&&(identical(other.tone, tone) || other.tone == tone)&&(identical(other.length, length) || other.length == length)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,letterBody,companyName,position,jobDescription,candidateName,candidateLocation,const DeepCollectionEquality().hash(_targetSeniority),const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_tools),portfolioUrl,tone,length,error);

@override
String toString() {
  return 'LetterPromptResponse(letterBody: $letterBody, companyName: $companyName, position: $position, jobDescription: $jobDescription, candidateName: $candidateName, candidateLocation: $candidateLocation, targetSeniority: $targetSeniority, skills: $skills, tools: $tools, portfolioUrl: $portfolioUrl, tone: $tone, length: $length, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LetterPromptResponseCopyWith<$Res> implements $LetterPromptResponseCopyWith<$Res> {
  factory _$LetterPromptResponseCopyWith(_LetterPromptResponse value, $Res Function(_LetterPromptResponse) _then) = __$LetterPromptResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'letter_body') String? letterBody,@JsonKey(name: 'company_name') String? companyName, String? position,@JsonKey(name: 'job_description') String? jobDescription,@JsonKey(name: 'candidate_name') String? candidateName,@JsonKey(name: 'candidate_location') String? candidateLocation,@JsonKey(name: 'target_seniority') List<String>? targetSeniority, List<String>? skills, List<String>? tools,@JsonKey(name: 'portfolio_url') String? portfolioUrl, String? tone, String? length, String? error
});




}
/// @nodoc
class __$LetterPromptResponseCopyWithImpl<$Res>
    implements _$LetterPromptResponseCopyWith<$Res> {
  __$LetterPromptResponseCopyWithImpl(this._self, this._then);

  final _LetterPromptResponse _self;
  final $Res Function(_LetterPromptResponse) _then;

/// Create a copy of LetterPromptResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? letterBody = freezed,Object? companyName = freezed,Object? position = freezed,Object? jobDescription = freezed,Object? candidateName = freezed,Object? candidateLocation = freezed,Object? targetSeniority = freezed,Object? skills = freezed,Object? tools = freezed,Object? portfolioUrl = freezed,Object? tone = freezed,Object? length = freezed,Object? error = freezed,}) {
  return _then(_LetterPromptResponse(
letterBody: freezed == letterBody ? _self.letterBody : letterBody // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,jobDescription: freezed == jobDescription ? _self.jobDescription : jobDescription // ignore: cast_nullable_to_non_nullable
as String?,candidateName: freezed == candidateName ? _self.candidateName : candidateName // ignore: cast_nullable_to_non_nullable
as String?,candidateLocation: freezed == candidateLocation ? _self.candidateLocation : candidateLocation // ignore: cast_nullable_to_non_nullable
as String?,targetSeniority: freezed == targetSeniority ? _self._targetSeniority : targetSeniority // ignore: cast_nullable_to_non_nullable
as List<String>?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,tools: freezed == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<String>?,portfolioUrl: freezed == portfolioUrl ? _self.portfolioUrl : portfolioUrl // ignore: cast_nullable_to_non_nullable
as String?,tone: freezed == tone ? _self.tone : tone // ignore: cast_nullable_to_non_nullable
as String?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
