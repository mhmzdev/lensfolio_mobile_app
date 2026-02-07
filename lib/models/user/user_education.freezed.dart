// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEducation {

 String get degree; String get school;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime? get endDate;
/// Create a copy of UserEducation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEducationCopyWith<UserEducation> get copyWith => _$UserEducationCopyWithImpl<UserEducation>(this as UserEducation, _$identity);

  /// Serializes this UserEducation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEducation&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.school, school) || other.school == school)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,degree,school,startDate,endDate);

@override
String toString() {
  return 'UserEducation(degree: $degree, school: $school, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $UserEducationCopyWith<$Res>  {
  factory $UserEducationCopyWith(UserEducation value, $Res Function(UserEducation) _then) = _$UserEducationCopyWithImpl;
@useResult
$Res call({
 String degree, String school,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime? endDate
});




}
/// @nodoc
class _$UserEducationCopyWithImpl<$Res>
    implements $UserEducationCopyWith<$Res> {
  _$UserEducationCopyWithImpl(this._self, this._then);

  final UserEducation _self;
  final $Res Function(UserEducation) _then;

/// Create a copy of UserEducation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? degree = null,Object? school = null,Object? startDate = null,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,school: null == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEducation].
extension UserEducationPatterns on UserEducation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEducation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEducation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEducation value)  $default,){
final _that = this;
switch (_that) {
case _UserEducation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEducation value)?  $default,){
final _that = this;
switch (_that) {
case _UserEducation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String degree,  String school, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEducation() when $default != null:
return $default(_that.degree,_that.school,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String degree,  String school, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate)  $default,) {final _that = this;
switch (_that) {
case _UserEducation():
return $default(_that.degree,_that.school,_that.startDate,_that.endDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String degree,  String school, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate)?  $default,) {final _that = this;
switch (_that) {
case _UserEducation() when $default != null:
return $default(_that.degree,_that.school,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEducation implements UserEducation {
  const _UserEducation({required this.degree, required this.school, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') this.endDate});
  factory _UserEducation.fromJson(Map<String, dynamic> json) => _$UserEducationFromJson(json);

@override final  String degree;
@override final  String school;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime? endDate;

/// Create a copy of UserEducation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEducationCopyWith<_UserEducation> get copyWith => __$UserEducationCopyWithImpl<_UserEducation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEducationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEducation&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.school, school) || other.school == school)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,degree,school,startDate,endDate);

@override
String toString() {
  return 'UserEducation(degree: $degree, school: $school, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$UserEducationCopyWith<$Res> implements $UserEducationCopyWith<$Res> {
  factory _$UserEducationCopyWith(_UserEducation value, $Res Function(_UserEducation) _then) = __$UserEducationCopyWithImpl;
@override @useResult
$Res call({
 String degree, String school,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime? endDate
});




}
/// @nodoc
class __$UserEducationCopyWithImpl<$Res>
    implements _$UserEducationCopyWith<$Res> {
  __$UserEducationCopyWithImpl(this._self, this._then);

  final _UserEducation _self;
  final $Res Function(_UserEducation) _then;

/// Create a copy of UserEducation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? degree = null,Object? school = null,Object? startDate = null,Object? endDate = freezed,}) {
  return _then(_UserEducation(
degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,school: null == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
