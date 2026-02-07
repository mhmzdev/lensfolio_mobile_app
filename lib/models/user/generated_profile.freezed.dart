// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generated_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneratedProfile {

@JsonKey(name: 'full_name') String get fullName; String get email; String? get designation;@JsonKey(name: 'city_state') String? get cityState; String? get about; String? get website;@JsonKey(name: 'contact_details') UserContactDetails? get contactDetails; List<String> get skills;@JsonKey(name: 'tech_stack') List<UserTechStack> get techStack;@JsonKey(name: 'preferred_roles') List<String> get preferredRoles; List<UserEducation> get education; List<UserExperience> get experience;
/// Create a copy of GeneratedProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratedProfileCopyWith<GeneratedProfile> get copyWith => _$GeneratedProfileCopyWithImpl<GeneratedProfile>(this as GeneratedProfile, _$identity);

  /// Serializes this GeneratedProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratedProfile&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.cityState, cityState) || other.cityState == cityState)&&(identical(other.about, about) || other.about == about)&&(identical(other.website, website) || other.website == website)&&(identical(other.contactDetails, contactDetails) || other.contactDetails == contactDetails)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.techStack, techStack)&&const DeepCollectionEquality().equals(other.preferredRoles, preferredRoles)&&const DeepCollectionEquality().equals(other.education, education)&&const DeepCollectionEquality().equals(other.experience, experience));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,designation,cityState,about,website,contactDetails,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(techStack),const DeepCollectionEquality().hash(preferredRoles),const DeepCollectionEquality().hash(education),const DeepCollectionEquality().hash(experience));

@override
String toString() {
  return 'GeneratedProfile(fullName: $fullName, email: $email, designation: $designation, cityState: $cityState, about: $about, website: $website, contactDetails: $contactDetails, skills: $skills, techStack: $techStack, preferredRoles: $preferredRoles, education: $education, experience: $experience)';
}


}

/// @nodoc
abstract mixin class $GeneratedProfileCopyWith<$Res>  {
  factory $GeneratedProfileCopyWith(GeneratedProfile value, $Res Function(GeneratedProfile) _then) = _$GeneratedProfileCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String fullName, String email, String? designation,@JsonKey(name: 'city_state') String? cityState, String? about, String? website,@JsonKey(name: 'contact_details') UserContactDetails? contactDetails, List<String> skills,@JsonKey(name: 'tech_stack') List<UserTechStack> techStack,@JsonKey(name: 'preferred_roles') List<String> preferredRoles, List<UserEducation> education, List<UserExperience> experience
});


$UserContactDetailsCopyWith<$Res>? get contactDetails;

}
/// @nodoc
class _$GeneratedProfileCopyWithImpl<$Res>
    implements $GeneratedProfileCopyWith<$Res> {
  _$GeneratedProfileCopyWithImpl(this._self, this._then);

  final GeneratedProfile _self;
  final $Res Function(GeneratedProfile) _then;

/// Create a copy of GeneratedProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? email = null,Object? designation = freezed,Object? cityState = freezed,Object? about = freezed,Object? website = freezed,Object? contactDetails = freezed,Object? skills = null,Object? techStack = null,Object? preferredRoles = null,Object? education = null,Object? experience = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,cityState: freezed == cityState ? _self.cityState : cityState // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,contactDetails: freezed == contactDetails ? _self.contactDetails : contactDetails // ignore: cast_nullable_to_non_nullable
as UserContactDetails?,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,techStack: null == techStack ? _self.techStack : techStack // ignore: cast_nullable_to_non_nullable
as List<UserTechStack>,preferredRoles: null == preferredRoles ? _self.preferredRoles : preferredRoles // ignore: cast_nullable_to_non_nullable
as List<String>,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as List<UserEducation>,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as List<UserExperience>,
  ));
}
/// Create a copy of GeneratedProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserContactDetailsCopyWith<$Res>? get contactDetails {
    if (_self.contactDetails == null) {
    return null;
  }

  return $UserContactDetailsCopyWith<$Res>(_self.contactDetails!, (value) {
    return _then(_self.copyWith(contactDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [GeneratedProfile].
extension GeneratedProfilePatterns on GeneratedProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneratedProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneratedProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneratedProfile value)  $default,){
final _that = this;
switch (_that) {
case _GeneratedProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneratedProfile value)?  $default,){
final _that = this;
switch (_that) {
case _GeneratedProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName,  String email,  String? designation, @JsonKey(name: 'city_state')  String? cityState,  String? about,  String? website, @JsonKey(name: 'contact_details')  UserContactDetails? contactDetails,  List<String> skills, @JsonKey(name: 'tech_stack')  List<UserTechStack> techStack, @JsonKey(name: 'preferred_roles')  List<String> preferredRoles,  List<UserEducation> education,  List<UserExperience> experience)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneratedProfile() when $default != null:
return $default(_that.fullName,_that.email,_that.designation,_that.cityState,_that.about,_that.website,_that.contactDetails,_that.skills,_that.techStack,_that.preferredRoles,_that.education,_that.experience);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName,  String email,  String? designation, @JsonKey(name: 'city_state')  String? cityState,  String? about,  String? website, @JsonKey(name: 'contact_details')  UserContactDetails? contactDetails,  List<String> skills, @JsonKey(name: 'tech_stack')  List<UserTechStack> techStack, @JsonKey(name: 'preferred_roles')  List<String> preferredRoles,  List<UserEducation> education,  List<UserExperience> experience)  $default,) {final _that = this;
switch (_that) {
case _GeneratedProfile():
return $default(_that.fullName,_that.email,_that.designation,_that.cityState,_that.about,_that.website,_that.contactDetails,_that.skills,_that.techStack,_that.preferredRoles,_that.education,_that.experience);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String fullName,  String email,  String? designation, @JsonKey(name: 'city_state')  String? cityState,  String? about,  String? website, @JsonKey(name: 'contact_details')  UserContactDetails? contactDetails,  List<String> skills, @JsonKey(name: 'tech_stack')  List<UserTechStack> techStack, @JsonKey(name: 'preferred_roles')  List<String> preferredRoles,  List<UserEducation> education,  List<UserExperience> experience)?  $default,) {final _that = this;
switch (_that) {
case _GeneratedProfile() when $default != null:
return $default(_that.fullName,_that.email,_that.designation,_that.cityState,_that.about,_that.website,_that.contactDetails,_that.skills,_that.techStack,_that.preferredRoles,_that.education,_that.experience);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneratedProfile implements GeneratedProfile {
  const _GeneratedProfile({@JsonKey(name: 'full_name') required this.fullName, required this.email, this.designation, @JsonKey(name: 'city_state') this.cityState, this.about, this.website, @JsonKey(name: 'contact_details') this.contactDetails, final  List<String> skills = const [], @JsonKey(name: 'tech_stack') final  List<UserTechStack> techStack = const [], @JsonKey(name: 'preferred_roles') final  List<String> preferredRoles = const [], final  List<UserEducation> education = const [], final  List<UserExperience> experience = const []}): _skills = skills,_techStack = techStack,_preferredRoles = preferredRoles,_education = education,_experience = experience;
  factory _GeneratedProfile.fromJson(Map<String, dynamic> json) => _$GeneratedProfileFromJson(json);

@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String email;
@override final  String? designation;
@override@JsonKey(name: 'city_state') final  String? cityState;
@override final  String? about;
@override final  String? website;
@override@JsonKey(name: 'contact_details') final  UserContactDetails? contactDetails;
 final  List<String> _skills;
@override@JsonKey() List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

 final  List<UserTechStack> _techStack;
@override@JsonKey(name: 'tech_stack') List<UserTechStack> get techStack {
  if (_techStack is EqualUnmodifiableListView) return _techStack;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_techStack);
}

 final  List<String> _preferredRoles;
@override@JsonKey(name: 'preferred_roles') List<String> get preferredRoles {
  if (_preferredRoles is EqualUnmodifiableListView) return _preferredRoles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preferredRoles);
}

 final  List<UserEducation> _education;
@override@JsonKey() List<UserEducation> get education {
  if (_education is EqualUnmodifiableListView) return _education;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_education);
}

 final  List<UserExperience> _experience;
@override@JsonKey() List<UserExperience> get experience {
  if (_experience is EqualUnmodifiableListView) return _experience;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_experience);
}


/// Create a copy of GeneratedProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratedProfileCopyWith<_GeneratedProfile> get copyWith => __$GeneratedProfileCopyWithImpl<_GeneratedProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratedProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratedProfile&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.cityState, cityState) || other.cityState == cityState)&&(identical(other.about, about) || other.about == about)&&(identical(other.website, website) || other.website == website)&&(identical(other.contactDetails, contactDetails) || other.contactDetails == contactDetails)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._techStack, _techStack)&&const DeepCollectionEquality().equals(other._preferredRoles, _preferredRoles)&&const DeepCollectionEquality().equals(other._education, _education)&&const DeepCollectionEquality().equals(other._experience, _experience));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,designation,cityState,about,website,contactDetails,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_techStack),const DeepCollectionEquality().hash(_preferredRoles),const DeepCollectionEquality().hash(_education),const DeepCollectionEquality().hash(_experience));

@override
String toString() {
  return 'GeneratedProfile(fullName: $fullName, email: $email, designation: $designation, cityState: $cityState, about: $about, website: $website, contactDetails: $contactDetails, skills: $skills, techStack: $techStack, preferredRoles: $preferredRoles, education: $education, experience: $experience)';
}


}

/// @nodoc
abstract mixin class _$GeneratedProfileCopyWith<$Res> implements $GeneratedProfileCopyWith<$Res> {
  factory _$GeneratedProfileCopyWith(_GeneratedProfile value, $Res Function(_GeneratedProfile) _then) = __$GeneratedProfileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String fullName, String email, String? designation,@JsonKey(name: 'city_state') String? cityState, String? about, String? website,@JsonKey(name: 'contact_details') UserContactDetails? contactDetails, List<String> skills,@JsonKey(name: 'tech_stack') List<UserTechStack> techStack,@JsonKey(name: 'preferred_roles') List<String> preferredRoles, List<UserEducation> education, List<UserExperience> experience
});


@override $UserContactDetailsCopyWith<$Res>? get contactDetails;

}
/// @nodoc
class __$GeneratedProfileCopyWithImpl<$Res>
    implements _$GeneratedProfileCopyWith<$Res> {
  __$GeneratedProfileCopyWithImpl(this._self, this._then);

  final _GeneratedProfile _self;
  final $Res Function(_GeneratedProfile) _then;

/// Create a copy of GeneratedProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? email = null,Object? designation = freezed,Object? cityState = freezed,Object? about = freezed,Object? website = freezed,Object? contactDetails = freezed,Object? skills = null,Object? techStack = null,Object? preferredRoles = null,Object? education = null,Object? experience = null,}) {
  return _then(_GeneratedProfile(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,cityState: freezed == cityState ? _self.cityState : cityState // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,contactDetails: freezed == contactDetails ? _self.contactDetails : contactDetails // ignore: cast_nullable_to_non_nullable
as UserContactDetails?,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,techStack: null == techStack ? _self._techStack : techStack // ignore: cast_nullable_to_non_nullable
as List<UserTechStack>,preferredRoles: null == preferredRoles ? _self._preferredRoles : preferredRoles // ignore: cast_nullable_to_non_nullable
as List<String>,education: null == education ? _self._education : education // ignore: cast_nullable_to_non_nullable
as List<UserEducation>,experience: null == experience ? _self._experience : experience // ignore: cast_nullable_to_non_nullable
as List<UserExperience>,
  ));
}

/// Create a copy of GeneratedProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserContactDetailsCopyWith<$Res>? get contactDetails {
    if (_self.contactDetails == null) {
    return null;
  }

  return $UserContactDetailsCopyWith<$Res>(_self.contactDetails!, (value) {
    return _then(_self.copyWith(contactDetails: value));
  });
}
}

// dart format on
