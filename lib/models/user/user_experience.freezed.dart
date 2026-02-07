// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserExperience {

 String get company; String get designation;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime? get endDate; List<String> get responsibilities;
/// Create a copy of UserExperience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserExperienceCopyWith<UserExperience> get copyWith => _$UserExperienceCopyWithImpl<UserExperience>(this as UserExperience, _$identity);

  /// Serializes this UserExperience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserExperience&&(identical(other.company, company) || other.company == company)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.responsibilities, responsibilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,company,designation,startDate,endDate,const DeepCollectionEquality().hash(responsibilities));

@override
String toString() {
  return 'UserExperience(company: $company, designation: $designation, startDate: $startDate, endDate: $endDate, responsibilities: $responsibilities)';
}


}

/// @nodoc
abstract mixin class $UserExperienceCopyWith<$Res>  {
  factory $UserExperienceCopyWith(UserExperience value, $Res Function(UserExperience) _then) = _$UserExperienceCopyWithImpl;
@useResult
$Res call({
 String company, String designation,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime? endDate, List<String> responsibilities
});




}
/// @nodoc
class _$UserExperienceCopyWithImpl<$Res>
    implements $UserExperienceCopyWith<$Res> {
  _$UserExperienceCopyWithImpl(this._self, this._then);

  final UserExperience _self;
  final $Res Function(UserExperience) _then;

/// Create a copy of UserExperience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? company = null,Object? designation = null,Object? startDate = null,Object? endDate = freezed,Object? responsibilities = null,}) {
  return _then(_self.copyWith(
company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,designation: null == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,responsibilities: null == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserExperience].
extension UserExperiencePatterns on UserExperience {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserExperience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserExperience() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserExperience value)  $default,){
final _that = this;
switch (_that) {
case _UserExperience():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserExperience value)?  $default,){
final _that = this;
switch (_that) {
case _UserExperience() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String company,  String designation, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate,  List<String> responsibilities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserExperience() when $default != null:
return $default(_that.company,_that.designation,_that.startDate,_that.endDate,_that.responsibilities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String company,  String designation, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate,  List<String> responsibilities)  $default,) {final _that = this;
switch (_that) {
case _UserExperience():
return $default(_that.company,_that.designation,_that.startDate,_that.endDate,_that.responsibilities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String company,  String designation, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate,  List<String> responsibilities)?  $default,) {final _that = this;
switch (_that) {
case _UserExperience() when $default != null:
return $default(_that.company,_that.designation,_that.startDate,_that.endDate,_that.responsibilities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserExperience implements UserExperience {
  const _UserExperience({required this.company, required this.designation, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') this.endDate, required final  List<String> responsibilities}): _responsibilities = responsibilities;
  factory _UserExperience.fromJson(Map<String, dynamic> json) => _$UserExperienceFromJson(json);

@override final  String company;
@override final  String designation;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime? endDate;
 final  List<String> _responsibilities;
@override List<String> get responsibilities {
  if (_responsibilities is EqualUnmodifiableListView) return _responsibilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responsibilities);
}


/// Create a copy of UserExperience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserExperienceCopyWith<_UserExperience> get copyWith => __$UserExperienceCopyWithImpl<_UserExperience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserExperience&&(identical(other.company, company) || other.company == company)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._responsibilities, _responsibilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,company,designation,startDate,endDate,const DeepCollectionEquality().hash(_responsibilities));

@override
String toString() {
  return 'UserExperience(company: $company, designation: $designation, startDate: $startDate, endDate: $endDate, responsibilities: $responsibilities)';
}


}

/// @nodoc
abstract mixin class _$UserExperienceCopyWith<$Res> implements $UserExperienceCopyWith<$Res> {
  factory _$UserExperienceCopyWith(_UserExperience value, $Res Function(_UserExperience) _then) = __$UserExperienceCopyWithImpl;
@override @useResult
$Res call({
 String company, String designation,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime? endDate, List<String> responsibilities
});




}
/// @nodoc
class __$UserExperienceCopyWithImpl<$Res>
    implements _$UserExperienceCopyWith<$Res> {
  __$UserExperienceCopyWithImpl(this._self, this._then);

  final _UserExperience _self;
  final $Res Function(_UserExperience) _then;

/// Create a copy of UserExperience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? company = null,Object? designation = null,Object? startDate = null,Object? endDate = freezed,Object? responsibilities = null,}) {
  return _then(_UserExperience(
company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,designation: null == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,responsibilities: null == responsibilities ? _self._responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
