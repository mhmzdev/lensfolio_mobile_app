// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserData {

/// 'id' is the user's id in the database. We'll use this
/// to do operations related to the user's data.
 int get id;/// 'uuid' is the user's uuid created by SupebaseAuth.
/// We'll use this to do operations related to the user's
/// account.
///
/// String uuid, // THIS IS NOT IN USER_DATA but in USER from SupabaseAuth
///
@JsonKey(name: 'full_name') String get fullName; String get email; String? get designation;@JsonKey(name: 'city_state') String? get cityState;@JsonKey(name: 'resume_url') String? get resumeUrl;@JsonKey(name: 'profile_picture') String? get profilePicture; String? get about; String? get website;@JsonKey(name: 'contact_details') UserContactDetails? get contactDetails; List<String> get skills;@JsonKey(name: 'tech_stack') List<UserTechStack> get techStack;@JsonKey(name: 'preferred_roles') List<String> get preferredRoles;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.cityState, cityState) || other.cityState == cityState)&&(identical(other.resumeUrl, resumeUrl) || other.resumeUrl == resumeUrl)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.about, about) || other.about == about)&&(identical(other.website, website) || other.website == website)&&(identical(other.contactDetails, contactDetails) || other.contactDetails == contactDetails)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.techStack, techStack)&&const DeepCollectionEquality().equals(other.preferredRoles, preferredRoles)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,designation,cityState,resumeUrl,profilePicture,about,website,contactDetails,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(techStack),const DeepCollectionEquality().hash(preferredRoles),createdAt);

@override
String toString() {
  return 'UserData(id: $id, fullName: $fullName, email: $email, designation: $designation, cityState: $cityState, resumeUrl: $resumeUrl, profilePicture: $profilePicture, about: $about, website: $website, contactDetails: $contactDetails, skills: $skills, techStack: $techStack, preferredRoles: $preferredRoles, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'full_name') String fullName, String email, String? designation,@JsonKey(name: 'city_state') String? cityState,@JsonKey(name: 'resume_url') String? resumeUrl,@JsonKey(name: 'profile_picture') String? profilePicture, String? about, String? website,@JsonKey(name: 'contact_details') UserContactDetails? contactDetails, List<String> skills,@JsonKey(name: 'tech_stack') List<UserTechStack> techStack,@JsonKey(name: 'preferred_roles') List<String> preferredRoles,@JsonKey(name: 'created_at') DateTime createdAt
});


$UserContactDetailsCopyWith<$Res>? get contactDetails;

}
/// @nodoc
class _$UserDataCopyWithImpl<$Res>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? designation = freezed,Object? cityState = freezed,Object? resumeUrl = freezed,Object? profilePicture = freezed,Object? about = freezed,Object? website = freezed,Object? contactDetails = freezed,Object? skills = null,Object? techStack = null,Object? preferredRoles = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,cityState: freezed == cityState ? _self.cityState : cityState // ignore: cast_nullable_to_non_nullable
as String?,resumeUrl: freezed == resumeUrl ? _self.resumeUrl : resumeUrl // ignore: cast_nullable_to_non_nullable
as String?,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,contactDetails: freezed == contactDetails ? _self.contactDetails : contactDetails // ignore: cast_nullable_to_non_nullable
as UserContactDetails?,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,techStack: null == techStack ? _self.techStack : techStack // ignore: cast_nullable_to_non_nullable
as List<UserTechStack>,preferredRoles: null == preferredRoles ? _self.preferredRoles : preferredRoles // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of UserData
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


/// Adds pattern-matching-related methods to [UserData].
extension UserDataPatterns on UserData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserData value)  $default,){
final _that = this;
switch (_that) {
case _UserData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserData value)?  $default,){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'full_name')  String fullName,  String email,  String? designation, @JsonKey(name: 'city_state')  String? cityState, @JsonKey(name: 'resume_url')  String? resumeUrl, @JsonKey(name: 'profile_picture')  String? profilePicture,  String? about,  String? website, @JsonKey(name: 'contact_details')  UserContactDetails? contactDetails,  List<String> skills, @JsonKey(name: 'tech_stack')  List<UserTechStack> techStack, @JsonKey(name: 'preferred_roles')  List<String> preferredRoles, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.designation,_that.cityState,_that.resumeUrl,_that.profilePicture,_that.about,_that.website,_that.contactDetails,_that.skills,_that.techStack,_that.preferredRoles,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'full_name')  String fullName,  String email,  String? designation, @JsonKey(name: 'city_state')  String? cityState, @JsonKey(name: 'resume_url')  String? resumeUrl, @JsonKey(name: 'profile_picture')  String? profilePicture,  String? about,  String? website, @JsonKey(name: 'contact_details')  UserContactDetails? contactDetails,  List<String> skills, @JsonKey(name: 'tech_stack')  List<UserTechStack> techStack, @JsonKey(name: 'preferred_roles')  List<String> preferredRoles, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserData():
return $default(_that.id,_that.fullName,_that.email,_that.designation,_that.cityState,_that.resumeUrl,_that.profilePicture,_that.about,_that.website,_that.contactDetails,_that.skills,_that.techStack,_that.preferredRoles,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'full_name')  String fullName,  String email,  String? designation, @JsonKey(name: 'city_state')  String? cityState, @JsonKey(name: 'resume_url')  String? resumeUrl, @JsonKey(name: 'profile_picture')  String? profilePicture,  String? about,  String? website, @JsonKey(name: 'contact_details')  UserContactDetails? contactDetails,  List<String> skills, @JsonKey(name: 'tech_stack')  List<UserTechStack> techStack, @JsonKey(name: 'preferred_roles')  List<String> preferredRoles, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.designation,_that.cityState,_that.resumeUrl,_that.profilePicture,_that.about,_that.website,_that.contactDetails,_that.skills,_that.techStack,_that.preferredRoles,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserData extends UserData {
   _UserData({required this.id, @JsonKey(name: 'full_name') required this.fullName, required this.email, this.designation, @JsonKey(name: 'city_state') this.cityState, @JsonKey(name: 'resume_url') this.resumeUrl, @JsonKey(name: 'profile_picture') this.profilePicture, this.about, this.website, @JsonKey(name: 'contact_details') this.contactDetails, final  List<String> skills = const [], @JsonKey(name: 'tech_stack') final  List<UserTechStack> techStack = const [], @JsonKey(name: 'preferred_roles') final  List<String> preferredRoles = const [], @JsonKey(name: 'created_at') required this.createdAt}): _skills = skills,_techStack = techStack,_preferredRoles = preferredRoles,super._();
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

/// 'id' is the user's id in the database. We'll use this
/// to do operations related to the user's data.
@override final  int id;
/// 'uuid' is the user's uuid created by SupebaseAuth.
/// We'll use this to do operations related to the user's
/// account.
///
/// String uuid, // THIS IS NOT IN USER_DATA but in USER from SupabaseAuth
///
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String email;
@override final  String? designation;
@override@JsonKey(name: 'city_state') final  String? cityState;
@override@JsonKey(name: 'resume_url') final  String? resumeUrl;
@override@JsonKey(name: 'profile_picture') final  String? profilePicture;
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

@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataCopyWith<_UserData> get copyWith => __$UserDataCopyWithImpl<_UserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.cityState, cityState) || other.cityState == cityState)&&(identical(other.resumeUrl, resumeUrl) || other.resumeUrl == resumeUrl)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.about, about) || other.about == about)&&(identical(other.website, website) || other.website == website)&&(identical(other.contactDetails, contactDetails) || other.contactDetails == contactDetails)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._techStack, _techStack)&&const DeepCollectionEquality().equals(other._preferredRoles, _preferredRoles)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,designation,cityState,resumeUrl,profilePicture,about,website,contactDetails,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_techStack),const DeepCollectionEquality().hash(_preferredRoles),createdAt);

@override
String toString() {
  return 'UserData(id: $id, fullName: $fullName, email: $email, designation: $designation, cityState: $cityState, resumeUrl: $resumeUrl, profilePicture: $profilePicture, about: $about, website: $website, contactDetails: $contactDetails, skills: $skills, techStack: $techStack, preferredRoles: $preferredRoles, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'full_name') String fullName, String email, String? designation,@JsonKey(name: 'city_state') String? cityState,@JsonKey(name: 'resume_url') String? resumeUrl,@JsonKey(name: 'profile_picture') String? profilePicture, String? about, String? website,@JsonKey(name: 'contact_details') UserContactDetails? contactDetails, List<String> skills,@JsonKey(name: 'tech_stack') List<UserTechStack> techStack,@JsonKey(name: 'preferred_roles') List<String> preferredRoles,@JsonKey(name: 'created_at') DateTime createdAt
});


@override $UserContactDetailsCopyWith<$Res>? get contactDetails;

}
/// @nodoc
class __$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? designation = freezed,Object? cityState = freezed,Object? resumeUrl = freezed,Object? profilePicture = freezed,Object? about = freezed,Object? website = freezed,Object? contactDetails = freezed,Object? skills = null,Object? techStack = null,Object? preferredRoles = null,Object? createdAt = null,}) {
  return _then(_UserData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,cityState: freezed == cityState ? _self.cityState : cityState // ignore: cast_nullable_to_non_nullable
as String?,resumeUrl: freezed == resumeUrl ? _self.resumeUrl : resumeUrl // ignore: cast_nullable_to_non_nullable
as String?,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,contactDetails: freezed == contactDetails ? _self.contactDetails : contactDetails // ignore: cast_nullable_to_non_nullable
as UserContactDetails?,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,techStack: null == techStack ? _self._techStack : techStack // ignore: cast_nullable_to_non_nullable
as List<UserTechStack>,preferredRoles: null == preferredRoles ? _self._preferredRoles : preferredRoles // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of UserData
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
